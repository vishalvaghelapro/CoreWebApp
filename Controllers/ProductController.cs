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
      
        
    }
}
