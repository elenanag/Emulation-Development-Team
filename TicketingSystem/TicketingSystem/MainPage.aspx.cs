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
using System.Drawing;

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
            DataSet ds = d.ExecuteProcedure("spGetStatus");

            ddlTicketStatus.DataTextField = "TicketStatusName";
            ddlTicketStatus.DataValueField = "TicketStatusID";
            ddlTicketStatus.DataSource = ds;
            ddlTicketStatus.DataBind();

            ddlTicketStatus.Items.Insert(0, "Ticket Status");
        } 
        private void PopulateTicketGrid()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetTicketInfo");

            gvTicket.DataSource = ds;
            gvTicket.DataBind();
        }

        protected void ddlTicketStatus_SelectedIndexChanged(object sender, EventArgs e) 
        {
            string ticketStatus = ddlTicketStatus.SelectedItem.Text.ToString();
            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
            d.AddParam("@TicketStatusName", ticketStatus);
            ds = d.ExecuteProcedure("spGetTicketByStatusName");
            gvTicket.DataSource = ds;
            gvTicket.DataBind();

            if (ddlTicketStatus.SelectedItem.Text.ToString() == "Ticket Status")
            {
                PopulateTicketGrid();
            }
        }

        protected void gvTicket_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            gvTicket.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "SelectTicket")
            {
                string ticketID = gvTicket.SelectedDataKey.Value.ToString();
                DAL d = new DAL(connString);
                DataSet ds = new DataSet();
                d.AddParam("@TicketID", ticketID);
                ds = d.ExecuteProcedure("spTicketIdAndSummary");

                dlTicketInfo.DataSource = ds;
                dlTicketInfo.DataBind();
            }
        }

        
    }
}