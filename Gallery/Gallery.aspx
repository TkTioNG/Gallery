<%@ Page Title="Gallery" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Gallery.Gallery" %>

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

        <!-- Main Content Start -->
        <div>
            <Ads:Cosplayer runat="server" ID="Ads" />

            <div class="displayCountDiv">
                A total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                gallery(s) is/are on display.
            </div>

            <div style="margin-left: 35px;">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="galleryView" style="background-image: url(<%# Eval("Image") %>);">
                            <a href='<%# "GalleryShowDown.aspx?GalleryName=" + Eval("GalleryName") %>' title='<%# Eval("GalleryName") %>' runat="server">
                                <div class="titleOnImg">
                                    <div style="position: absolute; bottom: 0; text-align: center; width: 100%; margin-bottom: 10px; font-size: 20px; padding: 5px;">
                                        <span><%# Eval("GalleryName") %></span>
                                        <br />
                                        <span style="font-size: 15px;">By <%# Eval("UserName") %></span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div style="clear: both; width: 100%; height: 50px;"></div>
        </div>

        <!-- Main Content End -->
    </div>
    <!-- Body Content End -->
</asp:Content>
