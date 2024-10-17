<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Locations.aspx.cs" Inherits="TouristAwarenessWebForms.Locations" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tourist Locations</title>
    <!-- Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Background image for the entire page */
        body {
            background-image: url('Images/locations.jpg'); /* Replace with your background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            margin: 0;
            padding: 0;
        }

        /* Centering and styling for the page title */
        .location-header {
            text-align: center;
            margin-bottom: 30px;
            color: white;
        }

        /* Tile style for each location */
        .location-tile {
            margin: 15px;
            text-align: center;
            transition: transform 0.3s;
            cursor: pointer;
        }

        .location-tile:hover {
            transform: scale(1.05); /* Slight zoom on hover */
        }

        /* Tile card styling */
        .card {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Card shadow */
            text-align: center;
            padding: 20px;
            height: 150px; /* Consistent tile height */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card a {
            text-decoration: none;
            color: #007bff;
            font-size: 1.5rem;
            font-weight: bold;
        }

        /* Styling for gallery */
        .gallery img {
            width: 100%;
            height: auto;
            margin-bottom: 15px;
        }

        .gallery {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="location-header">Tourist Locations in Sri Lanka</h2>

            <!-- Row for tiles -->
            <div class="row justify-content-center">
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnNuwaraEliya" runat="server" Text="Nuwara Eliya" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnKandy" runat="server" Text="Kandy" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnColombo" runat="server" Text="Colombo" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnEastCoast" runat="server" Text="East Coast" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnSouthCoast" runat="server" Text="South Coast" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnNorthCoast" runat="server" Text="North Coast" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnMatale" runat="server" Text="Matale" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnAnuradhapura" runat="server" Text="Anuradhapura" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 location-tile">
                    <div class="card">
                        <asp:LinkButton ID="btnBadulla" runat="server" Text="Badulla" CssClass="stretched-link" OnClick="ShowPlaces_Click" />
                    </div>
                </div>
            </div>

            <!-- Div to show the list of places when a location is clicked -->
            <div id="places" runat="server">
                <h3 class="places-header" id="placesHeader" runat="server"></h3>
                <div class="row gallery" id="placesGallery" runat="server">
                    <!-- Places will be displayed here -->
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
