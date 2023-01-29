using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.ProductDetails
{
    public class Category
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        [ForeignKey("Category")]
        public int ParentCategoryId { get; set; }
        public string Image { get; set; }
        public int ProductCount { get; set; }
    }
}
