using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using DAL_Project;
using System.Data.SqlClient;

namespace EmulationGroupProject
{
    public partial class MainPage : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateTicketGrid();
                PopulateTicketDropDown();
            }
        }

        private void PopulateTicketDropDown()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetProirity");

            ddlTicketStatus.DataTextField = "TicketPriorityName";
            ddlTicketStatus.DataValueField = "TicketPriorityID";
            ddlTicketStatus.DataSource = ds;
            ddlTicketStatus.DataBind();

            ddlTicketStatus.Items.Insert(0, "Priority level");
        } 
        private void PopulateTicketGrid()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetTicketInfo");

            gvTicket.DataSource = ds;
            gvTicket.DataBind();
        }
    }
}