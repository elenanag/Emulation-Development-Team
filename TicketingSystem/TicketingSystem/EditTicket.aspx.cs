using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketingSystem
{
    public partial class EditTicket : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateTicketCategory();
            PopulateStatus();
            PopulatePriority();
            PopulateAssignee();

        }

        private void PopulateAssignee()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetAssignee");
            ddlAssignee.DataTextField = "FirstName";
            ddlAssignee.DataValueField = "UserID";
            ddlAssignee.DataSource = ds;
            ddlAssignee.DataBind();
            
        }

        private void PopulatePriority()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetProirity");
            ddlTicketPriority.DataTextField = "TicketPriorityName";
            ddlTicketPriority.DataValueField = "TicketPriorityID";
            ddlTicketPriority.DataSource = ds;
            ddlTicketPriority.DataBind();
        }

        private void PopulateStatus()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetStatus");
            ddlTicketStatus.DataTextField = "TicketStatusName";
            ddlTicketStatus.DataValueField = "TicketStatusID";
            ddlTicketStatus.DataSource = ds;
            ddlTicketStatus.DataBind();
        }

        private void PopulateTicketCategory()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetTicketCategory");
            ddlTicketCat.DataTextField = "CategoryName";
            ddlTicketCat.DataValueField = "TicketCategoryID";
            ddlTicketCat.DataSource = ds;
            ddlTicketCat.DataBind();

        }

        protected void btnEditTicket_Click(object sender, EventArgs e)
        {

        }
    }
}