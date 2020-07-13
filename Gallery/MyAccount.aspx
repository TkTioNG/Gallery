<%@ Page Title="My Account" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="Gallery.MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Body Content Start -->
    <div id="body">
        <!-- Site Map Path Start -->
        <div style="margin: 0 0 0 30px; padding-top: 15px;">
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" Font-Size="0.8em" PathSeparator=" &gt;">
                <CurrentNodeStyle ForeColor="#333333" />
                <NodeStyle Font-Bold="True" ForeColor="#7C6F57" />
                <PathSeparatorStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <RootNodeStyle Font-Bold="True" ForeColor="#5D7B9D" />
            </asp:SiteMapPath>
        </div>
        <!-- Site Map Path End -->
        <br />

        <!-- Main Content Start -->
        <div>
            <div id="mainContent" runat="server" style="text-align: center; position: relative">
                <Log:Current runat="server" />
                <br />

                <div style="margin: auto; width: 800px; height: 580px; border: 3px solid black; padding: 10px;">
                    <div style="text-align: center;">
                        <strong><u style="font-size: 30px;">User Profile</u></strong>
                        <div style="width: 500px; margin: 0 auto; text-align: left; padding-left: 80px;">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <h3>User Details</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUser" runat="server" Text="Label">Username &emsp;:&emsp; </asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtUser" runat="server" Width="220px" Height="20px" Enabled="false"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name is required" ForeColor="Red" ControlToValidate="txtUser"></asp:RequiredFieldValidator></td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblGender" runat="server" Text="Label">Gender &emsp;&emsp;:&emsp; </asp:Label></td>
                                    <td>
                                        <asp:RadioButtonList ID="genderRbl" runat="server" RepeatDirection="Horizontal" Enabled="false" Height="28px" Width="218px">
                                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                                            <asp:ListItem Value="F">Female</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                        <asp:Label ID="lblEmail" runat="server" Text="Label">Email &emsp;&emsp;&ensp;:&emsp; </asp:Label></td>
                                    <td>
                                        <br />
                                        <asp:TextBox ID="txtEmail" runat="server" Width="220px" Height="20px" Enabled="false"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <h3>User Address</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblStreet1" runat="server" Text="Label">Street 1 &emsp;&emsp;:&emsp; </asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtAddress" runat="server" Width="220px" Height="20px" Enabled="false"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="Address Street 1 is required" ForeColor="Red" ControlToValidate="txtAddress"></asp:RequiredFieldValidator></td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                        <asp:Label ID="lblStreet2" runat="server" Text="Label">Street 2 &emsp;&emsp;:&emsp; </asp:Label></td>
                                    <td>
                                        <br />
                                        <asp:TextBox ID="txtAddress2" runat="server" Width="220px" Height="20px" Enabled="false"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Address Street 2 is required" ForeColor="Red" ControlToValidate="txtAddress2"></asp:RequiredFieldValidator></td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                        <asp:Label ID="lblPostCode" runat="server" Text="Label">Post Code &emsp;:&emsp; </asp:Label></td>
                                    <td>
                                        <br />
                                        <asp:TextBox ID="txtPostCode" runat="server" Width="220px" Height="20px" Enabled="false"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="Post Code is required" ForeColor="Red" ControlToValidate="txtPostCode"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="[0-9]{5}$" ControlToValidate="txtPostCode" ErrorMessage="Postcode must be 5-digit number" ForeColor="Red"></asp:RegularExpressionValidator></td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" Text="Label">State &emsp;&emsp;&emsp;:&emsp; </asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtState" runat="server" Width="220px" Height="20px" Enabled="false"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="State is required" ForeColor="Red" ControlToValidate="txtState"></asp:RequiredFieldValidator></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                    <fieldset style="border: none">
                        <br />
                        <asp:Button ID="butSave" runat="server" Text="Save Changes " name="button" OnClick="butSave_Click" Visible="false" />
                        <asp:Button ID="butEdit" runat="server" Text="Edit Profile " name="button" OnClick="butEdit_Click" CausesValidation="false" />
                        <asp:Button ID="butCancel" runat="server" Text="Cancel" OnClick="butCancel_Click" CausesValidation="false" Visible="false" />
                        <br />
                        &emsp;
                    </fieldset>
                </div>
            </div>

            <Err:Login ID="plsLogin" runat="server" Visible="false" />
        </div>
        <!-- Slideshow Script End -->
        <!-- Main Content End -->
    </div>
    <!-- Body Content End -->
</asp:Content>
