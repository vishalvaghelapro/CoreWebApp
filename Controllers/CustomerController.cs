using CoreWebApp.Models;
using Humanizer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Data;


namespace CoreWebApp.Controllers
{
    public class CustomerController : Controller
    {
        public IConfiguration Configuration { get; }
        public CustomerController(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IActionResult Customer(Customer customer)
        {
            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            List<Customer> lst = new List<Customer>();
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "GetCustomer";

            conn.Open();
            da.Fill(dt);
            conn.Close();

            foreach (DataRow dr in dt.Rows)
            {
                lst.Add(
                    new Customer
                    {
                        CustomerId = Convert.ToInt32(dr["CustomerId"]),
                        FirstName = Convert.ToString(dr["FirstName"]),
                        LastName = Convert.ToString(dr["LastName"]),
                        Email = Convert.ToString(dr["Email"]),
                        PhoneNumber = Convert.ToString(dr["PhoneNumber"]),
                        Address = Convert.ToString(dr["Address"]),
                        Birthdate = Convert.ToString(dr["Birthdate"]),
                        Password = Convert.ToString(dr["Password"]),
                        IsDelete = Convert.ToString(dr["Isdelete"])

                    });
            }
            ViewBag.customer = lst;
            return View();
        }
    }
}
