using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Gallery
{
    public partial class MyGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindRepeater();
            }
        }

        private void BindRepeater()
        {
            int userID = int.Parse(Session["UserID"] as String);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT G.GalleryName, U.UserName, G.Image FROM Gallery AS G, Users AS U WHERE G.UserID = U.UserID AND U.UserID = @UserID", con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
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

        protected void AddGallery(object sender, EventArgs e)
        {
            Response.Redirect("~/MyGalleryInsert.aspx");
        }
    }
}