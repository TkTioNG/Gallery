using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gallery
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["UserName"] as String))
            {
                string userName = Session["UserName"].ToString();
                if (!IsPostBack)
                {
                    LoadUserDetails(userName);
                }
            }
            else
            {
                plsLogin.Visible = true;
                mainContent.Visible = false;
            }
        }

        private void LoadUserDetails(String userName)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("Select gender, email, street1, street2, postCode, state from Users where UserName = @UserName", con);
            cmd.Parameters.AddWithValue("@UserName", userName);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    txtUser.Text = userName;
                    string gender = reader.GetString(0);
                    if (gender == "M")
                    {
                        genderRbl.SelectedIndex = 0;
                    }
                    else
                    {
                        genderRbl.SelectedIndex = 1;
                    }
                    txtEmail.Text = reader.GetString(1);
                    txtAddress.Text = reader.GetString(2);
                    txtAddress2.Text = reader.GetString(3);
                    txtPostCode.Text = reader.GetInt32(4).ToString();
                    txtState.Text = reader.GetString(5);
                }
            }
            finally
            {
                reader.Close();
            }
            con.Close();
        }

        protected void butSave_Click(object sender, EventArgs e)
        {
            try
            {
                int userID = int.Parse(Session["UserID"].ToString());
                string gender = "M";
                if (genderRbl.SelectedValue == "F")
                {
                    gender = "F";
                }
                string email = txtEmail.Text;
                string street1 = txtAddress.Text;
                string street2 = txtAddress2.Text;
                int postCode = int.Parse(txtPostCode.Text);
                string state = txtState.Text;

                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("UPDATE Users SET gender = @Gender, email = @Email, street1 = @Street1, street2 = @Street2, postCode = @PostCode, state = @State WHERE UserID = @UserID", con);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Street1", street1);
                cmd.Parameters.AddWithValue("@Street2", street2);
                cmd.Parameters.AddWithValue("@PostCode", postCode);
                cmd.Parameters.AddWithValue("@State", state);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    Response.Write("<script>alert('User Details Have Been Successfully Updated')</script>");
                }
                finally
                {
                    reader.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            finally
            {
                butSave.Visible = false;
                butCancel.Visible = false;
                butEdit.Visible = true;

                txtAddress.Enabled = false;
                txtAddress2.Enabled = false;
                txtEmail.Enabled = false;
                txtPostCode.Enabled = false;
                txtState.Enabled = false;
                txtUser.Enabled = false;
                genderRbl.Enabled = false;
            }
        }

        protected void butEdit_Click(object sender, EventArgs e)
        {
            butSave.Visible = true;
            butCancel.Visible = true;
            butEdit.Visible = false;

            txtAddress.Enabled = true;
            txtAddress2.Enabled = true;
            txtEmail.Enabled = true;
            txtPostCode.Enabled = true;
            txtState.Enabled = true;
            txtUser.Enabled = true;
            genderRbl.Enabled = true;
        }

        protected void butCancel_Click(object sender, EventArgs e)
        {
            butSave.Visible = false;
            butCancel.Visible = false;
            butEdit.Visible = true;

            txtAddress.Enabled = false;
            txtAddress2.Enabled = false;
            txtEmail.Enabled = false;
            txtPostCode.Enabled = false;
            txtState.Enabled = false;
            txtUser.Enabled = false;
            genderRbl.Enabled = false;
        }
    }
}