using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp.net_project
{
    public partial class index : System.Web.UI.Page
    {
        string conString1;
        DataContext db1;
        Table<allmovies> amovies;
        protected void Page_Load(object sender, EventArgs e)
        {
            conString1 = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            db1 = new DataContext(conString1);
            amovies = db1.GetTable<allmovies>();
            getMovie(1, labelMovieTitle1, labelMovieCompany1, labelMovieSummary1);
        }
        public void getMovie(int movieId,Label label1, Label label2, Label label3)        // self defined method for plugin movie 1 by id
        {
            amovies = db1.GetTable<allmovies>();
            var query1 = from m in amovies
                         where m.id == movieId
                         select m;
            //label1.Text = ((allmovies)query1).title.ToString();
            //label2.Text = ((allmovies)query1).company.ToString();
            //label3.Text = ((allmovies)query1).director.ToString() + " " + ((allmovies)query1).editor.ToString();
            foreach (allmovies all in query1)
            {
                label1.Text = all.title;
                label2.Text = all.company;
                label3.Text = all.director + " " + all.editor;
            }
        }
    }
}