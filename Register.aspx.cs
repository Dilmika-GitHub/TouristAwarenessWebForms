using System;
using System.Data.SqlClient;

namespace TouristAwarenessWebForms
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            int age = int.Parse(txtAge.Text);
            DateTime dob = DateTime.Parse(txtDOB.Text);
            string gender = rdoMale.Checked ? "Male" : "Female";
            string country = txtCountry.Text;
            string mobile = txtMobile.Text;
            string email = txtEmail.Text;
            string passportNo = txtPassportNo.Text;
            string password = txtPassword.Text;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Name, Age, DOB, Gender, Country, Mobile, Email, PassportNo, Password, RegistrationDate) " +
                               "VALUES (@Name, @Age, @DOB, @Gender, @Country, @Mobile, @Email, @PassportNo, @Password, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@DOB", dob);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Country", country);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PassportNo", passportNo);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        // Inject JavaScript to show a success alert and redirect to login page
                        string script = "alert('Registration successful! Redirecting to login page.'); window.location='Login.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                    }
                    else
                    {
                        // Show error message using alert
                        string script = "alert('Registration failed. Please try again.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                    }
                }
                catch (Exception ex)
                {
                    // Handle potential database errors
                    string script = $"alert('Error: {ex.Message}');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                }
            }
        }
    }
}
