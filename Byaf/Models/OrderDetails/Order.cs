using Microsoft.CodeAnalysis.CSharp.Syntax;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Byaf.Models.PaymentDetails;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.OrderDetails
{
    public class Order
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Customer")]
        public int CustomerId { get; set; }
        [ForeignKey("Payment")]
        public int PaymentId { get; set; }
        public DateTime DateTime { get; set; }
        [ForeignKey("OrderStatus")]
        public int OrderStatusId { get; set; }
    }
}
