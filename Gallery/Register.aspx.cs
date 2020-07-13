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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Session["UserType"] = null;
            if (!IsPostBack)
            {
                this.UpdateNewDataTable();
            }
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

        protected void butRegister_Click(object sender, EventArgs e)
        {
            int userID = int.Parse(lblMaxProdID.Text);
            string userName = txtUser.Text;
            string email = txtEmail.Text;
            string userType = ddlUserType.SelectedValue;
            string gender = rblGender.SelectedValue;
            string password = txtPass.Text;
            string conPass = txtConPass.Text;
            string street1 = txtAddress.Text;
            string street2 = txtAddress2.Text;
            string postcode = txtPostCode.Text;
            string state = txtState.Text;

            if (password.Equals(conPass))
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT UserName FROM Users WHERE UserName = @UserName", con))
                    {
                        cmd.Parameters.AddWithValue("@UserName", userName);
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.HasRows)
                            {
                                ClientScript.RegisterStartupScript(typeof(Page), "script", "alert(\'Your Username has been used before.\\nKindly select another user name.\');", true);
                                txtUser.Text = "";
                                txtEmail.Text = "";
                                txtPass.Text = "";
                                txtConPass.Text = "";
                                txtAddress.Text = "";
                                txtAddress2.Text = "";
                                txtPostCode.Text = "";
                                txtState.Text = "";
                                txtUser.Focus();
                            }
                            else
                            {
                                SqlConnection con1 = new SqlConnection(constr);
                                using (SqlCommand cmd1 = new SqlCommand("INSERT INTO Users(UserID, UserName, UserType, email, Password, gender, street1, street2, postcode, state) Values (@UserID, @UserName, @UserType, @Email, @Password, @Gender, @Street1, @Street2, @Postcode, @State)", con1))
                                {
                                    cmd1.Parameters.AddWithValue("@UserID", userID);
                                    cmd1.Parameters.AddWithValue("@UserName", userName);
                                    cmd1.Parameters.AddWithValue("@UserType", userType);
                                    cmd1.Parameters.AddWithValue("@Email", email);
                                    cmd1.Parameters.AddWithValue("@Password", password);
                                    cmd1.Parameters.AddWithValue("@Gender", gender);
                                    cmd1.Parameters.AddWithValue("@Street1", street1);
                                    cmd1.Parameters.AddWithValue("@Street2", street2);
                                    cmd1.Parameters.AddWithValue("@Postcode", postcode);
                                    cmd1.Parameters.AddWithValue("@State", state);

                                    con1.Open();
                                    cmd1.ExecuteNonQuery();
                                    con1.Close();
                                }
                                this.UpdateNewDataTable();
                                Session["UserID"] = userID;
                                Session["UserType"] = userType;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You has successfully registered an account.');window.location ='Homepage.aspx';", true);
                                //Response.Redirect("~/Homepage.aspx");
                            }
                        }
                        con.Close();
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(Page), "script", "alert(\'Your password is not the same.\');", true);
                txtPass.Text = "";
                txtConPass.Text = "";
                txtPass.Focus();
            }
        }

        protected void butCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}

