using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gallery
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["Login"];
            if (cookie != null)
            {
                Session["UserID"] = cookie["UserID"];
                Session["UserType"] = cookie["UserType"];
                Session["UserName"] = cookie["UserName"];
            }
            if (Session["UserType"] != null)
            {
                if ((Session["UserType"] as String) == "cosplayer")
                {
                    myGalleryList.Visible = true;
                    myProductList.Visible = true;
                }
            }
            if (!string.IsNullOrEmpty(Session["UserName"] as String))
            {
                myAccount.InnerHtml = Session["UserName"].ToString();
            }
        }
    }
}