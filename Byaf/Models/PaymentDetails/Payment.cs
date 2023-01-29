using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.PaymentDetails
{
    public class Payment
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [ForeignKey("PaymentType")]
        public int PaymentTypeId { get; set; }
        [ForeignKey("PaymentStatus")]
        public int PaymentStatusId { get; set; }
        [ForeignKey("Customer")]
        public int CustomerId { get; set; }
        public DateTime DateTime { get; set; }
        public bool Allowed { get; set; }
    }
}