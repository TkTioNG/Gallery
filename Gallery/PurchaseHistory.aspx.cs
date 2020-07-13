using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Gallery
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["UserName"] as String))
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

        protected void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT P.ProductID, P.ProductName, U.UserName, P.Image, P.Price, PH.Quantity, P.Price * PH.Quantity AS Total, PH.PurchaseDate, P.Description FROM Product AS P, Users AS U, PurchaseHistory AS PH WHERE PH.ProductID = P.ProductID AND P.SalerID = U.UserID AND PH.UserID = @UserID ORDER BY PH.PurchaseDate DESC, P.ProductName ASC", con))
                {
                    int userID = int.Parse(Session["UserID"] as String);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
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

        protected void sendReceipt(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).Parent as RepeaterItem;

            int userID = int.Parse(Session["UserID"].ToString());
            string userName = Session["UserName"].ToString();
            int productID = int.Parse((item.FindControl("lblProductID") as Label).Text);
            string productName = (item.FindControl("lblProductName") as Label).Text;
            double price = double.Parse((item.FindControl("lblPrice") as Label).Text);
            double quantity = double.Parse((item.FindControl("lblQuantity") as Label).Text);
            string date = (item.FindControl("lblPurchaseDate") as Label).Text;

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("Select RecipientName, Phone, Street, Area, PostCode, State from PurchaseHistory where ProductID = @ProductID AND UserID = @UserID", con);
            cmd.Parameters.AddWithValue("@ProductID", productID);
            cmd.Parameters.AddWithValue("@UserID", userID);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                if (reader.Read())
                {
                    string recipient = reader.GetString(0);
                    string phone = reader.GetString(1);
                    string street = reader.GetString(2);
                    string area = reader.GetString(3);
                    int postcode = reader.GetInt32(4);
                    string state = reader.GetString(5);

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

                    Session["Receipt"] = body;
                    Response.Write("<script>window.open('Receipt.aspx','_blank')</script>");
                }
            }
            finally
            {
                reader.Close();
            }
            con.Close();
        }
    }
}