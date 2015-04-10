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
using ClassLibrary;

namespace EmulationGroupProject
{
    public partial class MainPage : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        LoginInfo login;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    login = (LoginInfo)Session["user"];
                    Session["UserID"] = login.UserID;
                }

                PopulateTicketGrid();
                PopulateTicketDropDown();

                Session["SortColumn"] = "TicketID";
                Session["SortDirection"] = "ASC";

                RefreshSortedTicketToGrid();
            }
        }
        private void BindRepeater()
        {
            DAL d = new DAL(connString);
            d.AddParam("TicketID", gvTicket.SelectedValue);
            DataSet ds = d.ExecuteProcedure("spGetTicketComment");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                panelActivity.Visible = true;
            }
            else
            {
                panelActivity.Visible = false;
            }
            
        }
        private void RefreshSortedTicketToGrid()
        {
            DAL d = new DAL(connString);
            d.AddParam("SortColumn", Session["SortColumn"].ToString());
            d.AddParam("SortDirection", Session["SortDirection"].ToString());
            gvTicket.DataSource = d.ExecuteProcedure("spSortedTicket");
            gvTicket.DataBind();
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
            if (e.CommandName != "Sort")
            {
                gvTicket.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "SelectTicket")
            {
                gvTicket.SelectedIndex = Convert.ToInt32(e.CommandArgument);
                string ticketID = gvTicket.SelectedDataKey.Value.ToString();
                DAL d = new DAL(connString);
                DataSet ds = new DataSet();
                d.AddParam("@TicketID", ticketID);
                ds = d.ExecuteProcedure("spTicketIdAndSummary");

                dlTicketInfo.DataSource = ds;
                dlTicketInfo.DataBind();
                BindRepeater();
            }
        }

        }
        protected void gvTicket_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (e.SortExpression == Session["SortColumn"].ToString())
            {
                SwitchDirectionSort();
            }
            else
            {
                Session["SortColumn"] = e.SortExpression;
                Session["SortDirection"] = "ASC";
            }
            RefreshSortedTicketToGrid();
        }
        private void SwitchDirectionSort()
        {
            if (Session["SortDirection"].ToString() == "ASC")
            {
                Session["SortDirection"] = "DESC";
            }
            else
            {
                Session["SortDirection"] = "ASC";
            }
        }

        protected void gvTicket_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            RefreshSortedTicketToGrid();

            gvTicket.PageIndex = e.NewPageIndex;
            gvTicket.DataBind();
        }

        protected void gvTicket_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            try
            {
                switch (e.Row.RowType)
                {
                    case DataControlRowType.Header:
                        //...
                        break;
                    case DataControlRowType.DataRow:
                        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='lightgray'; this.style.color='Black'; this.style.cursor='pointer'");
                        if (e.Row.RowState == DataControlRowState.Alternate)
                        {
                            e.Row.Attributes.Add("onmouseout", String.Format("this.style.color='Black';this.style.backgroundColor='';", gvTicket.AlternatingRowStyle.BackColor.ToKnownColor()));
                        }
                        else
                        {
                            e.Row.Attributes.Add("onmouseout", String.Format("this.style.color='Black';this.style.backgroundColor='White';", gvTicket.RowStyle.BackColor.ToKnownColor()));
                        }
                        e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(gvTicket, "SelectTicket$" + e.Row.RowIndex.ToString()));
                        break;
                }
            }
            catch
            {
                //...throw
            }

        }

        protected void btnNewTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewTicket.aspx");
        }

        protected void dlTicketInfo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Button btn = (Button)e.Item.FindControl("btnPost");
            TextBox txt = (TextBox)e.Item.FindControl("txtPost");

            DAL d = new DAL(connString);
            d.AddParam("Comments", txt.Text);
            d.AddParam("DateOfComments", DateTime.Now);
            d.AddParam("AssigneeID", Session["UserID"]);
            d.AddParam("TicketID", gvTicket.SelectedValue);
            DataSet ds = d.ExecuteProcedure("spInsertTicketComment");

            BindRepeater();
            txt.Text = "";
        }

    }
}