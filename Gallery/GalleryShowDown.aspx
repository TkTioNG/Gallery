<%@ Page Title="Gallery Details" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="GalleryShowDown.aspx.cs" Inherits="Gallery.GalleryShowDown" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Body Content Start -->
    <div id="body" style="min-width: 800px;">
        <!-- Site Map Path Start -->
        <div style="margin: 0 0 0 30px; padding-top: 15px;">
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" Font-Size="0.8em" PathSeparator=" &gt;">
                <CurrentNodeStyle ForeColor="#333333" />
                <NodeStyle Font-Bold="True" ForeColor="#7C6F57" />
                <PathSeparatorStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <RootNodeStyle Font-Bold="True" ForeColor="#5D7B9D" />
            </asp:SiteMapPath>
        </div>

        <!-- Main Content Start -->
        <div style="text-align: center; line-height: 30px; padding-top: 30px;">
            <div>
                <asp:Label ID="lblGalleryName" runat="server" Style="font-size: 32px; color: #404090; font-family: Elephant;" Text="Label"></asp:Label>
            </div>
            <br />
            <div style="left: 0; right: 0; margin: 0 auto;">
                <div>
                    <u style="font-family: Cambria; font-size: 24px;">Cosplayer</u>
                    <br />
                    <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                </div>
                <div id="productDiv" runat="server">
                    <br />
                    <u style="font-family: Cambria; font-size: 24px;">Product</u>
                    <br />
                    <a runat="server" style="color: #404090;" id="productLink" href="#">
                        <asp:Label ID="lblProductName" runat="server" Text="Label"></asp:Label></a>
                </div>
            </div>
            <br />
            <div style="clear: both;">
                <u style="font-family: Cambria; font-size: 24px;">Description</u><br />
                <asp:Label ID="lblDescription" Style="font-size: 20px; font-style: italic; color: darkslategrey;" runat="server" Text="Label"></asp:Label>
            </div>
        </div>

        <div>
            <asp:Label ID="lblError" Visible="false" runat="server" Text="Label"></asp:Label>
        </div>

        <style>
            .galleryPhoto {
                min-width: 800px;
                min-height: 500px;
                left: 0;
                right: 0;
                margin: 0 auto;
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
            }
        </style>

        <div style="text-align: center; width: 100%; margin-top: 40px; min-width: 800px;">
            <i style="font-family: Cambria; font-size: 28px;">*** &ensp; Gallery Photo &ensp; ***</i>

            <div>
                There has a total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="Label"></asp:Label>
                photos in this gallery.
            </div>

            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="galleryPhoto" style="margin-top: 10px; background-image: url(<%# Eval("Image") %>);">
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div id="productDiv2" runat="server" style="text-align: center;">
            <br />
            <hr />
            Go To Product : <a runat="server" style="color: #404090;" id="productLink2" href="#">
                <asp:Label ID="lblProductName2" runat="server" Text="Label"></asp:Label></a>
            <hr />
        </div>

        <div style="visibility: hidden;">
            <hr />
            <asp:FileUpload ID="FileUpload1" runat="server" Width="115px" Style="clear: left;" AllowMultiple="true" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Width="115px" />
            <asp:Label ID="Label1" runat="server" Text="Please upload an image." />
            <hr />
            <asp:Label ID="lblFileName" runat="server" Text="Label"></asp:Label>
        </div>
        <!-- Main Content End -->
    </div>
    <!-- Body Content End -->
</asp:Content>
