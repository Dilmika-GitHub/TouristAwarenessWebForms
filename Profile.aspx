<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TouristAwarenessWebForms.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <!-- Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Background image for full page */
        body {
            background-image: url('Images/profile.jpg'); /* Replace with your background image */
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
            height: 100vh;
        }

        /* Profile card styling */
        .profile-card {
            width: 100%;
            max-width: 600px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Card shadow */
        }

        .profile-header {
            text-align: center;
            font-size: 2rem;
            color: #007bff;
            margin-bottom: 20px;
        }

        .profile-details {
            font-size: 1.2rem;
        }

        .profile-details dt {
            font-weight: bold;
        }

        .back-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .edit-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Centering the card -->
        <div class="centered-card">
            <div class="profile-card">
                <h2 class="profile-header">Your Profile</h2>

                <dl class="row profile-details">
                    <dt class="col-sm-4">Name:</dt>
                    <dd class="col-sm-8">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </dd>

                    <dt class="col-sm-4">Date of Birth:</dt>
                    <dd class="col-sm-8">
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </dd>

                    <dt class="col-sm-4">Country:</dt>
                    <dd class="col-sm-8">
                        <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </dd>

                    <dt class="col-sm-4">Mobile Number:</dt>
                    <dd class="col-sm-8">
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </dd>

                    <dt class="col-sm-4">Email:</dt>
                    <dd class="col-sm-8">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </dd>

                    <dt class="col-sm-4">Passport Number:</dt>
                    <dd class="col-sm-8">
                        <asp:TextBox ID="txtPassportNo" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </dd>

                    <dt class="col-sm-4">Joining Date:</dt>
                    <dd class="col-sm-8">
                        <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </dd>
                </dl>

                <!-- Buttons to edit and delete account -->
                <div class="edit-buttons">
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-info" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" Enabled="false" />
                    
                    <!-- Delete button with JavaScript confirmation -->
                    <asp:Button ID="btnDelete" runat="server" Text="Delete Account" CssClass="btn btn-danger" 
                        OnClientClick="return confirm('Are you sure you want to delete your account? This action cannot be undone.');" 
                        OnClick="btnDelete_Click" />
                </div>

                <!-- Back/Home button -->
                <div class="back-button">
                    <asp:Button ID="btnHome" runat="server" Text="Home" PostBackUrl="~/Dashboard.aspx" CssClass="btn btn-primary" />
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
