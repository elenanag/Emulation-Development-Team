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
using System.Net.Mail;

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
                else {
                    Response.Redirect("LoginPage.aspx");
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
            gvTicket.SelectedIndex = -1;
            dlTicketInfo.Visible = false;
            panelActivity.Visible = false;
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
                ViewState["TicketID"] = ticketID;
                
                DAL d = new DAL(connString);
                DataSet ds = new DataSet();
                d.AddParam("@TicketID", ticketID);
                ds = d.ExecuteProcedure("spTicketIdAndSummary");
                ViewState["TicketStatusID"] = ds.Tables[0].Rows[0]["TicketStatusID"].ToString();
                dlTicketInfo.DataSource = ds;
                dlTicketInfo.DataBind();
                dlTicketInfo.Visible = true;
                panelActivity.Visible = true;
                BindRepeater();
                GetAttachment();
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
            dlTicketInfo.Visible = false;
            panelActivity.Visible = false;
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
            Button btn2 = (Button)e.Item.FindControl("btnAddTime");
            Button btn = (Button)e.Item.FindControl("btnPost");
            TextBox txt = (TextBox)e.Item.FindControl("txtPost");
            Label lblTime = (Label)e.Item.FindControl("lblTime");
            TextBox txtTime = (TextBox)e.Item.FindControl("txtTime");
            Button btn3 = (Button)e.Item.FindControl("btnAddIt");
            DropDownList ddl = (DropDownList)e.Item.FindControl("ddlAssign");


            if (e.CommandName == btn2.CommandName)
            {
                lblTime.Visible = false;
                txtTime.Visible = true;
                btn3.Visible = true;
                btn2.Visible = false;
            }
            else if (e.CommandName == "AddTime")
            {
                lblTime.Visible = true;
                txtTime.Visible = false;
                btn3.Visible = false;
                btn2.Visible = true;

                DAL d = new DAL(connString);
                d.AddParam("TimeSpentOnTicket", txtTime.Text);
                d.AddParam("AssigneeID", ddl.SelectedValue);
                d.AddParam("TicketID", gvTicket.SelectedValue);
                DataSet ds = d.ExecuteProcedure("spInsertTimeSpentOnTicket");

                int num = Convert.ToInt32(lblTime.Text);
                lblTime.Text = (num + Convert.ToInt32(txtTime.Text)).ToString();
            }
            else if(e.CommandName == btn.CommandName)
            {
                DAL d = new DAL(connString);
                d.AddParam("Comments", txt.Text);
                d.AddParam("DateOfComments", DateTime.Now);
                d.AddParam("AssigneeID", Session["UserID"]);
                d.AddParam("TicketID", gvTicket.SelectedValue);
                DataSet ds = d.ExecuteProcedure("spInsertTicketComment");

                BindRepeater();

                GetAttachment();

                txt.Text = "";
            }
        }

        private void GetAttachment()
        {
            DAL d = new DAL(connString);
            d.AddParam("TicketID", gvTicket.SelectedValue);
            DataSet ds = d.ExecuteProcedure("spGetImageAttachments");

            if (ds.Tables[0].Rows.Count > 0)
            {
                dlImage.DataSource = ds;
                dlImage.DataBind();
                dlImage.Visible = true;
            }
            else {
                dlImage.Visible = false;
            }

            d = new DAL(connString);
            d.AddParam("TicketID", gvTicket.SelectedValue);
            ds = d.ExecuteProcedure("spGetNonImageAttachments");

            if (ds.Tables[0].Rows.Count > 0)
            {
                dlAttachments.DataSource = ds;
                dlAttachments.DataBind();
                dlAttachments.Visible = true;
            }
            else
            {
                dlAttachments.Visible = false;
            }
        }

        protected void dlTicketInfo_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            string ticketID = ViewState["TicketID"].ToString();

            DataList DataList = (DataList)sender;
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetAssignee");

            DropDownList ddAsignee = (DropDownList)e.Item.FindControl("ddlAssign");
            ddAsignee.DataSource = ds.Tables[0];
            ddAsignee.DataTextField = "FirstName";
            ddAsignee.DataValueField = "UserID";
            ddAsignee.DataBind();

            d = new DAL(connString);
            ds = new DataSet();
            d.AddParam("TicketID", ticketID);
            ds = d.ExecuteProcedure("spTicketAssignee");

            string assigneeID = ds.Tables[0].Rows[0]["AssigneeID"].ToString();
            

            ddAsignee.Items.FindByValue(assigneeID).Selected = true;
            Label lblTime = (Label)e.Item.FindControl("lblTime");
            PopulateTimeSpent(ticketID, assigneeID, lblTime);

            Button btn = (Button)e.Item.FindControl("btnAddTime");
            if (ViewState["TicketStatusID"].ToString() == "3")
	        {
                btn.Visible = false;
	        }
            else
            {
                btn.Visible = true;
            }

            d = new DAL(connString);
            d.AddParam("TicketID", gvTicket.SelectedValue);
            ds = d.ExecuteProcedure("spGetPersonFromTicket");
            
            Label lbl = (Label)e.Item.FindControl("lblClientName");
            string firstName = ds.Tables[0].Rows[0]["FirstName"].ToString();
            string lastName = ds.Tables[0].Rows[0]["LastName"].ToString();
            lbl.Text = firstName + " " + lastName;
        }
        
        private void PopulateTimeSpent(string ticketID, string assigneeID, Label lbl)
        {
            DAL d = new DAL(connString);
            d.AddParam("TicketID", ticketID);
            d.AddParam("AssigneeID", assigneeID);
            DataSet ds = d.ExecuteProcedure("spGetTimeSpentOnTicket");

            if (ds.Tables[0].Rows.Count > 0)
            {
                lbl.Text = ds.Tables[0].Rows[0]["TimeSpentOnTicket"].ToString();
            }
            
        }

        protected void ddlAssign_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddAsignee = (DropDownList)sender;
            DAL d = new DAL(connString);
            d.AddParam("TicketID", ViewState["TicketID"]);
            d.AddParam("AssigneeID", ddAsignee.SelectedValue);
            d.ExecuteProcedure("spUpdateTicketAssignee");

            PopulateTicketGrid();
        }

        protected void ImgBtnClose_Click(object sender, ImageClickEventArgs e)
        {
            DAL d = new DAL(connString);
            d.AddParam("@TicketID", ViewState["TicketID"]);
            d.ExecuteProcedure("spCloseTicket");
            PopulateTicketGrid();

            Response.Redirect("MainPage.aspx");
            //SendEmail();
        }

        protected void ImageButtonSearch_Click(object sender, ImageClickEventArgs e)
        {
            DAL d = new DAL(connString);
            d.AddParam("@Summary", txtSearch.Text);
            gvTicket.DataSource = d.ExecuteProcedure("spSearchTicket"); 
            gvTicket.DataBind();

        }

        //private void SendEmail()
        //{
        //    LoginInfo user = (LoginInfo)Session["user"];
        //    int customerID = user.UserID;

        //    MailMessage message = new MailMessage();
        //    message.From = new MailAddress("elena.nagberi@robertsoncollege.net");
        //    message.To.Add(new MailAddress(user.Email));
        //    message.Subject = "Ticket Closed!";
        //    message.Body = "Your ticket was closed! Robertson College Ticketing System";
        //    SmtpClient client = new SmtpClient();
        //    client.Host = "smtp.gmail.com";
        //    client.Port = 587;
        //    client.EnableSsl = true;
        //    client.Credentials = new System.Net.NetworkCredential("elena.nagberi@robertsoncollege.net", "xxxxxxx");
        //    client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //    client.Send(message);

        //} 
    }
}