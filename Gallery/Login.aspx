<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gallery.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/LoginRegister.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%; height: 100%; position: absolute; z-index: 1; top: 0; left: 0; background: url(Images/login_background.jpg) center no-repeat; background-size: cover;">
            <div style="text-align: center; top: 0; bottom: 0; left: 0; right: 0; margin: auto; position: absolute; width: 570px; height: 380px;">
                <div style="border: 3px solid black; padding: 10px; background-color: white; opacity: 0.8;">

                    <h2>Sign In</h2>
                    <table style="margin-left: 100px;">
                        <tr>
                            <td>
                                <asp:Label ID="lblUser" runat="server" Text="Label">Username : </asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtUser" runat="server" Width="257px" Height="28px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name is required" ForeColor="Red" ControlToValidate="txtUser"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPass" runat="server" Text="Label">Password : </asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtPass" runat="server" Height="28px" Width="257px" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtPass"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    <asp:Button CssClass="LogRegBtn" ID="butSignIn" runat="server" Text="Sign In" Height="33px" Width="340px" OnClick="butSignIn_Click" />
                    <br />
                    <br />
                    <hr />
                    <br />
                    <asp:CheckBox ID="cbRmb" runat="server" Text="Remember Me" Style="margin-left: -235px;" />
                    <br />
                    <asp:Button CssClass="LogRegBtn" ID="butForgotPass" runat="server" Text="Forgot Password" name="button" CausesValidation="false" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             
                    <asp:Button CssClass="LogRegBtn" ID="butSignUp" runat="server" Text="Sign Up" PostBackUrl="~/Register.aspx" CausesValidation="false" />
                    <br />
                    &nbsp;
                </div>
            </div>
        </div>
    </form>
</body>
</html>
