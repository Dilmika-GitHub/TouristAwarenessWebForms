<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TouristAwarenessWebForms.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Your Profile</h2>
        <p>Username: <%= Session["User"] %></p>
    </form>
</body>
</html>
