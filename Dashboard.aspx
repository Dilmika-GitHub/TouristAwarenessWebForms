<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TouristAwarenessWebForms.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <!-- Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa; /* Light background */
        }
        .dashboard-container {
            margin-top: 50px;
        }
        .dashboard-card {
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Card shadow */
        }
        .dashboard-header {
            margin-bottom: 30px;
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            color: #007bff; /* Primary color */
        }
        .dashboard-button {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container dashboard-container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="dashboard-card">
                        <h2 class="dashboard-header">Dashboard</h2>
                        <div class="d-grid gap-2">
                            <asp:Button ID="btnLocations" runat="server" Text="Locations" PostBackUrl="~/Locations.aspx" CssClass="btn btn-primary btn-lg dashboard-button" />
                            <asp:Button ID="btnBookGuide" runat="server" Text="Book a Guide" PostBackUrl="~/BookGuide.aspx" CssClass="btn btn-success btn-lg dashboard-button" />
                            <asp:Button ID="btnProfile" runat="server" Text="View Profile" PostBackUrl="~/Profile.aspx" CssClass="btn btn-info btn-lg dashboard-button" />
                        </div>
                    </div>
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
