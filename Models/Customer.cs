namespace CoreWebApp.Models
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }

        public string Birthdate { get; set; }
        public string Password { get; set; }
        public string IsDelete { get; set; }

    }
}
