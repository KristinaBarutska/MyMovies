using MovieScrapper.Models;
using System;
using System.Globalization;
using System.Threading.Tasks;
using System.Web.UI;

namespace MovieScrapper.Secured
{
    public partial class MyMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            RegisterAsyncTask(new PageAsyncTask(LoadMoviesAsync));
        }

        private async Task LoadMoviesAsync()
        {
            var environmentKey = Environment.GetEnvironmentVariable("TMDB_API_KEY");
            var movieClient = new MovieClient(environmentKey);
            var searchedMovie = TextBox1.Text;
            var movies = await movieClient.SearchMovieAsync(searchedMovie);
            MoviesDataList.DataSource = movies.Results;
            MoviesDataList.DataBind();

            /*foreach (var movie in movies.Results)
            {
                Label1.Text = movie.Title;
            }*/

            /*var id = TextBox1.Text;
            var movie1 = await movieClient.GetMovieAsync(id);
            if (movie1 == null)
            {
                Label1.Text = "There is not a movie with this Id.";
            }
            else
            {
                Label1.Text = movie1.Title;
            }*/
        }

        protected string BuildUrl(string path)
        {
            
             return "http://image.tmdb.org/t/p/w92" + path;       
        }

        protected int DisplayYear(string dateString)
        {
            return DateTime.Parse(dateString, new CultureInfo("en-US", true)).Year;

        }

        protected string BuildUrlWithId(string id)
        {
            return "~/MovieDetails.aspx?id=" + id;

        }

        protected void MoviesDataList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}