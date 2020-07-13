using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gallery.UserControl
{
    public partial class CurrentLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null && !String.IsNullOrWhiteSpace(Session["UserName"].ToString()))
                {
                    UserName.InnerHtml = Session["UserName"].ToString();
                }
            }            

            loginTime.InnerHtml = DateTime.Now.ToString();
        }
    }
}