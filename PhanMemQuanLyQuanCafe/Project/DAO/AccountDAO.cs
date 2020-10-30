using Project.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Project.DAO
{
    public class AccountDAO
    {
        private  static AccountDAO instance;
        public static AccountDAO Instance 
        {
            get
            {
                if (instance == null)
                    instance = new AccountDAO();
                return instance;
            }
            private set => instance = value; 
        }

        private AccountDAO() { }

        public bool UpdateAccount(string userName, string displayName, string pass, string newPass)
        {
            int result = DataProvider.Instance.ExecuteNoneQuery("exec USP_UpdateAccount @userName , @displayName , @passWord , @newPassword ", new object[] { userName, displayName, pass, newPass});
            return result > 0;
        }

        public DataTable GetListAccount()
        {
            return DataProvider.Instance.ExecuteQuery("SELECT UserName, DisplayName, Type FROM Account");
        }

        public bool Login(string userName, string passWord)
        {
            byte[] temp = ASCIIEncoding.ASCII.GetBytes(passWord); // chuyển mật khẩu về dạng chuỗi các byte

            byte[] hashData = new MD5CryptoServiceProvider().ComputeHash(temp); // lưu kết quả bâm (đã mã hóa) dưới dạng ngôn ngự máy (ComputeHash)

            string hashPass = "";

            foreach (byte item in hashData)
            {
                hashPass += item;
            }

           // Nếu có nhu cầu:
            //var list = hashData.ToString(); // chuyển sang chuổi
            //list.Reverse(); // đảo chuổi lại (đảm bảo bảo mật cao)
            // ko xài vì đã có hàm dưới server rồi, thêm cũng dc nhưng viết code lại cực lắm nên thôi nha, biết thôi

            string query = "exec USP_Login @userName , @passWord"; // cần dấu cách trước dấu phẩy mới được nha!!!

            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] { userName, hashPass /*list thay cho hashpass*/});
            
            return result.Rows.Count > 0; // đếm số dòng trả ra lớn hơn 0 (có dữ liệu thỏa câu truy vấn)
        }

        public Account GetAccountByUserName(string userName)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("select * from Account where userName = '" + userName + "'");

            foreach (DataRow item in data.Rows)
            {
                return new Account(item);
            }
            return null;
        }

        public bool InsertAccount(string userName, string displayName, int type)
        {
            string query = string.Format("INSERT INTO dbo.Account (UserName, DisplayName, Type, password) VALUES ( N'{0}', N'{1}', {2}, N'{3}')", userName, displayName, type, "1962026656160185351301320480154111117132155");
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }

        public bool UpdateAccount(string userName, string displayName, int type)
        {
            string query = string.Format("UPDATE dbo.Account SET DisplayName = N'{1}' , Type = {2} WHERE UserName = N'{0}' ", userName, displayName, type);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }

        public bool DeleteAccount(string userName)
        {
            string query = string.Format("DELETE Account WHERE username = N'{0}'", userName);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }

        public bool ResetPassword(string userName)
        {
            string query = string.Format("UPDATE Account SET password = N'1962026656160185351301320480154111117132155' WHERE username = N'{0}'", userName);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }
    }
}
