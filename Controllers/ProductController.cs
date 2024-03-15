using CoreWebApp.Models;
using Humanizer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Data;

namespace CoreWebApp.Controllers
{
    public class ProductController : Controller
    {
        public IConfiguration Configuration { get; }
        public ProductController(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        [Authorize]
            public IActionResult Productlist(Product product)
            {

                SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
                List<Product> lst = new List<Product>();
                SqlCommand cmd = conn.CreateCommand();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "GetProduct";

                conn.Open();
                da.Fill(dt);
                conn.Close();

                foreach (DataRow dr in dt.Rows)
                {
                    lst.Add(
                        new Product
                        {
                            ProductId = Convert.ToInt32(dr["ProductId"]),
                            ProductName = Convert.ToString(dr["ProductName"]),
                            ProductDesc = Convert.ToString(dr["ProductDesc"]),
                            ProductPrice = Convert.ToString(dr["ProductPrice"]),
                            ProductCategory = Convert.ToString(dr["ProductCategory"]),
                            ProductStock = Convert.ToString(dr["ProductStock"])
                        });
                }
                ViewBag.product = lst;
                return View();
            }
        public IActionResult AddProduct(Product product) 
        {
            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            List<Product> lst = new List<Product>();
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "InsertData";

            cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
            cmd.Parameters.AddWithValue("@ProductDesc", product.ProductDesc);
            cmd.Parameters.AddWithValue("@ProductPrice", product.ProductPrice);
            cmd.Parameters.AddWithValue("@ProductCategory", product.ProductCategory);
            cmd.Parameters.AddWithValue("@ProductStock", product.ProductStock);



            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            cmd.ExecuteNonQuery();


            conn.Close();

            // return Ok("Data is saved successfully.");
            return View();
        }
        public IActionResult AddProduct()
        {
            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            List<Product> categories = new List<Product>();
            SqlCommand catCmd = conn.CreateCommand();
            catCmd.CommandType = CommandType.Text;
            catCmd.CommandText = "Select DISTINCT ProductCategory from Product;"; // Replace with your query

            conn.Open();
            SqlDataReader reader = catCmd.ExecuteReader();
            while (reader.Read())
            {
                categories.Add(
                    new Product 
                    {
                        ProductCategory = Convert.ToString(reader["ProductCategory"]) 
                    });
            }
            reader.Close();
            conn.Close();

            // Pass categories to the view
            ViewBag.categories = categories;
            return View();
        }
        
    }
}
