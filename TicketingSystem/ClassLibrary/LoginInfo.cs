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
        public int AccessLevelName { get; set; }
        public string Email { get; set; }

        public LoginInfo() { }

        public LoginInfo(int userID, int accessLevelName, string email)
        {
            this.UserID = userID;
            this.AccessLevelName = accessLevelName;
            this.Email = email;
        }
    }
}
