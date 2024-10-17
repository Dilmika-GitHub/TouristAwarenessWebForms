using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TouristAwarenessWebForms
{
    public partial class BookGuide : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookingHistory(); // Load the booking history on page load
            }
        }

        // Event handler for booking a guide
        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int userId = (int)Session["UserID"];
                string location = ddlLocation.SelectedItem.Text;
                string gender = ddlGender.SelectedItem.Value;
                DateTime fromDate = DateTime.Parse(txtFromDate.Text);
                DateTime toDate = DateTime.Parse(txtToDate.Text);

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Bookings (UserID, Location, Gender, FromDate, ToDate, BookingDate) " +
                                   "VALUES (@UserID, @Location, @Gender, @FromDate, @ToDate, GETDATE())";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@FromDate", fromDate);
                    cmd.Parameters.AddWithValue("@ToDate", toDate);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Booking successful!";
                        LoadBookingHistory(); // Refresh booking history after booking
                    }
                    else
                    {
                        lblMessage.Text = "Booking failed. Please try again.";
                    }
                }
            }
            else
            {
                lblMessage.Text = "You must be logged in to book a guide.";
            }
        }

        // Method to load the user's booking history
        private void LoadBookingHistory()
        {
            if (Session["UserID"] != null)
            {
                int userId = (int)Session["UserID"];
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT BookingID, Location, Gender, FromDate, ToDate, BookingDate FROM Bookings WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    gvBookingHistory.DataSource = reader;
                    gvBookingHistory.DataBind();

                    con.Close();
                }
            }
        }

        // Event handler for deleting a booking
        protected void gvBookingHistory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the BookingID of the row to be deleted
            int bookingId = Convert.ToInt32(gvBookingHistory.DataKeys[e.RowIndex].Value);

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Delete the booking from the database
                string query = "DELETE FROM Bookings WHERE BookingID = @BookingID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BookingID", bookingId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            // Reload the booking history after deletion
            LoadBookingHistory();
        }
    }
}
