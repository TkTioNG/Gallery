<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Gallery.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/LoginRegister.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%; height: 100%; position: fixed; z-index: 1; top: 0; left: 0; background: url(Images/2.jpg) center no-repeat; background-size: cover;">
            <div style="text-align: center; top: 50%; left: 50%; transform: translate(-50%,-50%); position: absolute; width: 100%;">
                <div style="margin: auto; width: 35%; height: auto; border: 3px solid black; padding: 10px; background-color: white; opacity: 0.8">
                    <h2>Register</h2>

                    <fieldset style="border: none">
                        <asp:Label ID="lblName" runat="server" Text="Label">Username : </asp:Label>
                        <asp:TextBox ID="txtUser" runat="server" Width="220px" Height="28px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="User Name is required" ForeColor="Red" ControlToValidate="txtUser">
                        </asp:RequiredFieldValidator>
                    </fieldset>

                    <fieldset style="border: none">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblEmail" runat="server" Text="Label">Email : </asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" Width="220px" Height="28px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtEmail">
                        </asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                    </fieldset>

                    <fieldset style="border: none">
                        <asp:Label ID="lblUserType" runat="server" Text="Label">User Type : </asp:Label>
                        <asp:DropDownList ID="ddlUserType" runat="server" Width="220px">
                            <asp:ListItem Selected="True" Value="customer">Customer</asp:ListItem>
                            <asp:ListItem Value="cosplayer">Cosplayer</asp:ListItem>
                        </asp:DropDownList>
                    </fieldset>

                    <fieldset style="text-align: center; border: none; float: left; width: 70%">
                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" Style="float: right; width: 46%">
                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblGender" runat="server" Text="Label" Style="float: right">Gender : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                    </fieldset>
                    <br />

                    <fieldset style="border: none">
                        <asp:Label ID="lblPass" runat="server" Text="Label">Password : </asp:Label>
                        <asp:TextBox placeholder="Password" ID="txtPass" runat="server" TextMode="Password" Height="28px" Width="220px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtPass">
                        </asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password Should be as 6-10 alphanumeric characters" ControlToValidate="txtPass" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]{6,10}$">
                        </asp:RegularExpressionValidator>
                    </fieldset>

                    <fieldset style="border: none; margin-left: -60px;">
                        <asp:Label ID="lblConPass" runat="server" Text="Label">Confirm Password : </asp:Label>
                        <asp:TextBox placeholder="Confirm Password" ID="txtConPass" runat="server" TextMode="Password" Height="28px" Width="220px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Confirm Password is required" ForeColor="Red" ControlToValidate="txtConPass">
                        </asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password does not match." ForeColor="Red" ControlToValidate="txtConPass" ControlToCompare="txtPass"></asp:CompareValidator>
                    </fieldset>

                    <fieldset style="border: none">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblStreet1" runat="server" Text="Label">Street 1 : </asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" Width="220px" Height="20px"></asp:TextBox>
                        <span class="errMessage" id="AddressTxtSpan"></span>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="Address Street 1 is required" ForeColor="Red" ControlToValidate="txtAddress">
                        </asp:RequiredFieldValidator><br />
                        &nbsp;&nbsp;&nbsp;

                    <asp:Label ID="lblStreet2" runat="server" Text="Label">Street 2 : </asp:Label>
                        <asp:TextBox ID="txtAddress2" runat="server" Width="220px" Height="20px"></asp:TextBox>
                        <span class="errMessage" id="AddressTxtSpan2"></span>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Address Street 2 is required" ForeColor="Red" ControlToValidate="txtAddress2">
                        </asp:RequiredFieldValidator><br />

                        <asp:Label ID="lblPostCode" runat="server" Text="Label">Post Code : </asp:Label>
                        <asp:TextBox ID="txtPostCode" runat="server" Width="220px" Height="20px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="Post Code is required" ForeColor="Red" ControlToValidate="txtPostCode">
                        </asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password Should be 5 Digits" ControlToValidate="txtPostCode" ForeColor="Red" ValidationExpression="^[0-9]{5}$">
                        </asp:RegularExpressionValidator>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:Label ID="lblState" runat="server" Text="Label">State : </asp:Label>
                        <asp:TextBox ID="txtState" runat="server" Width="220px" Height="20px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="State is required" ForeColor="Red" ControlToValidate="txtState">
                        </asp:RequiredFieldValidator>
                    </fieldset>

                    <fieldset style="border: none">
                        <asp:Button ID="butRegister" CssClass="LogRegBtn" runat="server" Text="Register " name="button" OnClick="butRegister_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="butCancel" CssClass="LogRegBtn" runat="server" Text="Cancel" OnClick="butCancel_Click" CausesValidation="false" />
                    </fieldset>

                    <div runat="server" style="display: none;">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT UserID FROM NewData"></asp:SqlDataSource>
                        <asp:DropDownList ID="ddlMaxProdID" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserID" DataValueField="UserID"></asp:DropDownList>
                        <asp:Label ID="lblMaxProdID" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>

</html>

