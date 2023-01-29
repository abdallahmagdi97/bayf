using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.PaymentDetails
{
    public class PaymentInfo
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Customer")]
        public int CustomerId { get; set; }
        public string CreditCard { get; set; }
        public string CreditCardNo { get; set; }
        public string CreditCardExpiryDate { get; set; }
        public string CVV { get; set; }
    }
}