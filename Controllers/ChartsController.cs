using CoreWebApp.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace CoreWebApp.Controllers
{
    public class ChartsController : Controller
    {
        public IConfiguration Configuration { get; }
        public ChartsController(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        [Authorize]
        public IActionResult Charts(Product product)
        {

            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            List<Product> lst = new List<Product>();
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "CategoryStockCharts";

            conn.Open();
            da.Fill(dt);
            conn.Close();

            foreach (DataRow dr in dt.Rows)
            {
                lst.Add(
                    new Product
                    { 
                        ProductCategory = Convert.ToString(dr["ProductCategory"]),
                        ProductStock = Convert.ToString(dr["ProductStock"]),

                    });
            }
            Product[] productArray = lst.ToArray();

            string[] productCategoryNames = productArray.Select(x => x.ProductCategory).ToArray();
            string[] productStock = productArray.Select(x => x.ProductStock).ToArray();


            ViewBag.ProductCategory = productCategoryNames;
            ViewBag.ProductStock = productStock;

            return View();
        }
    }
}
