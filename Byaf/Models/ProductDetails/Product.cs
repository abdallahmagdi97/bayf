using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.ProductDetails
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public decimal TotalCost { get; set; }
        public decimal SalesPrice { get; set; }
        public decimal DiscountPrice { get; set; }
        public decimal Profit { get; set; }
        public int Qty { get; set; }
        public int StockStatus { get; set; }
        public string Description { get; set; }
        [NotMapped]
        public List<string> Images { get; set; }
    }
}
