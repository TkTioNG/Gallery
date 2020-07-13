using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Gallery
{
    public partial class MyGalleryInsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["Login"];
            if (cookie != null)
            {
                Session["UserID"] = cookie["UserID"];
                Session["UserType"] = cookie["UserType"];
                Session["UserName"] = cookie["UserName"];
            }
            if (Session["UserType"] != null)
            {
                if ((Session["UserType"] as String) == "cosplayer")
                {
                    myGalleryList.Visible = true;
                    myProductList.Visible = true;
                }
            }
            if (!string.IsNullOrEmpty(Session["UserName"] as String))
            {
                myAccount.InnerHtml = Session["UserName"].ToString();
            }
            if (!IsPostBack)
            {
                this.BindRepeater();
            }
        }

        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT G.GalleryName, U.UserName, G.Image FROM Gallery AS G, Users AS U WHERE G.UserID = U.UserID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                            lblListCountNew.Text = Repeater1.Items.Count.ToString();
                        }
                    }
                }
            }
        }

        protected void OnInsert(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                //bool error = false;
                string galleryName = txtInGalleryName.Text;
                int userID = int.Parse(Session["UserID"] as String);
                string description = txtInDesc.Text;
                string images = ImageUpload.ImageUrl;
                if (txtInProductName.Text != "")
                {       
                    int productID = int.Parse(txtInProductName.Text);
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Gallery Values (@GalleryName, @UserID, @ProductID, @Description, @Images)", con))
                    {
                        cmd.Parameters.AddWithValue("@GalleryName", galleryName);
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.Parameters.AddWithValue("@ProductID", productID);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@Images", images);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }        
                }
                else
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Gallery (GalleryName, UserID, Description, Image) Values (@GalleryName, @UserID, @Description, @Images)", con))
                    {
                        cmd.Parameters.AddWithValue("@GalleryName", galleryName);
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@Images", images);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            using (SqlConnection con = new SqlConnection(constr))
            {
                string galleryName = txtInGalleryName.Text;
                string images = ImageUpload.ImageUrl;
                using (SqlCommand cmd = new SqlCommand("INSERT INTO GalleryPhoto Values (@GalleryName, @Images)", con))
                {
                    cmd.Parameters.AddWithValue("@GalleryName", galleryName);
                    cmd.Parameters.AddWithValue("@Images", images);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                foreach (HttpPostedFile postedFile in FileUpload2.PostedFiles)
                {
                    try
                    {
                        images = "Images/" + postedFile.FileName;
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO GalleryPhoto Values (@GalleryName, @Images)", con))
                        {
                            cmd.Parameters.AddWithValue("@GalleryName", galleryName);
                            cmd.Parameters.AddWithValue("@Images", images);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    catch
                    {
                        ClientScript.RegisterStartupScript(typeof(Page), "script", "alert(\'" + images + " is possibly duplicated.\\nIt will not be uploaded.\');", true);
                    }
                }                
            }
            Response.Redirect("~/MyGallery.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFiles)
            {
                string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "svg" };
                string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }

                if (!isValidFile)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Invalid File. Please upload a File with extension " + string.Join(",", validFileTypes);
                }
                else
                {
                    ImageUpload.ImageUrl = "Images/" + FileUpload1.PostedFile.FileName;
                    Label1.Text = FileUpload1.PostedFile.FileName;
                }
            }
            else
            {
                Label2.Text = "No File Selected.";
            }
        }

        protected void btnUpload2_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile || FileUpload2.HasFiles)
            {
                int count = 0;
                foreach (HttpPostedFile postedFile in FileUpload2.PostedFiles)
                {
                    string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "svg" };
                    string ext = System.IO.Path.GetExtension(postedFile.FileName).ToLower();
                    bool isValidFile = false;
                    for (int i = 0; i < validFileTypes.Length; i++)
                    {
                        if (ext == "." + validFileTypes[i])
                        {
                            isValidFile = true;
                            break;
                        }
                    }

                    if (!isValidFile)
                    {
                        ClientScript.RegisterStartupScript(typeof(Page), "script", "alert(\'" + postedFile.FileName + " is not a proper image file type.\');", true);
                    }
                    else
                    {
                        count++;
                    }
                }
                Label2.Text = count.ToString() + " photos is selected.";
            }
            else
            {
                Label2.Text = "No File Selected.";
            }
        }

        protected void InsertCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyGallery.aspx");
        }
        protected void AddGallery(object sender, EventArgs e)
        {
            Response.Redirect("~/MyGalleryInsert.aspx");
        }
    }
}