<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TouristAwarenessWebForms.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <!-- Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Background image for full page */
        body {
            background-image: url('Images/dashboard.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            margin: 0;
            padding: 0;
        }

        /* Centering the card */
        .centered-card {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }

        /* Frame containing all dashboard content */
        .dashboard-frame {
            width: 100%;
            max-width: 600px; /* Max width of the card */
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Card shadow */
            position: relative;
        }

        .dashboard-header {
            margin-bottom: 30px;
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            color: #007bff;
        }

        .dashboard-button {
            margin-top: 15px;
            font-size: 1.25rem;
            width: 100%; /* Ensure buttons take full width */
        }

        /* Profile button in the top-right corner of the card */
        .profile-button {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        /* Center the buttons inside the card */
        .button-container {
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Centered card containing all elements -->
        <div class="centered-card">
            <div class="dashboard-frame">
                <!-- Profile button inside the card in the top-right corner -->
                <asp:Button ID="btnProfile" runat="server" Text="View Profile" PostBackUrl="~/Profile.aspx" CssClass="btn btn-outline-info profile-button" />

                <h2 class="dashboard-header">Dashboard</h2>

                <!-- Centering buttons inside the card -->
                <div class="button-container">
                    <asp:Button ID="btnLocations" runat="server" Text="Locations" PostBackUrl="~/Locations.aspx" CssClass="btn btn-primary btn-lg dashboard-button" />
                    <asp:Button ID="btnAccommodations" runat="server" Text="Accommodations" PostBackUrl="~/Accommodations.aspx" CssClass="btn btn-warning btn-lg dashboard-button" />
                    <asp:Button ID="btnBookGuide" runat="server" Text="Book a Guide" PostBackUrl="~/BookGuide.aspx" CssClass="btn btn-success btn-lg dashboard-button" />
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
