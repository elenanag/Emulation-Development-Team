using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketingSystem
{
    public partial class AdminPage : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Refresh();
            }
            LinkButton lbAdmin = (LinkButton)Master.FindControl("lbAdmin");
            lbAdmin.Enabled = false;
            lbAdmin.Attributes["style"] = "color:red; font-weight:bold; font-size:x-large;";
           
        }

        private void Refresh()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetUser");

            gvUsers.DataSource = ds.Tables[0];
            gvUsers.DataBind();

            
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DAL d = new DAL(connString);
            gvUsers.DataSource = d.ExecuteProcedure("spGetUser");
            gvUsers.PageIndex = e.NewPageIndex;
            gvUsers.DataBind();
        }
    }
}