<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyGalleryShowDown.aspx.cs" Inherits="Gallery.MyGalleryShowDown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <link rel="stylesheet" href="CSS/master.css" />
    <link rel="stylesheet" href="CSS/Homepage.css" />
    <link rel="stylesheet" href="CSS/Gallery.css" />
    <script type="text/javascript" src="JavaScript/navBarScroll.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Sticky Nav Bar Start -->
        <div class="title-up">
            <div style="text-align: center; padding-top: 50px;">
                <img src="Images/New_Logo.png" style="width: 800px;" />
            </div>
            <div id="stickyNavBar" class="movNavBar">
                <div class="navBar" style="padding-bottom: 0; bottom: 0;">
                    <div>
                        <a href="Homepage.aspx" class="shopName" title="This is the shop name" style="margin-right: -30px; margin-top: -5px;">
                            <img src="Images/New_Logo_2.png" style="width: 100px;" />
                        </a>
                        <nav class="navBarRow">
                            <ul>
                                <li class="navBarJump notFirst"><a href="Trending.aspx" title="Trending"><span>Trending</span></a>
                                </li>
                                <li class="navBarJump notFirst"><a href="Gallery.aspx" title="Gallery"><span>Gallery</span></a>
                                </li>
                                <li class="navBarJump notFirst"><a href="Cosplay.aspx" title="Cosplay"><span>Cosplay</span></a>
                                    <div class="subMenu" style="width: 210px;">
                                        <ul>
                                            <li><a href="Cosplay.aspx" title="All Cosplay"><span>All</span></a></li>
                                            <li><a href="Cosplay.aspx?filter=male" title="Male Costume"><span>Male Costume</span></a></li>
                                            <li><a href="Cosplay.aspx?filter=female" title="Female Costume"><span>Female Costume</span></a></li>
                                            <li><a href="Cosplay.aspx?filter=anime" title="Anime Style"><span>Anime Style</span></a></li>
                                            <li><a href="Cosplay.aspx?filter=europe" title="Europe Style"><span>Europe Style</span></a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="navBarJump notFirst"><a href="Miniature.aspx" title="Miniature"><span>Miniature</span></a>
                                    <div class="subMenu" style="width: 210px;">
                                        <ul>
                                            <li><a href="Miniature.aspx?filter=figure" title="All Figure"><span>All Figure</span></a></li>
                                            <li><a href="Miniature.aspx?filter=pvc" title="PVC Figure"><span>PVC Figure</span></a></li>
                                            <li><a href="Miniature.aspx?filter=nendoroid" title="Nendoroid Figure"><span>Nendoroid Figure</span></a></li>
                                            <li><a href="Miniature.aspx?filter=gundam" title="Gundam Figure"><span>Gundam Figure</span></a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </nav>

                        <div class="navBarRow" style="float: right; margin-right: 8%; padding-bottom: 20px;">
                            <ul>
                                <li class="navBarJump" style="padding-bottom: 20px;"><a href="ShoppingCart.aspx" title="Shopping Cart" style="padding-bottom: 20px;"><span id="shoppingCart" style="padding-bottom: 20px;">Shopping Cart</span></a></li>
                                <li class="navBarJump notFirst"><a href="WishList.aspx" title="Wish List"><span id="wishList">Wish List</span></a></li>
                                <li class="navBarJump notFirst"><a href="MyAccount.aspx" title="My Account"><span runat="server" id="myAccount">My Account</span></a>
                                    <div class="subMenu" style="width: 210px;">
                                        <ul>
                                            <li><a href="MyAccount.aspx" title="My Account"><span>My Account</span></a></li>
                                            <li><a href="PurchaseHistory.aspx" title="Purchase History"><span>Purchase History</span></a></li>
                                            <li id="myGalleryList" visible="false" runat="server"><a href="MyGallery.aspx" title="My Gallery"><span>My Gallery</span></a></li>
                                            <li id="myProductList" visible="false" runat="server"><a href="New.aspx" title="My Product"><span>My Product</span></a></li>
                                        </ul>
                                        <ul style="border-top: 2px solid white;">
                                            <li><a href="Login.aspx" title="Logout / Signin"><span>Logout/Signin</span></a></li>
                                            <li><a href="Register.aspx" title="Register"><span>Register</span></a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                    max-width: 800px;
                    max-height: 500px;
                    left: 0;
                    right: 0;
                    margin: 0 auto;
                    position: relative;
                    text-align: center;
                }
            </style>

            <div style="text-align: center; width: 100%; margin-top: 40px;">
                <i style="font-family: Cambria; font-size: 28px;">*** &ensp; Gallery Photo &ensp; ***</i>

                <div>There has a total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="Label"></asp:Label>
                    photos in this gallery.</div>

                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="galleryPhoto" style="margin-top: 10px;">
                            <asp:Image ID="GalleryImage" ImageUrl='<%# Eval("Image") %>' runat="server" Style="max-height: 499px; max-width: 799px;" />
                            <div style="position: absolute; bottom: 50px; z-index: 1; text-align: center; width: 100%">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Visible="False" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div id="productDiv2" runat="server" style="text-align: center;">
                <hr />
                Go To Product : <a runat="server" style="color: #404090;" id="productLink2" href="#">
                    <asp:Label ID="lblProductName2" runat="server" Text="Label"></asp:Label></a>
                <hr />
            </div>

            <div style="text-align: center;">
                <hr />
                <asp:FileUpload ID="FileUpload1" runat="server" Width="115px" Style="clear: left;" AllowMultiple="true" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Width="115px" />
                <asp:Label ID="Label1" runat="server" Text="Please upload an image." />
                <hr />
                <hr />
                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" Width="115px" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="115px" Visible="false" />
                <asp:Button ID="btnDeleteAll" runat="server" Text="Delete All" OnClick="btnDeleteAll_Click" OnClientClick="return confirm('Do you want to delete the entire gallery?')" Width="115px" />
            </div>

            <!-- Main Content End -->
        </div>
        <!-- Body Content End -->
    </form>
</body>
</html>
