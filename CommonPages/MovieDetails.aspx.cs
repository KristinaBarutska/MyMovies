using MovieScrapper.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieScrapper
{
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {      
            
            RegisterAsyncTask(new PageAsyncTask(LoadMovieDetailsAsync));

            if (HttpContext.Current.User.IsInRole("admin") & Request.QueryString["categoryId"]!=null)
            {
                AddMovieToCategoryButton.Visible = true;
            }
            else
            {
                AddMovieToCategoryButton.Visible = false;
            }

        }

        private async Task LoadMovieDetailsAsync()
        {
            var environmentKey = Environment.GetEnvironmentVariable("TMDB_API_KEY");
            var movieClient = new MovieClient(environmentKey);
            var id= Request.QueryString["id"];
            var movie = await movieClient.GetMovieAsync(id);

            DetailsView1.DataSource = new Movie[] { movie };
            DetailsView1.DataBind();

            ViewState["Movie"] = movie;

        }

        protected string BuildUrl(string path)
        {
            return "http://image.tmdb.org/t/p/w185" + path;
        }

        protected string BuildBackUrl()
        {
            
            string backUrl = Request.QueryString["back"];
            return backUrl;
        }

        protected string DisplayYear(string dateString)
        {
            DateTime res;

            if (DateTime.TryParse(dateString, out res))
            {
                return res.Year.ToString();
            }
            else
            {
                return dateString;
            }
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void AddMovieToCategoryButton_Click(object sender, EventArgs e)
        {
            var movie = ViewState["Movie"] as Movie;
            if (movie != null)
            {
                var categoryId = Int32.Parse(Request.QueryString["categoryId"]);
                var movieId = Request.QueryString["id"];

                using (var ctx = new MovieContext())
                {
                    var databaseMovie = ctx.Movies.Find(movie.Id);
                    var databaseCategory = ctx.MovieCaterogries.Include("Movies").SingleOrDefault(x => x.Id == categoryId);
                    var categoryTitle = databaseCategory.CategoryTtle;


                    var foundedMovie = databaseCategory.Movies.FirstOrDefault(x => x.Id == movieId);

                    //var IsMovieFound = ctx.MovieCaterogries.Any(cat => cat.Id == categoryId && cat.Movies.Any(m => m.Id == movieId));


                    //var foundedMovie = ctx.MovieCaterogries.SelectMany(c => c.Movies).ToList().Find(m => m.Id == movieId);
                    //Insert movie in the local DB
                    if (databaseMovie != null)
                    {
                        //databaseMovie = movie;
                        //ctx.Entry(databaseMovie).State = System.Data.Entity.EntityState.Modified;
                        //ctx.SaveChanges();
                        Label1.Text = "This movie is already in the DB";
                    }

                    else
                    {
                        databaseMovie = ctx.Movies.Add(movie);
                        ctx.SaveChanges();
                        Label1.Text = "The movie " + movie.Title + " was added in the DB";

                    }

                    if (foundedMovie!=null)
                    {

                       Label2.Text = "This movie is already in the category " + categoryTitle;
                    }

                    else
                    {
                        databaseCategory.Movies.Add(databaseMovie);
                        //foundedMovie.MovieCategories.Add(databaseCategory);
                        //ctx.Entry(databaseCategory).State = System.Data.Entity.EntityState.Modified;
                        ctx.SaveChanges();
                        Label2.Text = "The movie " + movie.Title + " was added in category " + categoryTitle;
                    }

                }
            }          

        }

        protected string ShowCategoryTitle()
        {
            var categoryId = Int32.Parse(Request.QueryString["categoryId"]);
            using (var ctx = new MovieContext())
            {
                var databaseCategory = ctx.MovieCaterogries.Find(categoryId);
                return databaseCategory.CategoryTtle;
            }

        }
    }
}