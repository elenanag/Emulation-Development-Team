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
            d.AddParam("TicketCategoryID",ddlTicketCat.Text);
            d.AddParam("TicketStatusID", ddlTicketStatus.Text);
            d.AddParam("TicketPriorityID",ddlTicketPriority.Text);
            d.AddParam("AssigneeID", ddlAssignee.Text);
            ds = d.ExecuteProcedure("spEditTicket");

        }
        private void SelectTicket()
        {

           // string customerID = gvCustomers.SelectedDataKey.Value.ToString();

            DAL d = new DAL(connString);

            DataSet ds = new DataSet();
            d.AddParam("@TicketID",TicketID);

            ds = d.ExecuteProcedure("spGetCustomer");

            txtFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();

            txtLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();

            txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();

            txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();

            txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();

            txtUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();

            txtPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();

            gvCustomers.SelectedRowStyle.BackColor = Color.Pink;

            RefreshData();

        }
    }
}