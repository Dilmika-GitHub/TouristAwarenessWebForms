using System;
using System.Web.UI;

namespace TouristAwarenessWebForms
{
    public partial class LocationPhotos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the location name from the query string
            string location = Request.QueryString["location"];

            if (!string.IsNullOrEmpty(location))
            {
                // Set the page title
                locationTitle.InnerText = $"Places to Visit in {location}";

                // Load photos based on the location
                LoadLocationPhotos(location);
            }
            else
            {
                locationTitle.InnerText = "Location not found.";
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
                    AddPhoto("~/Images/Nuwaraeliya/devon_falls.jpg", "Devon Falls");
                    AddPhoto("~/Images/Nuwaraeliya/st_clairs_falls.jpg", "St.Clairs Falls");
                    AddPhoto("~/Images/Nuwaraeliya/worlds_end.jpg", "Great World's End Drop");
                    AddPhoto("~/Images/Nuwaraeliya/piduruthalagala.jpg", "Piduruthalagala");
                    AddPhoto("~/Images/Nuwaraeliya/sita_amman_kovil.jpg", "Sita amman kovil, Sita eliya");
                    AddPhoto("~/Images/Nuwaraeliya/hakgala.jpg", "Hakgala botanical garden");
                    AddPhoto("~/Images/Nuwaraeliya/gregory_lake.jpg", "Gregory lake");
                    AddPhoto("~/Images/Nuwaraeliya/horton_plains.jpg", "Horton plains national park");
                    break;

                case "Kandy":
                    AddPhoto("~/Images/Kandy/bahirawakanda.jpg", "Bahirawakanda vihara buddha statue");
                    AddPhoto("~/Images/Kandy/kandy_lake_park.jpg", "Lake park");
                    AddPhoto("~/Images/Kandy/kandy_museum.jpg", "National museum");
                    AddPhoto("~/Images/Kandy/kandy_war_cemetery.jpg", "Commonwealth war cemetery");
                    AddPhoto("~/Images/Kandy/peradeniya_garden.jpg", "Peradeniya Royal Botanical gardens");
                    AddPhoto("~/Images/Kandy/temple_of_tooth.jpg", "The Temple of the sacred Tooth Relic / Sri Dalada Maligawa");
                    AddPhoto("~/Images/Kandy/udawatta.jpg", "Udawatta kele sanctuary");
                    AddPhoto("~/Images/Kandy/view_point.jpg", "View point");
                    break;

                case "Colombo":
                    AddPhoto("~/Images/Colombo/port_museum.jpg", "Colombo port maritime museum");
                    AddPhoto("~/Images/Colombo/planetarium.jpg", "Sri lanka planetarium");
                    AddPhoto("~/Images/Colombo/portcity.jpg", "Port city");
                    AddPhoto("~/Images/Colombo/lotus_tower.jpg", "Lotus tower");
                    AddPhoto("~/Images/Colombo/galleface.jpg", "Galle face");
                    AddPhoto("~/Images/Colombo/colombo_museum.jpg", "National Museum");
                    break;

                case "Badulla":
                    AddPhoto("~/Images/Badulla/adisham.jpg", "Adisham bungalow ella");
                    AddPhoto("~/Images/Badulla/bogoda_bridge.jpg", "Bogoda old wooden bridge");
                    AddPhoto("~/Images/Badulla/dunhinda.jpg", "Dunhida falls");
                    AddPhoto("~/Images/Badulla/ella.jpg", "Ella");
                    AddPhoto("~/Images/Badulla/little_adms_peak.jpg", "Little adam's peak view point ella");
                    AddPhoto("~/Images/Badulla/narangala.jpg", "Narangala");
                    AddPhoto("~/Images/Badulla/nine_arch.jpg", "Nine arches bridge");
                    break;

                case "Anuradhapura":
                    AddPhoto("~/Images/Anuradapura/atamsthana.jpg", "Atamasthama / eight sacred places in Anuradhapura");
                    AddPhoto("~/Images/Anuradapura/avukana_buddha.jpg", "Avukana Buddha statue");
                    AddPhoto("~/Images/Anuradapura/minneriya.jpg", "Minneriya National park");
                    AddPhoto("~/Images/Anuradapura/ran_masu_uyana.jpg", "Ran masu uyana");
                    AddPhoto("~/Images/Anuradapura/twin_ponds.jpg", "Twin ponds Anuradhapura");
                    break;

                case "South Coast":
                    AddPhoto("~/Images/South_Coast/hikkaduwa.jpg", "Hikkaduwa");
                    AddPhoto("~/Images/South_Coast/tangalle.jpg", "Tangalle");
                    AddPhoto("~/Images/South_Coast/kumana.jpg", "Kumana national park");
                    AddPhoto("~/Images/South_Coast/bentota.jpg", "Bentota beach");
                    AddPhoto("~/Images/South_Coast/tapbrobane.jpg", "Taprobane island");
                    AddPhoto("~/Images/South_Coast/mirissa.jpg", "Mirissa");
                    AddPhoto("~/Images/South_Coast/sea_turtle_hatchery.jpg", "Sea turtle hatchery");
                    AddPhoto("~/Images/South_Coast/galle_fort.jpg", "Galle dutch fort and lighthouse");
                    AddPhoto("~/Images/South_Coast/yala.jpg", "Yala national park");
                    AddPhoto("~/Images/South_Coast/diyakawa_center.jpg", "Diyakawa water sports centre");
                    break;

                case "East Coast":
                    AddPhoto("~/Images/East_Coast/nilaveli.jpg", "Nilaveli beach");
                    AddPhoto("~/Images/East_Coast/marble_beach.jpg", "Marble beach");
                    AddPhoto("~/Images/East_Coast/koneswaram.jpg", "Koneswaram Kovil");
                    AddPhoto("~/Images/East_Coast/pigeon_island.jpg", "Pigeon island national park");
                    AddPhoto("~/Images/East_Coast/galoya.jpg", "Gal oya national park");
                    AddPhoto("~/Images/East_Coast/pasikudah.jpg", "Pasikudah");
                    AddPhoto("~/Images/East_Coast/arugambay.jpg", "Arugam bay");
                    break;

                case "North Coast":
                    AddPhoto("~/Images/North_Coast/mannar.jpg", "Mannar");
                    AddPhoto("~/Images/North_Coast/jaffna_library.jpg", "Jaffna public library");
                    AddPhoto("~/Images/North_Coast/jaffna_fort.jpg", "Jaffna fort");
                    AddPhoto("~/Images/North_Coast/nagadipa.jpg", "Nagadipa temple");
                    AddPhoto("~/Images/North_Coast/neduntheevu.jpg", "Neduntheevu");
                    AddPhoto("~/Images/North_Coast/nallur.jpg", "Nallur kovil");
                    break;

                case "Matale":
                    AddPhoto("~/Images/Matale/sigiriya.jpg", "Sigiriya");
                    AddPhoto("~/Images/Matale/aluviharaya.jpg", " Aluviharaya rock cave temple Matale");
                    AddPhoto("~/Images/Matale/rangiri.jpg", "Dambulla royal cave temple ( Rangiri dambulu temple )");
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
