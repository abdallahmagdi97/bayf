using System.ComponentModel.DataAnnotations;

namespace Byaf.Models.PaymentDetails
{
    public class PaymentStatus
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}