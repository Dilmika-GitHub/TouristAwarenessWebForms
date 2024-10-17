using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TouristAwarenessWebForms
{
    public partial class Accommodations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowPlaces_Click(object sender, EventArgs e)
        {
            LinkButton clickedButton = (LinkButton)sender;
            string location = clickedButton.Text;

            // Redirect to LocationPhotos.aspx with the location as a query string parameter
            Response.Redirect($"AccommodationPhotos.aspx?location={location}");
        }
    }
}