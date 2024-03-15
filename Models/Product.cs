using System.ComponentModel.DataAnnotations;

namespace CoreWebApp.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductDesc { get; set; }
        public string ProductPrice { get; set; }
        public string ProductCategory { get; set; } 
        public string ProductStock { get; set; }
    }
}
