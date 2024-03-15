using CoreWebApp.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CoreWebApp.Controllers
{
    public class HomeController : Controller
    {
        public IConfiguration Configuration { get; }
        public HomeController(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        [Authorize]
        public IActionResult Home(TotalData totalData)
        {
            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            List<TotalData> lst = new List<TotalData>();
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "TotalDataSp";

            conn.Open();
            da.Fill(dt);
            conn.Close();

            foreach (DataRow dr in dt.Rows)
            {
                lst.Add(
                    new TotalData
                    {
                        TotalCustomer = Convert.ToInt32(dr["TotalCustomer"]),
                        TotalProduct  = Convert.ToInt32(dr["TotalProduct"]),
                        TotalProductCategory = Convert.ToInt32(dr["TotalProductCategory"])
                    });
            }
            ViewBag.TotalData = lst;
            return View();
            
        }
    }
}
