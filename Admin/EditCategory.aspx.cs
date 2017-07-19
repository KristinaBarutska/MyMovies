﻿using MovieScrapper.Models;
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
            int id = Int32.Parse(Request.QueryString["id"]);
            
            using (var ctx = new MovieContext())
            {
                MovieCategory category = ctx.MovieCatergries.Where(x => x.Id == id).FirstOrDefault();
                EditCategoryTitleTextBox.Text = category.CategoryTtle;
                EditCategoryDescriptionTextBox.Text = category.CategoryDescription;
            }
            
        }

        protected void SaveChangesButton_Click(object sender, EventArgs e)
        {
            using (var ctx = new MovieContext())
            {
                MovieCategory category = new MovieCategory { CategoryTtle = EditCategoryTitleTextBox.Text, CategoryDescription = EditCategoryDescriptionTextBox.Text };
                ctx.MovieCatergries.Add(category);
                ctx.SaveChanges();
            }
        }
    }
}