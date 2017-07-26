using System.Data.Entity;

namespace MovieScrapper.Models
{
    public class MovieContext: DbContext
    {
        public MovieContext(): base("DefaultConnection")
        {

        }

        public DbSet<Movie> Movies { get; set; }
        public DbSet<MovieCategory> MovieCaterogries { get; set; }
    }
}