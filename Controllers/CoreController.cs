
using CoreWebApp.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;
using Microsoft.AspNetCore.CookiePolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using MySqlX.XDevAPI;
using Newtonsoft.Json.Linq;
using NuGet.Common;
using System.Configuration;
using System.Data;

using System.IdentityModel.Tokens.Jwt;
using System.Web; 
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;
using System.Web.Helpers;
using Google.Protobuf.WellKnownTypes;
using MySqlX.XDevAPI.Common;
using System.Linq.Expressions;

namespace CoreWebApp.Controllers
{
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class CoreController : Controller
    {
        String token = "";
        public IConfiguration Configuration { get; }
        public CoreController(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        //[Authorize]
        //public ActionResult Home()
        //{

        //    return View();
        //}

        public ActionResult Registration()
        {

            return View();
        }
        private bool IsUserAtLeast18(DateTime dateOfBirth)
        {
            var today = DateTime.Today;

            var age = today.Year - dateOfBirth.Year;
            bool val = false;
            if (age > 18)
            {
                val = true;
            }
            else if (age == 18)
            {
                if (today.Month >= dateOfBirth.Month)
                {
                    if (today.Day > dateOfBirth.Day)
                    {
                        val = true;
                    }
                    else
                    {
                        val = false;
                    }

                }
                else
                {
                    val = false;
                }
            }
            else
            {
                val = false;
            }


            
            //bool val = false;

            //if (age >= 18)
            //{
            //    return val = true;
            //}
            
            
            //bool val = age >= 18 && today.Month > dateOfBirth.Month || today.Month == dateOfBirth.Month && today.Day >= dateOfBirth.Day;


            return val;
        }
        //public string GetAlertMessage(string message)
        //{
        //    return $"<script>alert('{message}')</script>";
        //}
        //public ActionResult TargetAction(string message)
        //{
        //    ViewBag.AlertMessage = message;
        //    return View("YourView"); // Render the view with the message
        //}

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Registration(User user)
        {

            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            List<User> lst = new List<User>();
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "InsertData";

            cmd.Parameters.AddWithValue("@FirstName", user.FirstName);
            cmd.Parameters.AddWithValue("@LastName", user.LastName);
            cmd.Parameters.AddWithValue("@Email", user.Email);
            cmd.Parameters.AddWithValue("@Password", EncryptPasswordBase64(user.Password));
 

            if (!IsUserAtLeast18(user.Date))
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
                // page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert();", true);
                //string errorMessage = "User is Below of 18";
                //var belowAge = GetAlertMessage(errorMessage);
                //return new JsonResult(belowAge);
                //ViewBag.Message = "User is Below of 18";
                ////return View();
                //string message = "Success! Operation completed.";
                //return RedirectToAction("TargetAction", new { message = message });
                //SetErrorMessage("User must be at least 18 years old!");
                //GetAlertMessage("User must be at least 18 years old!");
                ViewData["message"] = "User must be at least 18 years old!";
                return View();
            }
            else
            {
                cmd.Parameters.AddWithValue("@Date", user.Date);
            }

            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            cmd.ExecuteNonQuery();


            conn.Close();

            // return Ok("Data is saved successfully.");
            return RedirectToAction("Login");
        }



        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login(Loginuser loginuser)
        {
            SqlConnection conn = new SqlConnection(Configuration.GetConnectionString("DefaultConnection"));
            User lstroll = new User();
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            cmd.CommandText = "LoginSP";
            cmd.CommandType = CommandType.StoredProcedure;
            var Username = loginuser.Username;
            var names = Username.Split(' ');
            var firstname = names[0];
            var lastname = names[1];
            loginuser.Firstname = firstname;
            loginuser.Lastname = lastname;
            cmd.Parameters.AddWithValue("@FirstName", firstname);
            cmd.Parameters.AddWithValue("@LastName", lastname);
            cmd.Parameters.AddWithValue("@Password", EncryptPasswordBase64(loginuser.Password) == null ? "" : EncryptPasswordBase64(loginuser.Password));
            User res = new User();
            SqlParameter Status = new SqlParameter();
            Status.ParameterName = "@Isvalid";
            Status.SqlDbType = SqlDbType.Bit;

            Status.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(Status);
            conn.Open();
            cmd.ExecuteNonQuery();

            conn.Close();
            if (Convert.ToString(Status.Value) == Convert.ToString(true))
            {
                token = GenerateJSONWebToken(loginuser);
                HttpClient client = new HttpClient();
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                HttpContext.Session.SetString("JWToken", token);
              //  return RedirectToAction("HomeController/Home");
                return RedirectToAction("Home", "Home");
            }
            else
            {
                return Content("User is Not Exiest");
            }


        }
        public static string EncryptPasswordBase64(string text)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(text);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        public static string DecryptPasswordBase64(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }

        private string GenerateJSONWebToken(Loginuser loginuser)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[] {
            new Claim(JwtRegisteredClaimNames.Name, loginuser.Username),
            new Claim(JwtRegisteredClaimNames.Prn, loginuser.Password)
            };

            var token = new JwtSecurityToken(Configuration["Jwt:Issuer"],
                Configuration["Jwt:Issuer"],
                claims,
                expires: DateTime.Now.AddMinutes(120),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
        public ActionResult Error()
        {

            return View();
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login","Core");
        }

    }

}
