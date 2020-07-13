<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CurrentLogin.ascx.cs" Inherits="Gallery.UserControl.CurrentLogin" %>

<div style="width: 100%; padding: 0 20px; text-align: right;">
    <table style="width: calc(100% - 21px); margin-right: 20px; text-align: right;">
        <tr><td><span id="UserName" runat="server">Unregister Customer</span></td></tr>
        <tr><td><span id="loginTime" runat="server"></span></td></tr>
        <tr><td><span id="logout" runat="server"><u><a href="../Login.aspx" style="color: rgb(72,54,116);">LogOut</a></u></span></td></tr>
    </table>
</div>