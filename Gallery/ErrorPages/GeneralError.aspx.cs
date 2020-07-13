using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gallery.ErrorPages
{
    public partial class GeneralError : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["exception"] != null)
            {
                Exception ex = new Exception();
                ex = (Exception)Application["exception"];
                string FileUrl = (string)Application["location"];
                try
                {
                    throw ex;
                }
                catch (Exception exc)
                {
                    errMsg.InnerHtml = "<div style=\"background-color: lightgrey; padding: 25px 5px;\">Alert<br /><br />One error is encountered in " + FileUrl + " page: <span style=\"color: red;\">Exception of type '" + exc.Message + "' was thrown.</span><br /><br />" + exc.InnerException + "</div>";
                }
            }
            else
            {
                errMsg.InnerHtml = "Exception Unsure.";
            }
        }
    }
}