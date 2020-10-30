using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.DTO
{
    public class Account
    {
        public Account(string userName, string displayName, int type, string passWord = null)
        {
            this.UserName = userName;
            this.DisplayName = displayName;
            this.Type = type;
            this.PassWord = passWord;
        }

        public Account(DataRow row)
        {
            this.UserName = (string)row["userName"];
            this.DisplayName = (string)row["displayName"];
            this.Type = (int)row["type"];
            this.PassWord = (string)row["passWord"];
        }

        private int type;
        private string displayName;
        private string passWord;
        private string userName;

        public string UserName { get => userName; set => userName = value; }
        public string PassWord { get => passWord; set => passWord = value; }
        public string DisplayName { get => displayName; set => displayName = value; }
        public int Type { get => type; set => type = value; }
    }
}
