<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookGuide.aspx.cs" Inherits="TouristAwarenessWebForms.BookGuide" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book a Guide</title>
    <!-- Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Datepicker CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <style>
        /* Background image for the entire page */
        body {
            background-image: url('Images/book_a_guide.jpg'); /* Replace with your background image path */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            margin: 0;
            padding: 0;
        }

        .book-guide-form {
            background-color: rgba(255, 255, 255, 0.85); /* Semi-transparent background for form */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full page height */
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 1.5rem;
            color: #007bff; /* Primary Bootstrap color */
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-book {
            width: 100%;
        }

        .success-message {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2rem;
            color: green;
        }

        /* History Table */
        .history-table {
            margin-top: 30px;
            max-width: 100%;
            overflow-x: auto; /* Horizontal scrolling if needed */
        }

        .history-table .table {
            width: 100%; /* Responsive table */
        }

        /* Home Button */
        .home-button {
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-6">
                <div class="book-guide-form">
                    <h2 class="form-header">Book a Guide</h2>

                    <!-- Select Location -->
                    <div class="form-group">
                        <asp:Label ID="lblLocation" runat="server" Text="Select Location" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Nuwara Eliya" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Kandy" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Colombo" Value="3"></asp:ListItem>
                            <asp:ListItem Text="East Coast" Value="4"></asp:ListItem>
                            <asp:ListItem Text="South Coast" Value="5"></asp:ListItem>
                            <asp:ListItem Text="North Coast" Value="6"></asp:ListItem>
                            <asp:ListItem Text="Matale" Value="7"></asp:ListItem>
                            <asp:ListItem Text="Anuradhapura" Value="8"></asp:ListItem>
                            <asp:ListItem Text="Badulla" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Select Guide Gender -->
                    <div class="form-group">
                        <asp:Label ID="lblGender" runat="server" Text="Select Guide Gender" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- From Date -->
                    <div class="form-group">
                        <asp:Label ID="lblFromDate" runat="server" Text="From Date" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <!-- To Date -->
                    <div class="form-group">
                        <asp:Label ID="lblToDate" runat="server" Text="To Date" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <!-- Book Guide Button -->
                    <div class="form-group">
                        <asp:Button ID="btnBook" runat="server" Text="Book Guide" CssClass="btn btn-primary btn-book" OnClick="btnBook_Click" />
                    </div>

                    <!-- Success message -->
                    <asp:Label ID="lblMessage" runat="server" CssClass="success-message"></asp:Label>

                    <!-- Booking History Table -->
                    <div class="history-table">
                        <div class="table-responsive">
                            <asp:GridView ID="gvBookingHistory" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID"
    CssClass="table table-bordered table-striped" OnRowDeleting="gvBookingHistory_RowDeleting">
    <Columns>
        <asp:BoundField DataField="Location" HeaderText="Location" />
        <asp:BoundField DataField="Gender" HeaderText="Guide Gender" />
        <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:MM/dd/yyyy}" />
        <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:MM/dd/yyyy}" />
        <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:MM/dd/yyyy}" />
        <asp:CommandField ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

                        </div>
                    </div>

                    <!-- Home Button -->
                    <div class="form-group">
                        <asp:Button ID="btnHome" runat="server" Text="Home" PostBackUrl="~/Dashboard.aspx" CssClass="btn btn-secondary home-button" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Bootstrap Datepicker JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        // Initialize the date pickers
        $('#<%= txtFromDate.ClientID %>').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true
        });

        $('#<%= txtToDate.ClientID %>').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true
        });
    </script>
</body>
</html>
