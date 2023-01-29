using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace Byaf.Models.User
{
    public class ApplicationUser : IdentityUser
    {
        public string Password { get; set; }
        public string Role { get; set; }
    }
}
