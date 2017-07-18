using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MovieScrapper.Models
{
    public class MovieCategory
    {
        public int Id { get; set; }
        public string CategoryTtle { get; set; }
        public string CategoryDescription { get; set; }

        public ICollection<Movie> Movies { get; set; }
    }
}
