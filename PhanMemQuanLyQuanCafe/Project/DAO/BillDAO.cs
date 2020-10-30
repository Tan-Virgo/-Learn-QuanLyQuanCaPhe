﻿using Project.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;
        public static BillDAO Instance 
        {
            get
            {
                if (instance == null)
                    instance = new BillDAO();
                return instance;
            }
            private set => instance = value; 
        }

        private BillDAO() { }


        // nếu thành công -> billID, thất bại -> -1
        public int GetUncheckBillIDByTableID(int id)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery(
                "SELECT * FROM dbo.Bill WHERE idTable = " + id + " AND status = 0");

            if (data.Rows.Count > 0)
            {
                Bill bill = new Bill(data.Rows[0]);
                return bill.ID;
            }

            return -1;
        }

        public void CheckOut(int id, int discount, double totalPrice)
        {
            string query = "UPDATE dbo.Bill SET dateOut = GETDATE(), status = 1 , " + "discount = " + discount +  " , totalPrice = " + totalPrice + " WHERE id = " + id;
            DataProvider.Instance.ExecuteNoneQuery(query);
        }

        public void InsertBill(int id)
        {
            DataProvider.Instance.ExecuteNoneQuery("exec USP_InsertBill @idTable", new object[] { id });
        }

        public DataTable GetBillByDate(DateTime checkIn, DateTime checkOut)
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListBillByDate @checkin , @checkout", new object[] { checkIn, checkOut});
        }

        public DataTable GetListBillByDateAndPage(DateTime checkIn, DateTime checkOut, int pageNum)
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListBillByDateAndPage @checkin , @checkout , @page", new object[] { checkIn, checkOut, pageNum });
        }

        public int GetNumBillByDate(DateTime checkIn, DateTime checkOut)
        {
            return (int)DataProvider.Instance.ExecuteScalar("exec USP_GetNumBillByDate @checkin , @checkout", new object[] { checkIn, checkOut });
        }

        public int GetMaxIDBill()
        {
            try
            {
                return (int)DataProvider.Instance.ExecuteScalar("SELECT MAX(id) FROM dbo.Bill");
            }
            catch
            {
                return 1;
            }
        }

    }
}
