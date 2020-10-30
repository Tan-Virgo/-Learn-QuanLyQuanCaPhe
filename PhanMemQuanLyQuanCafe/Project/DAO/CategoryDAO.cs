using Project.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.DAO
{
    public class CategoryDAO
    {
        private static CategoryDAO instance;

        public static CategoryDAO Instance 
        {
            get
            {
                if (instance == null)
                    instance = new CategoryDAO();
                return instance;
            }
            private set => instance = value; 
        }

        private CategoryDAO() { }

        public List<Category> GetListCategory()
        {
            List<Category> listCategory = new List<Category>();

            string query = "SELECT* FROM dbo.FoodCategory";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Category category = new Category(item);

                listCategory.Add(category);
            }

            return listCategory;
        }

        public Category GetCategoryByID(int id)
        {
            Category category = null;

            string query = "SELECT* FROM dbo.FoodCategory WHERE id = " + id;
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                category = new Category(item);

                return category;
            }

            return category;
        }


        public bool InsertCategory(string name)
        {
            string query = string.Format("INSERT INTO dbo.FoodCategory (name) VALUES ( N'{0}')", name);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }

        public bool UpdateCategory(int id, string name)
        {
            string query = string.Format("UPDATE dbo.FoodCategory SET name = N'{0}' WHERE id = {1} ", name, id);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }

        public bool DeleteCategory(int idCategory)
        {
            string query = string.Format("DELETE FoodCategory WHERE id = {0}", idCategory);
            int result = DataProvider.Instance.ExecuteNoneQuery(query);

            return result > 0;
        }
    }
}
