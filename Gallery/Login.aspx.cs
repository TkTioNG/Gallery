using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Gallery
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Session["UserType"] = null;
            Session["UserName"] = null;
            HttpCookie cookie = new HttpCookie("Login");
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
        }

        protected void butSignIn_Click(object sender, EventArgs e)
        {
            string userName = txtUser.Text;
            string password = txtPass.Text;

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT UserID, UserType FROM Users WHERE UserName = @UserName AND Password = @Password", con))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@Password", password);
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            Session["UserID"] = sdr.GetInt32(0).ToString();
                            Session["UserType"] = sdr.GetString(1);
                            Session["UserName"] = userName.ToUpper();
                            HttpCookie cookie = new HttpCookie("Login");
                            cookie.Expires = DateTime.Now.AddDays(14);
                            if (cbRmb.Checked)
                            {
                                cookie["UserID"] = sdr.GetInt32(0).ToString();
                                cookie["UserType"] = sdr.GetString(1);
                                cookie["UserName"] = userName.ToUpper();
                                Response.Cookies.Add(cookie);
                            }
                            else
                            {
                                cookie.Expires = DateTime.Now.AddDays(-1);
                                Response.Cookies.Add(cookie);
                            }                            
                            Response.Redirect("~/Homepage.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(typeof(Page), "script", "alert(\'Your Username and password are not valid.\');", true);
                            txtUser.Text = "";
                            txtPass.Text = "";
                            txtUser.Focus();
                        }
                    }
                    con.Close();
                }
            }
        }
    }
}

