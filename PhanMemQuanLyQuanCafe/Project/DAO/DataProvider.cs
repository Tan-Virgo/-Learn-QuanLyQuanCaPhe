using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.DAO
{
    public class DataProvider
    { 
        // mẫu Singleton (static  instance)
        private static DataProvider instance;
        public static DataProvider Instance 
        {
            get 
            { 
                if (instance == null) 
                    instance = new DataProvider(); 
                return DataProvider.instance; 
            }
            private set
            {
                DataProvider.instance = value;
            }
        }

        private DataProvider() { }



        // KẾT Nối database lưu cơ sở dữ liệu vô advanced và copy đường dẫn này lưu vào biến connectionSTR
        private string connectionSTR = @"Data Source=ADMIN\MSSQL_EXP_2008R2;Initial Catalog=QuanLyQuanCafe;Integrated Security=True";


        // trả ra một bảng
        public DataTable ExecuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            // sử dụng using để dữ liệu khai báo tự giải phóng
            using (SqlConnection connection = new SqlConnection(connectionSTR)) // kết nối từ clinet xuống server
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection); // câu truy vấn thực thi 

                if (parameter != null)
                {
                    string[] listPara = query.Split(' '); //  cắt từng parameter theo khoảng trắng
                    int i = 0;

                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command); // trung gian thực hiện câu truy vấn

                adapter.Fill(data); // đổ dữ liệu đã lấy ra vào data

                connection.Close();
            }

            return data;
        }


        // trả ra một số (số TRƯỜNG DỮ LIỆU THỎA MÃN trong sql)
        public int ExecuteNoneQuery(string query, object[] parameter = null)
        {
            int data = 0; 

            // sử dụng using để dữ liệu khai báo tự giải phóng
            using (SqlConnection connection = new SqlConnection(connectionSTR)) // kết nối từ clinet xuống server
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection); // câu truy vấn thực thi 

                if (parameter != null)
                {
                    string[] listPara = query.Split(' '); //  cắt từng parameter theo khoảng trắng
                    int i = 0;

                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();
                connection.Close();
            }

            return data;
        }


        // trả ra một đồi tượng vd count(*) trong sql
        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            // sử dụng using để dữ liệu khai báo tự giải phóng
            using (SqlConnection connection = new SqlConnection(connectionSTR)) // kết nối từ clinet xuống server
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection); // câu truy vấn thực thi 

                if (parameter != null)
                {
                    string[] listPara = query.Split(' '); //  cắt từng parameter theo khoảng trắng
                    int i = 0;

                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();
                connection.Close();
            }

            return data;
        }
    }
}
