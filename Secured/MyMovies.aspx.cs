using MovieScrapper.Models;
using System;
using System.Globalization;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;

namespace MovieScrapper.Secured
{
    public partial class MyMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!Page.IsPostBack)
            //{

            //}

            TextBox1.Focus();
            if (HttpContext.Current.Request.HttpMethod == "GET")
            {
                var name = Request.QueryString["name"];
                    if (!string.IsNullOrEmpty(name))
                    {
                        TextBox1.Text = name;
                        RegisterAsyncTask(new PageAsyncTask(LoadMoviesAsync));
                    }
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Redirect();

            RegisterAsyncTask(new PageAsyncTask(LoadMoviesAsync));
        }

        private async Task LoadMoviesAsync()
        {
            var environmentKey = Environment.GetEnvironmentVariable("TMDB_API_KEY");
            var movieClient = new MovieClient(environmentKey);
            var searchedMovie = TextBox1.Text;
            try
            {
                var movies = await movieClient.SearchMovieAsync(searchedMovie);
                MoviesDataList.DataSource = movies.Results;
                MoviesDataList.DataBind();
            }
            catch (System.ArgumentNullException)
            {
                TextBox1.Text = "Please enter a title";
            }

        }

        protected string BuildUrl(string path)
        {
            
             return "http://image.tmdb.org/t/p/w92" + path;       
        }

        protected string DisplayYear(string dateString)
        {
            //DateTime res;
            //if (DateTime.TryParseExact(dateString, "yyyy-MM-dd", ))
            //{
                
            //}

            try
            {
                return DateTime.Parse(dateString, new CultureInfo("en-US", true)).Year.ToString();
            }
            catch (Exception e)
            {
                return null;
            }

        }

        protected string BuildUrlWithId(string id)
        {
            return "~/MovieDetails.aspx?id=" + id + "&back=Secured/MyMovies?name=" + TextBox1.Text;

        }

        protected void MoviesDataList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}