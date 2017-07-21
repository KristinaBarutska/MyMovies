using MovieScrapper.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieScrapper.Admin
{
    public partial class EditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Int32.Parse(Request.QueryString["id"]);
                using (var ctx = new MovieContext())
                {
                    //MovieCategory category = ctx.MovieCaterogries.Where(x => x.Id == id).FirstOrDefault();
                    MovieCategory category = ctx.MovieCaterogries.FirstOrDefault(c => c.Id == id);
                    EditCategoryTitleTextBox.Text = category.CategoryTtle;
                    EditCategoryDescriptionTextBox.Text = category.CategoryDescription;
                }
            }
        }

        protected void SaveChangesButton_Click(object sender, EventArgs e)
        {

            int id = Int32.Parse(Request.QueryString["id"]);
            using (var ctx = new MovieContext())
            {
                MovieCategory category = ctx.MovieCaterogries.Where(x => x.Id == id).FirstOrDefault();
                category.CategoryTtle = EditCategoryTitleTextBox.Text;
                category.CategoryDescription = EditCategoryDescriptionTextBox.Text;
                ctx.Entry(category).State = System.Data.Entity.EntityState.Modified;               
                ctx.SaveChanges();
            }
            Response.Redirect("GetCategory.aspx");
        }

        protected void DeleteCategoryButton_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            using (var ctx = new MovieContext())
            {
                MovieCategory category = ctx.MovieCaterogries.Where(x => x.Id == id).FirstOrDefault();
                
                ctx.Entry(category).State = System.Data.Entity.EntityState.Deleted;
                ctx.SaveChanges();
            }
            Response.Redirect("GetCategory.aspx");
        }
       
    }
}