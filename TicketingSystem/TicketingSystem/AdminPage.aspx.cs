using ClassLibrary;
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
            if (Session["user"] == null)
            {
                Response.Redirect("LoginPage.aspx?");
            }
            LoginInfo user = (LoginInfo)Session["user"];
            if (user.AccessLevelID != 1)
            {
                Response.Redirect("LoginPage.aspx?");
            }

            lblResult.Text = "";

            if (!IsPostBack)
            {
                ViewState["Sort"] = "UserID";
                ViewState["SortDirection"] = "ASC";
                Refresh();
            }

            LinkButton lbAdmin = (LinkButton)Master.FindControl("lbAdmin");
            lbAdmin.Enabled = false;
            lbAdmin.Attributes["style"] = "color:#EC3C2D; font-weight:bold; font-size:x-large;";
        }

        private void Refresh()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spSortUser");
            gvUsers.DataSource = ds.Tables[0];
            gvUsers.DataBind();

            DataSet dset = new DataSet();
            dset = d.ExecuteProcedure("spGetUser");

        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DAL d = new DAL(connString);
            d.AddParam("Sort", ViewState["Sort"].ToString());
            d.AddParam("SortDirection", ViewState["SortDirection"].ToString());
            DataSet ds = d.ExecuteProcedure("spSortUser");
            gvUsers.DataSource = ds.Tables[0];
            gvUsers.PageIndex = e.NewPageIndex;
            gvUsers.DataBind();

            gvUsers.SelectedRowStyle.BackColor = ColorTranslator.FromHtml("#FFF7E7");
                
            Refresh();
        }

        protected void gvUsers_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (e.SortExpression == ViewState["Sort"].ToString())
            {
                if (ViewState["SortDirection"].ToString() == "ASC")
                {
                    ViewState["SortDirection"] = "DESC";
                }
                else
                {
                    ViewState["SortDirection"] = "ASC";
                }
            }
            else
            {
                ViewState["SortDirection"] = "ASC";
            }

            ViewState["Sort"] = e.SortExpression;

            DAL d = new DAL(connString);
            d.AddParam("Sort", e.SortExpression);
            d.AddParam("SortDirection", ViewState["SortDirection"].ToString());
            DataSet ds = d.ExecuteProcedure("spSortUser");
            gvUsers.DataSource = ds.Tables[0];
            gvUsers.DataBind();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Sort" && e.CommandName != "Paging")
            {
                if (e.CommandName == "UpdateUser")
                {
                    UpdateUser();
                }
                else if (e.CommandName == "DeleteUser")
                {
                    DeleteUser();
                }
                else if (e.CommandName == "SelectUser")
                {
                    gvUsers.SelectedIndex = Convert.ToInt32(e.CommandArgument);
                    SelectUser();
                }
            }
            Refresh();
        }

        private void SelectUser()
        {
            string userID = gvUsers.SelectedDataKey.Value.ToString();
            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
            d.AddParam("@UserID", userID);
            ds = d.ExecuteProcedure("spGetUser");

            txtFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            txtLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
            txtTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            txtAccessLevelID.Text = ds.Tables[0].Rows[0]["AccessLevelID"].ToString();

            gvUsers.SelectedRowStyle.BackColor = Color.LightGray;

            Refresh();
        }

        private void DeleteUser()
        {
            try
            {
                string userID = gvUsers.SelectedDataKey.Value.ToString();
                DAL d = new DAL(connString);
                DataSet ds = new DataSet();
                d.AddParam("@UserID", userID);

                ds = d.ExecuteProcedure("spDeleteUser");
            }
            catch
            {
                lblResult.Text = "Cannot Delete selected User!";
            }
            BlankTextboxes();
            Refresh();
        }

        private void UpdateUser()
        {
            string userID = gvUsers.SelectedDataKey.Value.ToString();
            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
            d.AddParam("@UserID", userID);
            d.AddParam("@FirstName", txtFirstName.Text);
            d.AddParam("@LastName", txtLastName.Text);
            d.AddParam("@Title", txtTitle.Text);
            d.AddParam("@Phone", txtPhone.Text);
            d.AddParam("@Email", txtEmail.Text);
            d.AddParam("@Password", txtPassword.Text);
            d.AddParam("@AccessLevelID", txtAccessLevelID.Text);

            ds = d.ExecuteProcedure("spUpdateUser");

            BlankTextboxes();
            Refresh();
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
      
            d.AddParam("@FirstName", txtFirstName.Text);
            d.AddParam("@LastName", txtLastName.Text);
            d.AddParam("@Title", txtTitle.Text);
            d.AddParam("@Phone", txtPhone.Text);
            d.AddParam("@Email", txtEmail.Text);
            d.AddParam("@Password", txtPassword.Text);
            d.AddParam("@AccessLevelID", txtAccessLevelID.Text);

            ds = d.ExecuteProcedure("spInsertUser");

            BlankTextboxes();
            Refresh();
        }

        private void BlankTextboxes()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtTitle.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtAccessLevelID.Text = "";
        }

        protected void lbTicketCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCategoryPage.aspx");
        }
    }
}