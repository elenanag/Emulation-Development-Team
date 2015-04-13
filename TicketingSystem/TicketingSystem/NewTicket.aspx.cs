using ClassLibrary;
using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketingSystem
{
    public partial class NewTicket : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateTicketCategory();

        }

        private void PopulateTicketCategory()
        {
            DAL d = new DAL(connString);
            DataSet ds = d.ExecuteProcedure("spGetTicketCategory");
            ddItIssue.DataTextField = "CategoryName";
            ddItIssue.DataValueField = "TicketCategoryID";
            ddItIssue.DataSource = ds;
            ddItIssue.DataBind();

        }

        protected void btnSubmitRequest_Click(object sender, EventArgs e)
        {
                LoginInfo user = (LoginInfo)Session["user"];
                int clientID = user.UserID;
                DAL d = new DAL(connString);
                DataSet ds = new DataSet();
                d.AddParam("Summary", txtSummary.Text);
                d.AddParam("Description", txtDescription.Text);
                d.AddParam("DateCreated", DateTime.Now.ToString());
                d.AddParam("TicketCategoryID", ddItIssue.SelectedItem.Value.ToString());
                d.AddParam("ClientID", clientID);

                ds = d.ExecuteProcedure("spInsertTicket");

                string filepath = Server.MapPath("\\attachment");
                HttpFileCollection uploadedFiles = Request.Files;


                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    d = new DAL(connString);
                    HttpPostedFile userPostedFile = uploadedFiles[i];
                    int newestTicketID = Convert.ToInt32(ds.Tables[0].Rows[0]["Newest TicketID"]);

                    d.AddParam("ImagePath", "attachment\\" + Path.GetFileName(userPostedFile.FileName));
                    d.AddParam("ClientID", clientID);
                    d.AddParam("TicketID", newestTicketID);
                    d.AddParam("DateOfAttachment", DateTime.Now.ToString());

                    d.ExecuteProcedure("spInsertTicketAttachment");

                    userPostedFile.SaveAs(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                }

                Response.Redirect("TicketConfirmation.aspx");
            }

        protected void btnClearAttachment_Click(object sender, EventArgs e)
        {

        }
        }
    } 
