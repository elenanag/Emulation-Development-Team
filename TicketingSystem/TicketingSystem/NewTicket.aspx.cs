using ClassLibrary;
using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
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

            if (FileUpload1.FileName != "")
            {
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
            }

            //SendEmail();

            Response.Redirect("TicketConfirmation.aspx");
        }

        //private void SendEmail()
        //{
        //    LoginInfo user = (LoginInfo)Session["user"];
        //    int customerID = user.UserID;

        //    MailMessage message = new MailMessage();
        //    message.From = new MailAddress("elena.nagberi@robertsoncollege.net");
        //    message.To.Add(new MailAddress(user.Email));
        //    message.Subject = "Ticketing System Confirmation!";
        //    message.Body = "Submited ticket received, thank you. Robertson College Ticketing System";
        //    SmtpClient client = new SmtpClient();
        //    client.Host = "smtp.gmail.com";
        //    client.Port = 587;
        //    client.EnableSsl = true;
        //    client.Credentials = new System.Net.NetworkCredential("elena.nagberi@robertsoncollege.net", "xxxxxx");
        //    client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //    client.Send(message);

        //}
    }
} 
