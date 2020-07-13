using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

namespace Gallery
{
    public partial class GalleryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["UserName"] as String))
            {
                String userName = Session["UserName"].ToString();
                this.LoadUserDetails(userName);
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["ProductID"] != null)
                {
                    this.LoadProductDetails(Request.QueryString["ProductID"]);
                }
                else
                {
                    ProductDetails.Visible = false;
                    EmptyDetails.Visible = true;
                }
            }
        }

        private void LoadUserDetails(String userName)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("Select street1, street2, postCode from Users where UserName = @UserName", con);
            cmd.Parameters.AddWithValue("@UserName", userName);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    txtRcpName.Text = userName;
                    txtRcpPhone.Text = "012-3456789";
                    txtStreet.Text = reader.GetString(0);
                    txtArea.Text = reader.GetString(1);
                    txtPostCode.Text = reader.GetInt32(2).ToString();
                }
            }
            finally
            {
                reader.Close();
            }
            con.Close();
        }

        private void LoadProductDetails(String productID)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("Select P.ProductName, U.UserName, P.Image, P.Stock, P.Sales, C.CategoryName, P.Description, P.Price from Product as P, Users as U, Category as C where P.SalerID = U.UserID AND P.CategoryID = C.CategoryID AND P.ProductID = @productID", con);
            cmd.Parameters.AddWithValue("@productID", productID);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                while(reader.Read())
                {
                    lblProductName.Text = reader.GetString(0);
                    lblSalerID.Text = reader.GetString(1);
                    imageField.ImageUrl = reader.GetString(2);
                    lblStock.Text = reader.GetInt32(3).ToString();
                    lblSales.Text = reader.GetInt32(4).ToString();
                    lblCat.Text = reader.GetString(5);
                    lblDesc.Text = reader.GetString(6);
                    lblPrice.Text = reader.GetValue(7).ToString();

                    imageField2.ImageUrl = reader.GetString(2);
                }
            }
            finally
            {
                reader.Close();
            }
            con.Close();
        }

        protected void AddShopCart(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int userID = int.Parse(Session["UserID"] as String);
                int productID = int.Parse(Request.QueryString["ProductID"]);
                int quantity = int.Parse(lblQuantity.Text);
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                try
                {
                    SqlConnection con = new SqlConnection(constr);
                    SqlCommand cmd = new SqlCommand("INSERT INTO ShoppingCart VALUES (@UserID, @ProductID, @Quantity)", con);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('This product has been added to your shopping cart.');", true);
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('This product is already in your shopping cart.');", true);
                }
            }
            else
            {
                //login first;
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('Please log in before adding it to shopping cart.');", true);
            }
        }


        protected void BuyNow(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int userID = int.Parse(Session["UserID"] as String);
                int productID = int.Parse(Request.QueryString["ProductID"]);
                int quantity = int.Parse(lblQuantity.Text);
                DateTime date = DateTime.Now;
                String recipient = txtRcpName.Text;
                String phone = txtRcpPhone.Text;
                String street = txtStreet.Text;
                String area = txtArea.Text;
                int postCode = int.Parse(txtPostCode.Text);
                String state = ddlState.SelectedValue;

                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                try
                {
                    SqlConnection con = new SqlConnection(constr);
                    SqlCommand cmd = new SqlCommand("INSERT INTO PurchaseHistory VALUES (@UserID, @ProductID, @PurchaseDate, @Quantity, @Recipient, @Phone, @Street, @Area, @PostCode, @State)", con);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@PurchaseDate", date);
                    cmd.Parameters.AddWithValue("@Recipient", recipient);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Street", street);
                    cmd.Parameters.AddWithValue("@Area", area);
                    cmd.Parameters.AddWithValue("@PostCode", postCode);
                    cmd.Parameters.AddWithValue("@State", state);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('You have successfully purchase the product.');window.location ='PurchaseHistory.aspx';", true);

                    sendReceipt(userID, productID, quantity, date, recipient, street, area, postCode, state);
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('Payment is unsuccessfull. Please try it later.');", true);
                }
            }
            else
            {
                //login first;
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('Please log in before any purchase.');", true);
            }
        }

        private void sendReceipt(int userID, int productID, int quantity, DateTime date, string recipient, string street, string area, int postcode, string state)
        {
            string productName = "";
            double price = 0;

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("Select ProductName, Price from Product where ProductID = @productID", con);
            cmd.Parameters.AddWithValue("@productID", productID);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    productName = reader.GetString(0);
                    price = double.Parse(reader.GetValue(1).ToString());
                }
            }
            finally
            {
                reader.Close();
            }
            con.Close();


            String body = "<table>" +
                            "<tr>" +
                                "<td> Name: </td> <td>" + Session["UserName"].ToString().ToUpper() + " </td>" +
                            "</tr>" +
                            "<tr >" +
                                "<td> Date: </td> <td> " + date + "</td>" +
                            "</tr >" +
                            "<tr>" +
                                "<td><u> Delivery Address </u></td> <td></td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td></td> <td></td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Recipient Name: </td> <td> " + recipient + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Street Name: </td> <td> " + street + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Area: </td> <td> " + area + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Postcode: </td> <td> " + postcode + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> State: </td> <td> " + state + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td><u> Purchased Product </u></td> <td></td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Product Name: </td> <td>" + productName + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Unit Price: </td> <td>" + String.Format("{0:0.00}", price) + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Quantity: </td> <td>" + quantity + "</td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> Total price: </td> <td>" + String.Format("{0:0.00}", quantity * price) + "</td>" +
                            "</tr>" +
                          "</table>";

            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add("tankt-wp17@student.tarc.edu.my");
            mail.From = new MailAddress("liowzm-wm18@student.tarc.edu.my", "Receipt for Purchase - " + DateTime.Now, System.Text.Encoding.UTF8);
            mail.Subject = "Receipt for Purchase";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = body;
            mail.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("liowzm-wm18@student.tarc.edu.my", "liow991125");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                Session["Receipt"] = body;
                Response.Write("<script>window.open('Receipt.aspx','_blank')</script>");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
                Response.Write("<script>alert('Failed to Send Email.');</script>");
            }
        }

        protected void AddWishList(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int userID = int.Parse(Session["UserID"] as String);
                int productID = int.Parse(Request.QueryString["ProductID"]);
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                try
                {
                    SqlConnection con = new SqlConnection(constr);
                    SqlCommand cmd = new SqlCommand("INSERT INTO WishingList VALUES (@UserID, @ProductID)", con);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('This product has been added to your wishing list.');", true);
                }
                catch
                {
                    SqlConnection con = new SqlConnection(constr);
                    SqlCommand cmd = new SqlCommand("DELETE FROM WishingList WHERE UserID = @UserID AND ProductID = @ProductID", con);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@productID", productID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('This product has been removed from your wishing list.');", true);
                }
            }
            else
            {
                //login first;
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('Please log in before any purchase.');", true);
            }
        }

    }
}