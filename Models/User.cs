using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CoreWebApp.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set; }
        [Required(ErrorMessage ="Firstname is Must")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Lastname is Must")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "Email is Must")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Password is Must")]
        public string Password { get; set; }
        [Compare("Password",ErrorMessage = "Password Not be Identical")]
        [Required(ErrorMessage = "Confirm Password is Must")]
        public string ConPassword { get; set; }

    
        public DateTime Date { get; set; }
        public string Status { get; set; }
        public string UserStatus { get; set; }
        public string TokenString { get; set; }
      


    }
}
