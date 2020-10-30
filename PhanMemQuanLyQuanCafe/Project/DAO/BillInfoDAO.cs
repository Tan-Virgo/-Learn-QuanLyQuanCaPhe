using Project.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.DAO
{
    public class BillInfoDAO
    {
        private static BillInfoDAO instance;

        public static BillInfoDAO Instance
        {
            get
            {
                if (instance == null)
                    instance = new BillInfoDAO();
                return instance;
            }

            private set => instance = value;
        }

        private BillInfoDAO() { }


        public void DeleteBillInfoByIDFood(int id)
        {
            DataProvider.Instance.ExecuteQuery("DELETE dbo.BillInfo WHERE id = " + id);
        }

        public List<Menu> GetListBillInfo(int id)
        {
            List<Menu> listBillInfo = new List<Menu>();

            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.BillInfo WHERE idBill = " + id);
            foreach (DataRow item in data.Rows)
            {
                Menu info = new Menu(item);
                listBillInfo.Add(info);
            }

            return listBillInfo; 
        }

        public void InsertBillInfo(int idBill, int idFood, int count)
        {
            DataProvider.Instance.ExecuteNoneQuery("exec USP_InsertBillInfo @idBill , @idFood , @count", new object[] { idBill, idFood, count});
        }
    }
}

