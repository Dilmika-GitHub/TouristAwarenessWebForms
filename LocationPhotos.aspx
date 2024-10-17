<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocationPhotos.aspx.cs" Inherits="TouristAwarenessWebForms.LocationPhotos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Location Photos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .gallery {
            margin-top: 30px;
        }
        .gallery img {
            width: 100%;
            height: auto;
            margin-bottom: 15px;
        }
        .gallery-item {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center" id="locationTitle" runat="server">Places to Visit</h2>
            <div class="row gallery" id="galleryContainer" runat="server">
                <!-- Photo gallery will be populated here -->
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
