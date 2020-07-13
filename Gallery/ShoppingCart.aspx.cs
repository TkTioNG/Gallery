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
    public partial class ShoppingCart : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT P.ProductID, P.ProductName, P.Image, C.CategoryName, U.UserName, P.Price, SC.Quantity, P.Price * SC.Quantity AS Total, P.Description FROM ShoppingCart AS SC, Users AS U, Product AS P, Category AS C WHERE SC.ProductID = P.ProductID AND SC.UserID = U.UserID AND P.CategoryID = C.CategoryID AND SC.UserID = @UserID ORDER BY 1 DESC", con))
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
            ToogleElement(item, true);
        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            //to get real user
            int userID = int.Parse(Session["UserID"] as String);
            int productID = int.Parse((item.FindControl("lblProductID") as Label).Text);
            int quantity = int.Parse((item.FindControl("txtQuantity") as TextBox).Text);

            using (SqlConnection con = new SqlConnection(constr))
            {
                using(SqlCommand cmd = new SqlCommand("UPDATE ShoppingCart SET Quantity = @Quantity WHERE UserID = @UserID AND ProductID = @ProductID", con))
                {
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
        }

        protected void OnCancel(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            ToogleElement(item, false);
        }

        protected void OnDelete(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            RepeaterItem item = (sender as Button).Parent as RepeaterItem;
            int productId = int.Parse((item.FindControl("lblProductID") as Label).Text);
            //get UserID
            int userId = int.Parse(Session["UserID"] as String);
            int quantity = int.Parse((item.FindControl("lblQuantity") as Label).Text);

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete FROM ShoppingCart WHERE ProductID = @ProductID AND UserID = @UserID AND Quantity = @Quantity", con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
        }

        private void ToogleElement(RepeaterItem item, bool isEdit)
        {
            item.FindControl("lblQuantity").Visible = !isEdit;
            item.FindControl("txtQuantity").Visible = isEdit;

            item.FindControl("btnEdit").Visible = !isEdit;
            item.FindControl("btnUpdate").Visible = isEdit;
            item.FindControl("btnCancel").Visible = isEdit;
            item.FindControl("btnDelete").Visible = !isEdit;
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            bool check = false;
            if (Session["UserID"] != null)
            {
                RepeaterItem item = (sender as Button).Parent as RepeaterItem;
                int userID = int.Parse(Session["UserID"] as String);
                int productID = int.Parse((item.FindControl("lblProductID") as Label).Text);
                int quantity = int.Parse((item.FindControl("lblQuantity") as Label).Text);
                DateTime date = DateTime.Now;
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                try
                {
                    SqlConnection con = new SqlConnection(constr);
                    SqlCommand cmd = new SqlCommand("INSERT INTO PurchaseHistory (UserID, ProductID, PurchaseDate, Quantity) VALUES (@UserID, @ProductID, @PurchaseDate, @Quantity)", con);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@PurchaseDate", date);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    SqlConnection con1 = new SqlConnection(constr);
                    SqlCommand cmd1 = new SqlCommand("Delete FROM ShoppingCart WHERE ProductID = @ProductID AND UserID = @UserID AND Quantity = @Quantity", con1);
                    cmd1.Parameters.AddWithValue("@UserID", userID);
                    cmd1.Parameters.AddWithValue("@ProductID", productID);
                    cmd1.Parameters.AddWithValue("@Quantity", quantity);
                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    con1.Close();

                    check = true;

                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('This payment is not succesful.');window.location ='PurchaseHistory.aspx';", true);
                }
            }
            else
            {
                //login first;
            }

            if (check)
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('This payment is succesful.');window.location ='PurchaseHistory.aspx';", true);
            }
        }
    }
}