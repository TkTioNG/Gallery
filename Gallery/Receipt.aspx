<%@ Page Title="Receipt" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="Gallery.Receipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Body Content Start -->
    <div id="body" style="text-align: center;">
        <div>
            <h1>
                <br />
                Receipt</h1>
        </div>

        <div runat="server" id="receiptBody" style="position: absolute; min-width: 450px; left: 40%; right: 40%; margin: auto;">
        </div>
    </div>
</asp:Content>
