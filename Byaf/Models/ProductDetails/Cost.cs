using System.ComponentModel.DataAnnotations;

namespace Byaf.Models.ProductDetails
{
    public class Cost
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
    }
}
