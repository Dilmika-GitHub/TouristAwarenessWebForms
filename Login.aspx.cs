using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TouristAwarenessWebForms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TouristDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID FROM Users WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();
                object result = cmd.ExecuteScalar();  // Fetch the UserID if login is successful
                con.Close();

                if (result != null)
                {
                    // User authenticated
                    Session["UserID"] = result;
                    Response.Redirect("Dashboard.aspx");  // Redirect to the dashboard page
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
    }

}