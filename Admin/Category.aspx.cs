using MovieScrapper.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieScrapper.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var ctx = new MovieContext())
            {
                MovieCategory category = new MovieCategory() { Id = "2", CategoryTtle = "Fantasy", CategoryDescription = "Test2" };

                ctx.MovieCatergries.Add(category);
                ctx.SaveChanges();
                TextBox1.Text = category.CategoryTtle;
            }
        }
    }
}