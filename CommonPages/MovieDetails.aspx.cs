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

        protected int DisplayYear(string dateString)
        {
            return DateTime.Parse(dateString, new CultureInfo("en-US", true)).Year;
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void AddMovieToCategoryButton_Click(object sender, EventArgs e)
        {
            var movie = ViewState["Movie"] as Movie;
            if (movie != null)
            {
                var categoryId = Request.QueryString["categoryId"];
                var movieId = Request.QueryString["id"];

                using (var ctx = new MovieContext())
                {
                    var databaseMovie = ctx.Movies.Find(movie.Id);
                    if (databaseMovie != null)
                    {
                        databaseMovie = movie;
                        ctx.Entry(databaseMovie).State = System.Data.Entity.EntityState.Modified;
                        ctx.SaveChanges();
                    }

                    else
                    {
                        ctx.Movies.Add(movie);
                        ctx.SaveChanges();
                    }
                    

                    //Label1.Text = movie.Title;
                   

                }
            }          

        }
    }
}