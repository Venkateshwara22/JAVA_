using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Alternate_Movie_Endings.Models;

namespace Alternate_Movie_Endings.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<Alternate_Movie_Endings.Models.Movies>? Movies { get; set; }
    }
}