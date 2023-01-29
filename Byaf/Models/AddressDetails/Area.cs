using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.AddressDetails
{
    public class Area
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        [ForeignKey("City")]
        public int CityId { get; set; }
    }
}