using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieTicketBooking
{
    public partial class SelectMovie : Page
    {
        private readonly string connectionStr = @"Data Source=AATHAVAN\SQLEXPRESS;Initial Catalog=MovieDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdowns();
            }
        }

        private void BindDropdowns()
        {
            BindDropdown(movieDropdown, "MovieName", GetTableNameForLanguage(Session["SelectedLanguage"]?.ToString()));
            BindDropdown(locationDropdown, "LocationName", "Locations");
        }

        private void BindDropdown(DropDownList dropdown, string textField, string tableName)
        {
            if (string.IsNullOrEmpty(tableName))
            {
                Response.Write($"Invalid table: {tableName}");
                return;
            }

            using (var sqlConnection = new SqlConnection(connectionStr))
            using (var sqlCommand = new SqlCommand($"SELECT {textField} FROM {tableName}", sqlConnection))
            {
                sqlConnection.Open();
                using (var reader = sqlCommand.ExecuteReader())
                {
                    dropdown.DataSource = reader;
                    dropdown.DataTextField = dropdown.DataValueField = textField;
                    dropdown.DataBind();
                    dropdown.Items.Insert(0, new ListItem($"--Select {textField}--", ""));
                }
            }
        }

        private string GetTableNameForLanguage(string language)
        {
            switch (language?.ToLower())
            {
                case "tamil": 
                    return "TamilMovies";
                case "english": 
                    return "EnglishMovies";
                case "hindi": 
                    return "HindiMovies";
                default: 
                    return null;
            }
        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["SelectedMovie"] = movieDropdown.SelectedValue;
                Session["SelectedLocation"] = locationDropdown.SelectedValue;
                Response.Redirect("ConfirmationPage.aspx");
            }
        }
    }
}
