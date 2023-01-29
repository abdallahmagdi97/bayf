using System.ComponentModel.DataAnnotations;

namespace Byaf.Models.OrderDetails
{
    public class OrderStatus
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}