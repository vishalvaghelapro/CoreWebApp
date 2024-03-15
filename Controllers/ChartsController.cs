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
        public IActionResult Charts(ProductCategory productCategory)
        {

            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            List<ProductCategory> lst = new List<ProductCategory>();
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "TotalCategorysp";

            conn.Open();
            da.Fill(dt);
            conn.Close();

            foreach (DataRow dr in dt.Rows)
            {
                lst.Add(
                    new ProductCategory
                    { 
                        ProductCategoryId = Convert.ToInt32(dr["ProductCategoryId"]),
                        ProductCategoryName = Convert.ToString(dr["ProductCategoryName"]),
                        ProductCategoryStock = Convert.ToString(dr["ProductCategoryStock"])
                    });
            }
            ProductCategory[] productCategoryArray = lst.ToArray();
            int[] productCategoryIds = productCategoryArray.Select(x => x.ProductCategoryId).ToArray();
            string[] productCategoryNames = productCategoryArray.Select(x => x.ProductCategoryName).ToArray();
            string[] productCategoryStocks = productCategoryArray.Select(x => x.ProductCategoryStock).ToArray();

            ViewBag.ProductCategoryIds = productCategoryIds;
            ViewBag.ProductCategoryNames = productCategoryNames;
            ViewBag.CategoryStocks = productCategoryStocks;
            // ViewBag.productCategory = lst;
            return View();
        }
    }
}
