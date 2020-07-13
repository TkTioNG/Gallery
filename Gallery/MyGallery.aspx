<%@ Page Title="My Gallery" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="MyGallery.aspx.cs" Inherits="Gallery.MyGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Body Content Start -->
    <div id="body">
        <!-- Site Map Path Start -->
        <div style="margin: 0 0 0 30px; padding-top: 15px;">
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" Font-Size="0.8em" PathSeparator=" &gt;">
                <currentnodestyle forecolor="#333333" />
                <nodestyle font-bold="True" forecolor="#7C6F57" />
                <pathseparatorstyle font-bold="True" forecolor="#5D7B9D" />
                <rootnodestyle font-bold="True" forecolor="#5D7B9D" />
            </asp:SiteMapPath>
        </div>

        <!-- Main Content Start -->
        <div>
            <div style="width: 100%; position: relative; text-align: center; margin-top: 15px; margin-bottom: 25px; color: darkslategrey;">
                A total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                gallery(s) is/are on display.
            </div>

            <asp:Button ID="btnInsert1" runat="server" Text="Add Gallery" OnClick="AddGallery" CssClass="insertBtn btnInsert1" />

            <!-- Sticky Nav Bar Script Start -->
            <script>
                // When the user scrolls the page, execute myFunction
                window.onscroll = function () { stickFunction() };

                function stickFunction() {
                    // Get the navbar
                    var navbar = document.getElementById("stickyNavBar");
                    var btnInsert = document.getElementById("btnInsert1");

                    if (window.pageYOffset > 228) {
                        navbar.classList.add("stickyNav")
                        btnInsert.classList.add("fixedInsertBtn");
                    } else {
                        navbar.classList.remove("stickyNav");
                        btnInsert.classList.remove("fixedInsertBtn");
                    }
                }
            </script>
            <!-- Sticky Nav Bar Script End -->

            <div style="margin-left: 35px;">
                <asp:Repeater ID="Repeater1" runat="server">
                    <itemtemplate>
                            <div class="galleryView" style="background-image: url(<%# Eval("Image") %>);">
                                <a href='<%# "MyGalleryShowDown.aspx?GalleryName=" + Eval("GalleryName") %>' title='<%# Eval("GalleryName") %>' runat="server">
                                    <div class="titleOnImg">
                                        <div style="position: absolute; bottom: 0; text-align: center; width: 100%; margin-bottom: 10px; font-size: 20px; padding: 5px;">
                                            <span><%# Eval("GalleryName") %></span>
                                            <br />
                                            <span style="font-size: 15px;">By <%# Eval("UserName") %></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </itemtemplate>
                </asp:Repeater>
            </div>
            <div style="width: 100%; text-align: center; margin-top: 40px; clear: both;">
                <asp:Button ID="btnInsert2" runat="server" Text="Add Gallery" OnClick="AddGallery" class="insertBtn" />
                <br />
                <br />
                <br />
            </div>

        </div>

        <!-- Main Content End -->
    </div>
    <!-- Body Content End -->
</asp:Content>
