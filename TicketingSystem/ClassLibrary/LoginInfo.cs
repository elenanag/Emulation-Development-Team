using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class LoginInfo
    {
        public int UserID { get; set; }
        public int AccessLevelID { get; set; }
        public string Email { get; set; }

        public LoginInfo() { }

        public LoginInfo(int userID, int accessLevelID, string email)
        {
            this.UserID = userID;
            this.AccessLevelID = accessLevelID;
            this.Email = email;
        }
    }
}
