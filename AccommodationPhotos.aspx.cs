using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TouristAwarenessWebForms
{
    public partial class AccommodationPhotos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the location name from the query string
            string location = Request.QueryString["location"];

            if (!string.IsNullOrEmpty(location))
            {
                // Set the page title
                locationTitle.InnerText = $"Hotels of {location}";

                // Load photos based on the location
                LoadLocationPhotos(location);
            }
            else
            {
                locationTitle.InnerText = "Hotels not found.";
            }
        }

        private void LoadLocationPhotos(string location)
        {
            // Clear previous content
            galleryContainer.Controls.Clear();

            // Load different photos based on the location
            switch (location)
            {
                case "Nuwara Eliya":
                    AddPhoto("~/Images/Nuwaraeliya/heaven_sevean.jpg", "Heaven seven hotel");
                    AddPhoto("~/Images/Nuwaraeliya/golden_ridge.jpg", "Golden ridge hotel");
                    break;

                case "Kandy":
                    AddPhoto("~/Images/Kandy/earls.jpg", "Earl's regent hotel");
                    AddPhoto("~/Images/Kandy/grand_serandib.jpg", "Grand serendib hotel");
                    break;

                case "Colombo":
                    AddPhoto("~/Images/Colombo/cinnamon_grand.jpg", "Cinnamon grand");
                    AddPhoto("~/Images/Colombo/shangrila.jpg", "Shangri-la");
                    break;

                case "Badulla":
                    AddPhoto("~/Images/Badulla/crown_regency.jpg", "Crown regency hotel");
                    AddPhoto("~/Images/Badulla/mount_view.jpg", "Mount View Guest Inn Ella");
                    break;

                case "Anuradhapura":
                    AddPhoto("~/Images/Anuradapura/eco_villa.jpg", "ISI ARANA ECO VILLA ");
                    break;

                case "South Coast":
                    AddPhoto("~/Images/South_Coast/calamander.jpg", "Calamander Unawatuna Beach Resort");
                    AddPhoto("~/Images/South_Coast/thaproban_pavilion.jpg", "Thaproban Pavilion Resort & Spa Unawatuna");
                    break;

                case "East Coast":
                    AddPhoto("~/Images/East_Coast/nilaveli_beach_hotel.jpg", "Nilaveli Beach Hotel");
                    AddPhoto("~/Images/East_Coast/amaya_beach.jpg", "Amaya Beach Pasikudah Kalkudah");
                    break;

                case "North Coast":
                    AddPhoto("~/Images/North_Coast/north_gate.jpg", "North Gate Hotel Jaffna");
                    break;

                case "Matale":
                    AddPhoto("~/Images/Matale/riverston_villa.jpg", "Riverston view villa Matale");
                    break;

                default:
                    locationTitle.InnerText = "No photos available for this location.";
                    break;
            }
        }

        private void AddPhoto(string imagePath, string caption)
        {
            LiteralControl photo = new LiteralControl($@"
                <div class='col-md-4 gallery-item'>
                    <div class='card'>
                        <img src='{ResolveUrl(imagePath)}' class='card-img-top' alt='{caption}' />
                        <div class='card-body'>
                            <h5 class='card-title'>{caption}</h5>
                        </div>
                    </div>
                </div>
            ");
            galleryContainer.Controls.Add(photo);
        }
    }
}
