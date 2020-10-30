﻿using Project.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.DAO
{
    public class FoodDAO
    {
        private static FoodDAO instance;

        public static FoodDAO Instance
        {
            get
            {
                if (instance == null)
                    instance = new FoodDAO();
                return instance;
            }
            private set => instance = value;
        }

        private FoodDAO() { }

        public List<Food> GetFoodByCategoryID(int id)
        {
            List<Food> listFood = new List<Food>();

            string query = "SELECT * FROM dbo.Food WHERE idCategory = " + id;
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Food category = new Food(item);

                listFood.Add(category);
            }

            return listFood;
        }

        public List<Food> GetListFood()
        {
            List<Food> listFood = new List<Food>();

            string query = "SELECT * FROM dbo.Food";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Food category = new Food(item);

                listFood.Add(category);
            }

            return listFood;
        }

        public List<Food> SearchFoodByName(string name)
        {
            List<Food> listFood = new List<Food>();

            string query = string.Format("SELECT * FROM Food where Name like N'%{0}%'" + name);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Food food = new Food(item);

                listFood.Add(food);
            }

            return listFood;
        }

        public bool InsertFood(string name, int id, float price)
        {
            string query = string.Format("INSERT INTO dbo.Food (name, idCategory, price) VALUES ( N'{0}', {1}, {2})", name, id, price);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }

        public bool UpdateFood(int idFood, string name, int id, float price)
        {
            string query = string.Format("UPDATE dbo.Food SET name = N'{0}' , idCategory = {1} , price = {2} WHERE id = {3} ", name, id, price, idFood);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }

        public bool DeleteFood(int idFood)
        {
            BillInfoDAO.Instance.DeleteBillInfoByIDFood(idFood);

            string query = string.Format("DELETE Food WHERE id = {0}", idFood);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }
    }
}
