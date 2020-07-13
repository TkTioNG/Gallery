using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Gallery
{
    public partial class WishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] != null)
            {
                if (!IsPostBack)
                {
                    this.BindRepeater();
                }
            }
            else
            {
                plsLogin.Visible = true;
                mainContent.Visible = false;
            }
            
        }

        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int userID = int.Parse(Session["UserID"] as String);
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT P.ProductID, P.ProductName, P.Image, C.CategoryName, U.UserName, P.Price, P.Description, P.Stock, P.Sales FROM WishingList AS WL, Users AS U, Product AS P, Category AS C WHERE WL.ProductID = P.ProductID AND WL.UserID = U.UserID AND P.CategoryID = C.CategoryID AND WL.UserID = @UserID ORDER BY 1 DESC", con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
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
        }
        
        protected void OnEdit(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            int productID = int.Parse((item.FindControl("lblProductID") as Label).Text);
            int userID = int.Parse(Session["UserID"] as String);

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete FROM WishingList WHERE ProductID = @ProductID AND UserID = @UserID", con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO ShoppingCart Values (@UserID, @ProductID, @Quantity)", con))
                    {
                        cmd.Parameters.AddWithValue("@ProductID", productID);
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.Parameters.AddWithValue("@Quantity", 1);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The product is successfully placed in your shopping cart.');window.location ='ShoppingCart.aspx';", true);
            }
            catch
            {
                ClientScript.RegisterStartupScript(typeof(Page), "script", "alert(\'You already has this product in your shopping cart already.\');", true);
            }
            this.BindRepeater();
        }
        
        protected void OnDelete(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            int productId = int.Parse((item.FindControl("lblProductID") as Label).Text);
            //get UserID
            int userId = int.Parse(Session["UserID"] as String);

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete FROM WishingList WHERE ProductID = @ProductID AND UserID = @UserID", con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
        }
    }
}