using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace MovieTicketBooking
{
    public partial class BookingHistory : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookingHistory();
            }
        }

        private void LoadBookingHistory()
        {
            string connectionstr = @"Data Source=AATHAVAN\SQLEXPRESS;Initial Catalog=MovieDB;Integrated Security=True";

            using (SqlConnection sqlConnection = new SqlConnection(connectionstr))
            {
                using (SqlCommand sqlCommand = new SqlCommand("MTB", sqlConnection))
                {
                    sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@Type", "SELECT");

                    sqlConnection.Open();
                    SqlDataReader reader = sqlCommand.ExecuteReader();

                    GridViewBookingHistory.DataSource = reader;
                    GridViewBookingHistory.DataBind();
                }
            }
        }
    }
}
