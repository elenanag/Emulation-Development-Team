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

namespace EmulationGroupProject
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            DAL d = new DAL(connStr); 
            d.AddParam("Email", txtEmail.Text);
            d.AddParam("Password", txtPassword.Text);

            DataSet ds = d.ExecuteProcedure("spLogin");
           
            if (ds.Tables.Count == 1 && ds.Tables[0].Rows.Count >= 1)
            {
                
                string email = ds.Tables[0].Rows[0]["Email"].ToString();
                string userId = ds.Tables[0].Rows[0]["UserID"].ToString();
                int userAccessID =Convert.ToInt32(ds.Tables[0].Rows[0]["AccessLevelID"]);
               
                LoginInfo user = new LoginInfo(Convert.ToInt32(userId), userAccessID,email);
                
                //lblMessage.Text = String.Format("Welcome back {0}!", email);
                //lblMessage.ForeColor = Color.Green;

                Session["user"] = user;

                if (userAccessID == 1)
                {
                    Response.Redirect("MainPage.aspx");
                }
                else if
                      (userAccessID == 2)
                {
                     Response.Redirect("MainPage.aspx");
                }
               // else
                //{
                //    Response.Redirect("LoginPage.aspx");
                //}
            }
            else
            {
                lblMessage.Text = "Sorry, incorrect username/password!";
                lblMessage.ForeColor = Color.Red;
            }
        }
        }
    }
