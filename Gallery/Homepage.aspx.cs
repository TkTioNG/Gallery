using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;

namespace Gallery
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            int userID = 2222;
            int productID = 5029;
            int quantity = 2;
            DateTime date = DateTime.Now;
            string recipient = "Tankt";
            string street = "Your House";
            string area = "Your PV";
            int postcode = 55555;
            string state = "Penang";

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
            mail.From = new MailAddress("tktan0112@gmail.com", "Receipt for Purchase - " + DateTime.Now, System.Text.Encoding.UTF8);
            mail.Subject = "Receipt for Purchase";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = body;
            mail.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("tktan0112@gmail.com", "TappleT123");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                Response.Write("<script>alert('Successfully Send Email.');</script>");
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
    }
}