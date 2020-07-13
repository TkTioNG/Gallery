using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Gallery
{
    public partial class GalleryShowDown : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                if (Request.QueryString["GalleryName"] != null)
                {
                    this.DisplayGallery();
                }
                else
                {
                    this.ShowGallery();
                }
            }
        }

        private void BindRepeater()
        {
            string galleryName = lblGalleryName.Text;
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Image FROM GalleryPhoto WHERE GalleryName = @GalleryName", con))
                {
                    cmd.Parameters.AddWithValue("@GalleryName", galleryName);
                    con.Open();
                    using(SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using(DataTable dt = new DataTable())
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

        private void DisplayGallery()
        {
            string GalleryName = Request.QueryString["GalleryName"];
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT G.GalleryName, U.UserName, G.ProductID, G.Description, G.Image FROM Gallery AS G, Users AS U WHERE G.UserID = U.UserID AND G.GalleryName = @GalleryName", con))
                {
                    cmd.Parameters.AddWithValue("@GalleryName", GalleryName);
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read(); // get the first row

                            string galleryName = sdr.GetString(0);
                            string userName = sdr.GetString(1);
                            int productID;
                            string productName;
                            string description = sdr.GetString(3).Replace("/n", "<br />");
                            string image = sdr.GetString(4);

                            if (!sdr.IsDBNull(2))
                            {
                                productID = sdr.GetInt32(2);
                                productName = "Go To The Store";
                                using (SqlConnection con1 = new SqlConnection(constr))
                                {
                                    using (SqlCommand cmd1 = new SqlCommand("SELECT ProductName FROM Product WHERE ProductID = @ProductID", con1))
                                    {
                                        cmd1.Parameters.AddWithValue("@ProductID", productID);
                                        con1.Open();
                                        using (SqlDataReader sdr1 = cmd1.ExecuteReader())
                                        {
                                            if (sdr1.HasRows)
                                            {
                                                sdr1.Read();
                                                productName = sdr1.GetString(0);
                                            }
                                        }
                                        con1.Close();
                                    }
                                }
                                productLink.HRef = "GalleryDetails.aspx?productID=" + productID;
                                lblProductName.Text = productName;
                                productLink2.HRef = "GalleryDetails.aspx?productID=" + productID;
                                lblProductName2.Text = productName;
                            }
                            else
                            {
                                productDiv.Visible = false;
                                productDiv2.Visible = false;
                            }

                            lblGalleryName.Text = galleryName;
                            lblUserName.Text = userName;
                            lblDescription.Text = description;
                            //mainImage.ImageUrl = image;
                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.Text = "No Gallery is Selected.";
                        }
                    }
                    con.Close();
                }
            }
            BindRepeater();
        }

        private void ShowGallery ()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT G.GalleryName, U.UserName, G.ProductID, G.Description, G.Image FROM Gallery AS G, Users AS U WHERE G.UserID = U.UserID", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read(); // get the first row

                            string galleryName = sdr.GetString(0);
                            string userName = sdr.GetString(1);
                            int productID;
                            string productName;
                            string description = sdr.GetString(3).Replace("/n", "<br />");
                            string image = sdr.GetString(4);

                            if(!sdr.IsDBNull(2))
                            {
                                productID = sdr.GetInt32(2);
                                productName = "Go To The Store";
                                using (SqlConnection con1 = new SqlConnection(constr))
                                {
                                    using (SqlCommand cmd1 = new SqlCommand("SELECT ProductName FROM Product WHERE ProductID = @ProductID", con1))
                                    {
                                        cmd1.Parameters.AddWithValue("@ProductID", productID);
                                        con1.Open();
                                        using (SqlDataReader sdr1 = cmd1.ExecuteReader())
                                        {
                                            if (sdr1.HasRows)
                                            {
                                                sdr1.Read();
                                                productName = sdr1.GetString(0);
                                            }
                                        }
                                        con1.Close();
                                    }
                                }
                                productLink.HRef = "GalleryDetails.aspx?productID=" + productID;
                                lblProductName.Text = productName;
                                productLink2.HRef = "GalleryDetails.aspx?productID=" + productID;
                                lblProductName2.Text = productName;
                            }
                            else
                            {
                                productDiv.Visible = false;
                                productDiv2.Visible = false;
                            }

                            lblGalleryName.Text = galleryName;
                            lblUserName.Text = userName;
                            lblDescription.Text = description;
                            //mainImage.ImageUrl = image;
                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.Text = "No Gallery is Selected.";
                        }
                    }
                    con.Close();
                }
            }
            BindRepeater();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {                   
            if (FileUpload1.HasFile || FileUpload1.HasFiles)
            {
                foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
                {
                    string galleryName = lblGalleryName.Text;
                    string filename = "Images/" + Path.GetFileName(postedFile.FileName);
                    lblFileName.Text = filename;
                    try
                    {
                        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            using (SqlCommand cmd = new SqlCommand("insert into GalleryPhoto values(@GalleryName, @FileName)", con))
                            {
                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@GalleryName", galleryName);
                                cmd.Parameters.AddWithValue("@FileName", filename);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                                lblFileName.Text = filename;
                            }
                        }
                    }
                    catch
                    {
                        ClientScript.RegisterStartupScript(typeof(Page), "script", "alert(\'" + filename + " is possibly duplicated.\\nIt will not be uploaded.\');", true);
                    }
                }
            }
            else
            {
                lblFileName.Text = "No File Selected.";
            }
            BindRepeater();
        }        
    }
}