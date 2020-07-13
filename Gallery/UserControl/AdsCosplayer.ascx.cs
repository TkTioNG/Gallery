using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gallery
{
    public partial class AdsCosplayer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] != null)
            {
                if ((Session["UserType"] as String) != "cosplayer")
                {
                    image.Src = "../Images/kaori_miyazono.jpg";
                    imageTitle.InnerHtml = "Cosplay Gallery";
                    imageDesc.InnerHtml = "View Cosplayer's Lastest Collection <br /><br /> Behold... of Their Beauty.";
                    btnImage.Text = "View Now";
                }
            }
            else
            {
                image.Src = "../Images/rwby_blake.jpg";
                imageTitle.InnerHtml = "Cosplay Custome & Accessory";
                imageDesc.InnerHtml = "Shop On Fabulous Cosplay Costume & Accessory <br /><br /> There must be somthing fall to youe eye.";
                btnImage.Text = "Shop Now";
            }
        }
    }
}