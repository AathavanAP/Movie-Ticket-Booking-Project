using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace MovieTicketBooking
{
    public partial class _Default : Page
    {
        private string connectionstr = @"Data Source=AATHAVAN\SQLEXPRESS;Initial Catalog=MovieDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMovieLanguages(); // Calls a method to populate the dropdown list with movie languages when the page loads
            }
        }
        private void BindMovieLanguages()
        {
            using (var sqlConnection = new SqlConnection(connectionstr))
            using (var sqlCommand = new SqlCommand("SELECT MovieLanguage FROM Language", sqlConnection))
            {
                sqlConnection.Open();
                using (var reader = sqlCommand.ExecuteReader())
                {
                    movieLanguage.DataSource = reader;
                    movieLanguage.DataTextField = "MovieLanguage";
                    movieLanguage.DataValueField = "MovieLanguage";
                    movieLanguage.DataBind();
                }
                movieLanguage.Items.Insert(0, new ListItem("--Select Language--", ""));
            }
        }
        protected void NextButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // Check if all validation controls pass
            {
                Session["UserName"] = Name.Text;
                Session["SelectedLanguage"] = movieLanguage.SelectedValue;
                Session["PhoneNumber"] = phoneNumber.Text;
                Response.Redirect("SelectMovie.aspx");
            }
        }
    }
}
