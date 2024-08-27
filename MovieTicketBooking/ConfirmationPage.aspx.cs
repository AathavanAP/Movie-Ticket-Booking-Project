using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace MovieTicketBooking
{
    public partial class ConfirmationPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optionally initialize the page with any necessary data.
            }
        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            if (!ValidateTimeSlots())
            {
                lblTimeSlotError.Text = "At least one time slot must be selected.";
                return; // Stop further processing
            }

            if (Page.IsValid) // Ensure all validators are satisfied
            {
                string selectedDate = bookingDate.Text;
                string selectedTime = GetSelectedTime();
                int selectedTicketCount = int.Parse(ticketCount.SelectedValue);
                string bookingStatus = "Confirmed";

                string connectionstr = @"Data Source=AATHAVAN\SQLEXPRESS;Initial Catalog=MovieDB;Integrated Security=True";

                try
                {
                    using (var sqlConnection = new SqlConnection(connectionstr))
                    {
                        using (var sqlCommand = new SqlCommand("MTB", sqlConnection))
                        {
                            sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;

                            // Retrieve session data from previous pages
                            string userName = Session["UserName"]?.ToString();
                            string movieLanguage = Session["SelectedLanguage"]?.ToString();
                            string movieName = Session["SelectedMovie"]?.ToString();
                            string location = Session["SelectedLocation"]?.ToString();
                            string phoneNumber = Session["PhoneNumber"]?.ToString();

                            // Set parameters for the stored procedure
                            sqlCommand.Parameters.AddWithValue("@Type", "FinalBooking");
                            sqlCommand.Parameters.AddWithValue("@Name", userName);
                            sqlCommand.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                            sqlCommand.Parameters.AddWithValue("@Language", movieLanguage);
                            sqlCommand.Parameters.AddWithValue("@MovieName", movieName);
                            sqlCommand.Parameters.AddWithValue("@Location", location);
                            sqlCommand.Parameters.AddWithValue("@Date", selectedDate);
                            sqlCommand.Parameters.AddWithValue("@Time", selectedTime);
                            sqlCommand.Parameters.AddWithValue("@TicketCount", selectedTicketCount);
                            sqlCommand.Parameters.AddWithValue("@BookingStatus", bookingStatus);

                            sqlConnection.Open();
                            sqlCommand.ExecuteNonQuery();

                            // Set the confirmation message
                            lblConfirmationMessage.Text = "Your booking is confirmed";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the error and show a user-friendly message
                    lblConfirmationMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            // Optionally handle the cancellation logic here
            lblConfirmationMessage.Text = "Your booking is canceled";
        }

        private string GetSelectedTime()
        {
            if (time10am.Checked)
                return "10:00 AM";
            if (time1pm.Checked)
                return "01:00 PM";
            if (time6pm.Checked)
                return "06:00 PM";
            if (time9pm.Checked)
                return "09:00 PM";
            return null;
        }

        private bool ValidateTimeSlots()
        {
            return time10am.Checked || time1pm.Checked || time6pm.Checked || time9pm.Checked;
        }

        protected void TimeSlot_CheckedChanged(object sender, EventArgs e)
        {
            if (ValidateTimeSlots())
            {
                lblTimeSlotError.Text = string.Empty;
            }
        }
    }
}
