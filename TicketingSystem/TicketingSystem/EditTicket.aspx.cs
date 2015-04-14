using ClassLibrary;
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
            refresh();

        }

        private void refresh()
        {
            DAL_Project.DAL d = new DAL_Project.DAL(connString);

            if (Request.QueryString["TicketID"] != null)
            {
                string TicketID = Request.QueryString["TicketID"].ToString();
                d.AddParam("TicketID",TicketID);
            }
            DataSet ds = d.ExecuteProcedure("spGetTicket");
            ddlTicketCat.Text   = ds.Tables[0].Rows[0]["TicketCategoryID"].ToString();
            ddlTicketStatus.Text = ds.Tables[0].Rows[0]["TicketStatusID"].ToString();
            ddlTicketPriority.Text = ds.Tables[0].Rows[0]["TicketPriorityID"].ToString();
            ddlAssignee.SelectedValue = ds.Tables[0].Rows[0]["ClientID"].ToString();
            txtSummary.Text = ds.Tables[0].Rows[0]["Summary"].ToString();
            txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
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
            
            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
            d.AddParam("Summary", txtSummary.Text);
            d.AddParam("Description", txtDescription.Text);
            d.AddParam("TicketCategoryID", ddlTicketCat.SelectedItem.Text);
            d.AddParam("TicketStatusID", ddlTicketStatus.SelectedItem.Text);
            d.AddParam("TicketPriorityID", ddlTicketPriority.SelectedItem.Text);
            d.AddParam("AssigneeID", ddlAssignee.SelectedItem.Text);
            ds = d.ExecuteProcedure("spEditTicket");

        }
       
    }
}