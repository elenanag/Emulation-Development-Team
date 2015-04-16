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

    public partial class PrintTicket : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                refresh();
            }

        }

        private void refresh()
        {
            DAL_Project.DAL d = new DAL_Project.DAL(connString);

            if (Request.QueryString["TicketID"] != null)
            {
                string TicketID = Request.QueryString["TicketID"].ToString();
                d.AddParam("TicketID", TicketID);
                DataSet ds = d.ExecuteProcedure("spGetPrintInfo");
                lblTicketID.Text = TicketID;
                lblSummary.Text = ds.Tables[0].Rows[0]["Summary"].ToString();
                lblDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                lblPriority.Text = ds.Tables[0].Rows[0]["TicketPriorityName"].ToString();
                lblStatus.Text= ds.Tables[0].Rows[0]["TicketStatusName"].ToString();
                lblCategory.Text = ds.Tables[0].Rows[0]["CategoryName"].ToString();
                lblClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                lblClientEmail.Text = ds.Tables[0].Rows[0]["Client Email"].ToString();
                lblAssignee.Text = ds.Tables[0].Rows[0]["Assignee"].ToString();
                lblDateCreated.Text = ds.Tables[0].Rows[0]["DateCreated"].ToString();
            }
        }
    }
}