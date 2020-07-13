using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;

namespace Gallery
{
    public partial class Cosplay1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["filter"]))
                {
                    string filter = Request.QueryString["filter"];
                    if (filter == "male")
                        ddlFilter.SelectedValue = "cosplay male";
                    else if (filter == "female")
                        ddlFilter.SelectedValue = "cosplay female";
                    else if (filter == "anime")
                        ddlFilter.SelectedValue = "anime";
                    else if (filter == "europe")
                        ddlFilter.SelectedValue = "europe";
                }
                this.BindRepeater();
            }
        }

        private void BindRepeater()
        {
            string selCmd = "SELECT P.ProductID, P.ProductName, P.SalerID, P.Image, P.Stock, P.Sales, P.CategoryID, P.Description, P.Price, U.UserName, C.CategoryName FROM Product AS P INNER JOIN Users AS U ON P.SalerID = U.UserID INNER JOIN Category AS C ON P.CategoryID = C.CategoryId WHERE(C.CategoryName LIKE '%@catName%') ORDER BY P.ProductID DESC";

            string catName = "cosplay";
            if (ddlFilter.SelectedValue != null)
            {
                if (ddlFilter.SelectedValue == "cosplay male")
                    catName = "cosplay male";
                else if (ddlFilter.SelectedValue == "cosplay female")
                    catName = "cosplay female";
                else if (ddlFilter.SelectedValue == "anime")
                    catName = "anime";
                else if (ddlFilter.SelectedValue == "europe")
                    catName = "europe";
            }
            selCmd = selCmd.Replace("@catName", catName);
            lblListCountNew.Text = selCmd;
            SqlDataSource1.SelectCommand = selCmd;
            RepeaterNew.DataBind();
            int count = RepeaterNew.Items.Count;
            lblListCountNew.Text = count.ToString();
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lalala
            BindRepeater();
        }

    }
}