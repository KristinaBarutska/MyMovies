using MovieScrapper.Models;
using System;
using System.Linq;

namespace MovieScrapper.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SubmitCategoryButton_Click(object sender, EventArgs e)
        {
            AddCategory();                 
        }

        public void AddCategory()
        {          
            var catrgoryTitle = CategoryTextBox.Text;
            var catrgoryDescription = DescriptionTextBox.Text;
            try
            {
                using (var ctx = new MovieContext())
                {
                    MovieCategory category = new MovieCategory() { CategoryTtle = catrgoryTitle, CategoryDescription = catrgoryDescription };

                    ctx.MovieCaterogries.Add(category);
                    ctx.SaveChanges();

                }
                Response.Redirect("Categories.aspx");
            }
            catch (Exception e)
            {
                Label1.Text = e.Message;
            }

        }

        protected void BackToCategoriesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories.aspx");
        }
    }
}