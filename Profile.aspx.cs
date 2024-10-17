using System;
using System.Data.SqlClient;

namespace TouristAwarenessWebForms
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            if (Session["UserID"] != null)
            {
                int userId = (int)Session["UserID"];
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;
                string query = "SELECT Name, DOB, Country, Mobile, Email, PassportNo, RegistrationDate FROM Users WHERE UserID = @UserID";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtName.Text = reader["Name"].ToString();
                        txtDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("MM/dd/yyyy");
                        txtCountry.Text = reader["Country"].ToString();
                        txtMobile.Text = reader["Mobile"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        txtPassportNo.Text = reader["PassportNo"].ToString();
                        txtJoiningDate.Text = Convert.ToDateTime(reader["RegistrationDate"]).ToString("MM/dd/yyyy");
                    }

                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        // Edit Button Click
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Enable the textboxes for editing
            txtName.ReadOnly = false;
            txtDOB.ReadOnly = false;
            txtCountry.ReadOnly = false;
            txtMobile.ReadOnly = false;
            txtEmail.ReadOnly = false;
            txtPassportNo.ReadOnly = false;

            // Enable the Save button
            btnSave.Enabled = true;
        }

        // Save Button Click - Save updated user details
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int userId = (int)Session["UserID"];
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Users SET Name = @Name, DOB = @DOB, Country = @Country, Mobile = @Mobile, Email = @Email, PassportNo = @PassportNo WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@DOB", DateTime.Parse(txtDOB.Text));
                    cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@PassportNo", txtPassportNo.Text);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Disable the textboxes and Save button after saving
                    txtName.ReadOnly = true;
                    txtDOB.ReadOnly = true;
                    txtCountry.ReadOnly = true;
                    txtMobile.ReadOnly = true;
                    txtEmail.ReadOnly = true;
                    txtPassportNo.ReadOnly = true;

                    btnSave.Enabled = false;

                    // Show success message (could use alert)
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Profile updated successfully!');", true);
                }
            }
        }

        // Delete Button Click - Delete user account
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int userId = (int)Session["UserID"];
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Users WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Clear session and redirect to login page
                    Session.Clear();
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}
