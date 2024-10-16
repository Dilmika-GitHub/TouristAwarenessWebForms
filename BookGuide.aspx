<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookGuide.aspx.cs" Inherits="TouristAwarenessWebForms.BookGuide" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book a Guide</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Book a Guide</h2>
        <div>
            <asp:Label ID="lblLocation" runat="server" Text="Select Location"></asp:Label><br />
            <asp:DropDownList ID="ddlLocation" runat="server">
                <asp:ListItem Text="Sigiriya" Value="1"></asp:ListItem>
                <asp:ListItem Text="Kandy" Value="2"></asp:ListItem>
                <asp:ListItem Text="Galle" Value="3"></asp:ListItem>
                <asp:ListItem Text="Nuwara Eliya" Value="4"></asp:ListItem>
            </asp:DropDownList><br />
            <asp:Label ID="lblGender" runat="server" Text="Select Guide Gender"></asp:Label><br />
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                <asp:ListItem Text="Female" Value="F"></asp:ListItem>
            </asp:DropDownList><br />
            <asp:Button ID="btnBook" runat="server" Text="Book Guide" OnClick="btnBook_Click" /><br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
