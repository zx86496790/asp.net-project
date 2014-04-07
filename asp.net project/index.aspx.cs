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
        Table<cast> cast;
        protected void Page_Load(object sender, EventArgs e)
        {
            conString1 = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            db1 = new DataContext(conString1);
            amovies = db1.GetTable<allmovies>();
            cast = db1.GetTable<cast>();
            getMovie(1, labelMovieTitle1, labelMovieCompany1, labelMovieSummary1);
            getMovie(2, labelMovieTitle2, labelMovieCompany2, labelMovieSummary2);
            getMovie(3, labelMovieTitle3, labelMovieCompany3, labelMovieSummary3);
            getTopTen();
            getNewRelease();
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
        public void getTopTen()
        {
            cast = db1.GetTable<cast>();
            bulletedListTopTen.DataSource = (from c in cast
                         select c.castname ).Take(10);
            //label1.Text = ((allmovies)query1).title.ToString();
            //label2.Text = ((allmovies)query1).company.ToString();
            //label3.Text = ((allmovies)query1).director.ToString() + " " + ((allmovies)query1).editor.ToString();
            bulletedListTopTen.DataBind();
        }
        public void getNewRelease()
        {
            cast = db1.GetTable<cast>();
            bulletedListNewRelease.DataSource = (from c in cast
                                             select c.castname).Take(2);
            //label1.Text = ((allmovies)query1).title.ToString();
            //label2.Text = ((allmovies)query1).company.ToString();
            //label3.Text = ((allmovies)query1).director.ToString() + " " + ((allmovies)query1).editor.ToString();
            bulletedListNewRelease.DataBind();
        }
        protected void btnSpecials_Click(object sender, EventArgs e)
        {
            getMovie(4, labelMovieTitle1, labelMovieCompany1, labelMovieSummary1);
            getMovie(5, labelMovieTitle2, labelMovieCompany2, labelMovieSummary2);
            getMovie(6, labelMovieTitle3, labelMovieCompany3, labelMovieSummary3);
        }

        protected void btnClassics_Click(object sender, EventArgs e)
        {
            getMovie(7, labelMovieTitle1, labelMovieCompany1, labelMovieSummary1);
            getMovie(8, labelMovieTitle2, labelMovieCompany2, labelMovieSummary2);
            getMovie(9, labelMovieTitle3, labelMovieCompany3, labelMovieSummary3);
        }

        protected void btnOscars_Click(object sender, EventArgs e)
        {
            getMovie(10, labelMovieTitle1, labelMovieCompany1, labelMovieSummary1);
            getMovie(11, labelMovieTitle2, labelMovieCompany2, labelMovieSummary2);
            getMovie(12, labelMovieTitle3, labelMovieCompany3, labelMovieSummary3);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "admin" && TextBox2.Text == "admin")
            {
                Response.Redirect("book.aspx");
            }
            else
            {
                Label1.Text = "User does not exist";
                Label1.Visible=true;
            }
        }
    }
}