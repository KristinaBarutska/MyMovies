using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MovieScrapper.Models
{
    public class MovieContext: DbContext
    {
        public MovieContext(): base()
        {

        }

        public DbSet<Movie> Movies { get; set; }
        public DbSet<MovieCategory> MovieCatergries { get; set; }
    }
}