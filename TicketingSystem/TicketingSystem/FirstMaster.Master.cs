using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmulationGroupProject
{
    public partial class FirstMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                lblwelcome.Visible = false;
                ImgBtnLogOut.Visible = false;
                lbAdmin.Visible = false;
            }

            else
            {
                LoginInfo user = (LoginInfo)Session["user"];

                lblwelcome.Text = user.Email;

                if (user.AccessLevelID == 1)
                {
                    lbAdmin.Visible = true;

                }
                else {
                    lbAdmin.Visible = false;
                }
            }
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

       

      
        protected void ImgBtnLogOut_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        protected void lbAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");

        }
    }
}