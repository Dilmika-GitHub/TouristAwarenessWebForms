<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TouristAwarenessWebForms.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <!-- Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Datepicker CSS link (optional for custom date picker) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />

    <script type="text/javascript">
        // JavaScript function to validate that all fields are filled and passwords match
        function validateForm() {
            var isValid = true;

            // Get all the input fields
            var name = document.getElementById('<%= txtName.ClientID %>').value.trim();
            var age = document.getElementById('<%= txtAge.ClientID %>').value.trim();
            var dob = document.getElementById('<%= txtDOB.ClientID %>').value.trim();
            var country = document.getElementById('<%= txtCountry.ClientID %>').value.trim();
            var mobile = document.getElementById('<%= txtMobile.ClientID %>').value.trim();
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var passportNo = document.getElementById('<%= txtPassportNo.ClientID %>').value.trim();
            var password = document.getElementById('<%= txtPassword.ClientID %>').value.trim();
            var confirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value.trim();

            // Validate Gender (make sure one is selected)
            var maleSelected = document.getElementById('<%= rdoMale.ClientID %>').checked;
            var femaleSelected = document.getElementById('<%= rdoFemale.ClientID %>').checked;

            // Check if any field is empty
            if (name === "" || age === "" || dob === "" || country === "" || mobile === "" || email === "" || passportNo === "" || password === "" || confirmPassword === "" || (!maleSelected && !femaleSelected)) {
                document.getElementById('validationError').innerHTML = "Please fill out all fields!";
                isValid = false;
            }

            // Check if passwords match
            if (password !== confirmPassword) {
                document.getElementById('passwordError').innerHTML = "Passwords do not match!";
                isValid = false;
            } else {
                document.getElementById('passwordError').innerHTML = ""; // Clear password error
            }

            return isValid; // Only submit if form is valid
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h2>Register</h2>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="lblName" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblAge" runat="server" Text="Age" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblDOB" runat="server" Text="Date of Birth" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>

                            <!-- Gender Radio Buttons -->
                            <div class="form-group">
                                <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="form-label"></asp:Label><br />
                                <div class="form-check form-check-inline">
                                    <asp:RadioButton ID="rdoMale" runat="server" GroupName="Gender" Text="Male" CssClass="form-check-input" />
                                    <asp:Label runat="server" AssociatedControlID="rdoMale" CssClass="form-check-label"></asp:Label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <asp:RadioButton ID="rdoFemale" runat="server" GroupName="Gender" Text="Female" CssClass="form-check-input" />
                                    <asp:Label runat="server" AssociatedControlID="rdoFemale" CssClass="form-check-label"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblMobile" runat="server" Text="Mobile Number" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPassportNo" runat="server" Text="Passport Number" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPassportNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <small id="passwordError" class="text-danger"></small>
                            </div>

                            <!-- Validation error display -->
                            <small id="validationError" class="text-danger"></small>

                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-block" OnClick="btnRegister_Click" />
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

    <!-- Optional Bootstrap Datepicker JS (if you want more customization for the date picker) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        // Initialize Bootstrap DatePicker (if using it instead of native HTML5 date picker)
        $('#<%= txtDOB.ClientID %>').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true
        });
    </script>
</body>
</html>
