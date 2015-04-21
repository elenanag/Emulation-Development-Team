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
    public partial class AdminCategoryPage : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Refresh();
            }
            lblCategoryResult.Text = "";

            LinkButton lbAdmin = (LinkButton)Master.FindControl("lbAdmin");
            lbAdmin.Enabled = false;
            lbAdmin.Attributes["style"] = "color:red; font-weight:bold; font-size:x-large;";
        }

        private void Refresh()
        {
            DAL d = new DAL(connString);
            gvTicketCategory.DataSource = d.ExecuteProcedure("spGetTicketCategory");
            gvTicketCategory.DataBind();
        }

        protected void gvTicketCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateCategory")
            {
                UpdateCategory();
            }
            else if (e.CommandName == "DeleteCategory")
            {
                DeleteCategory();
            }
            else if (e.CommandName == "SelectCategory")
            {
                gvTicketCategory.SelectedIndex = Convert.ToInt32(e.CommandArgument);
                SelectCategory();
            }
        }

        private void SelectCategory()
        {
            string categoryID = gvTicketCategory.SelectedDataKey.Value.ToString();

            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
            d.AddParam("@TicketCategoryID", categoryID);
            ds = d.ExecuteProcedure("spGetTicketCategory");

            txtTicketCategoryName.Text = ds.Tables[0].Rows[0]["CategoryName"].ToString();

            gvTicketCategory.SelectedRowStyle.BackColor = Color.LightGray;

        }

        private void DeleteCategory()
        {
            try
            {
                string categoryID = gvTicketCategory.SelectedDataKey.Value.ToString();
                DAL d = new DAL(connString);
                DataSet ds = new DataSet();
                d.AddParam("@TicketCategoryID", categoryID);
                ds = d.ExecuteProcedure("spDeleteTicketCategory");
            }
            catch
            {
                lblCategoryResult.Text = "Cannot Delete selected Category!";
            }

            Refresh();
        }

        private void UpdateCategory()
        {
            string categoryID = gvTicketCategory.SelectedDataKey.Value.ToString();
            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
            d.AddParam("@TicketCategoryID", categoryID);
            d.AddParam("@CategoryName", txtTicketCategoryName.Text);

            ds = d.ExecuteProcedure("spUpdateTicketCategory");

            Refresh();
        }

        protected void btnAddTicketCategoryName_Click(object sender, EventArgs e)
        {
            DAL d = new DAL(connString);
            DataSet ds = new DataSet();
            d.AddParam("@CategoryName", txtTicketCategoryName.Text);
            ds = d.ExecuteProcedure("spInsertTicketCategory");

            Refresh();
        }

        protected void lbUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }

    }
}