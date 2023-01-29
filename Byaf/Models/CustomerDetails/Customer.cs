using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Byaf.Models.AddressDetails;
using Byaf.Models.PaymentDetails;

namespace Byaf.Models.CustomerDetails
{
    public class Customer
    {
        [Key]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        [NotMapped]
        public string Password { get; set; }
    }
}
