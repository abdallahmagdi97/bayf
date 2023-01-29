using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.AddressDetails
{
    public class Address
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string LandMark { get; set; }
        public string PostalCode { get; set; }
        [ForeignKey("Area")]
        public int AreaId { get; set; }
        [ForeignKey("Customer")]
        public int CustomerId { get; set; }
    }
}