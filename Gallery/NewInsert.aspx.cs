using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Gallery
{
    public partial class NewInsert : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                this.BindRepeater();
            }
            UpdateNewDataTable();
        }

        private void UpdateNewDataTable()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(constr);
            SqlCommand cmd1 = new SqlCommand("Update NewData set ProductID = (Select max(ProductID) from Product) + 1, UserID = (Select max(UserID) from Users) + 1", con1);
            con1.Open();
            cmd1.ExecuteNonQuery();
            con1.Close();

            SqlDataSource1.DataBind();
            ddlMaxProdID.DataBind();
            lblMaxProdID.Text = ddlMaxProdID.Items[0].Value;
        }

        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select product.*, category.CategoryName, users.UserName from product, category, users where product.SalerID = users.UserID AND product.categoryID = category.categoryID", con))
                {
                    //cmd.Parameters.AddWithValue("@Action", "SELECT");
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        //cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Connection = con;
                        //sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            RepeaterNew.DataSource = dt;
                            RepeaterNew.DataBind();
                            lblListCountNew.Text = RepeaterNew.Items.Count.ToString();
                        }
                    }
                }
            }
            UpdateNewDataTable();
        }

        protected void OnEdit(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            this.ToogleElement(item, true);
        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            int productId = int.Parse((item.FindControl("lblProductID") as Label).Text);
            string productName = (item.FindControl("txtProductNameNew") as TextBox).Text;
            int stock = int.Parse((item.FindControl("txtStockNew") as TextBox).Text);
            int catID = int.Parse((item.FindControl("ddlCatNew") as DropDownList).SelectedValue);
            double price = double.Parse((item.FindControl("txtPriceNew") as TextBox).Text);
            string desc = (item.FindControl("txtDescNew") as TextBox).Text;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Update Product set ProductName = @productName, Stock = @stock, CategoryID = @catID, Price = @price, Description = @desc Where ProductID = @ProductID", con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@ProductName", productName);
                    cmd.Parameters.AddWithValue("@stock", stock);
                    cmd.Parameters.AddWithValue("@catID", catID);
                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Parameters.AddWithValue("@desc", desc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
        }

        protected void OnDelete(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            int productId = int.Parse((item.FindControl("lblProductID") as Label).Text);

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete From Product Where ProductID = @ProductID", con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
            //Response.Redirect(Request.RawUrl);
        }

        protected void OnCancel(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            this.ToogleElement(item, false);
        }

        private void ToogleElement(RepeaterItem item, bool isEdit)
        {
            //ToggleLabels
            item.FindControl("lblProductNameNew").Visible = !isEdit;
            item.FindControl("lblStockNew").Visible = !isEdit;
            item.FindControl("lblCatNew").Visible = !isEdit;
            item.FindControl("lblPriceNew").Visible = !isEdit;
            item.FindControl("lblDescNew").Visible = !isEdit;

            //Toggle UpdateTextBox
            item.FindControl("txtProductNameNew").Visible = isEdit;
            item.FindControl("txtStockNew").Visible = isEdit;
            item.FindControl("ddlCatNew").Visible = isEdit;
            item.FindControl("txtPriceNew").Visible = isEdit;
            item.FindControl("txtDescNew").Visible = isEdit;

            //Toggle Control Buttons
            item.FindControl("btnEdit").Visible = !isEdit;
            item.FindControl("btnUpdate").Visible = isEdit;
            item.FindControl("btnCancel").Visible = isEdit;
            item.FindControl("btnDelete").Visible = !isEdit;
        }

        protected void OnInsert(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            int productID = int.Parse(lblMaxProdID.Text);
            string productName = txtInProductName.Text;
            int salerID = int.Parse(Session["UserID"] as String);
            string image = ImageUpload.ImageUrl;
            int stock = int.Parse(txtInStock.Text);
            int sales = 0;
            int catID = int.Parse(ddlInCat.SelectedValue);
            double price = double.Parse(txtInPrice.Text);
            string desc = txtInDesc.Text;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert into Product values (@ProductID, @ProductName, @SalerID, @Image, @stock, @sales, @catID, @desc, @price)", con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    cmd.Parameters.AddWithValue("@ProductName", productName);
                    cmd.Parameters.AddWithValue("@SalerID", salerID);
                    cmd.Parameters.AddWithValue("@Image", image);
                    cmd.Parameters.AddWithValue("@stock", stock);
                    cmd.Parameters.AddWithValue("@sales", sales);
                    cmd.Parameters.AddWithValue("@catID", catID);
                    cmd.Parameters.AddWithValue("@desc", desc);
                    cmd.Parameters.AddWithValue("@price", price);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
            Response.Redirect("~/New.aspx");
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

            }
        }

        protected void InsertCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/New.aspx");
        }

        protected void BtnInsertNew_Click(object sender, EventArgs e)
        {
            lblStatus.Text = "true";
        }
    }
}