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

        protected void CategoryTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void SubmitCategoryButton_Click(object sender, EventArgs e)
        {
            AddCategory();
                    
        }

        private void AddCategory()
        {          
            var catrgoryTitle = CategoryTextBox.Text;
            var catrgoryDescription = DescriptionTextBox.Text;
            using (var ctx = new MovieContext())
            {
                MovieCategory category = new MovieCategory() { CategoryTtle = catrgoryTitle, CategoryDescription = catrgoryDescription };
                
                    ctx.MovieCaterogries.Add(category);
                    ctx.SaveChanges();
                    Label1.Text = category.CategoryTtle + " added";                               

            }

        }

        protected void BackToShowCategoriesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("GetCategory.aspx");
        }
    }
}