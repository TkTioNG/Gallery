<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyGalleryInsert.aspx.cs" Inherits="Gallery.MyGalleryInsert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <link rel="stylesheet" href="CSS/master.css" />
    <link rel="stylesheet" href="CSS/Gallery.css" />
    <link rel="stylesheet" href="CSS/Homepage.css" />
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

        <!-- Sticky Nav Bar End -->

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
                <div style="width: 100%; position: relative; text-align: center; margin-top: 10px; margin-bottom: 10px; color: darkslategrey;">
                    A total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                    gallery(s) is/are on display.
                </div>

                <asp:Button ID="btnInsert1" runat="server" Text="Add Gallery" OnClick="AddGallery" CssClass="insertBtn btnInsert1" />

                <div style="margin-left: 35px;">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
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
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div style="width: 100%; text-align: center; margin-top: 40px; clear: both;">
                    <asp:Button ID="btnInsert2" runat="server" Text="Add Gallery" OnClick="AddGallery" CausesValidation="false" class="insertBtn" />
                </div>

                <div runat="server" id="inDiv" style="display: block !important; top: 0; left: 0; right: 0; bottom: 0; z-index: 10; background-color: rgba(0,0,0,0.4); position: fixed;">
                    <div style="position: absolute; background-color: white; width: 84%; height: 500px; top: 50%; left: 50%; transform: translate(-50%,-50%); padding: 0 30px; padding-top: 40px; border-radius: 20px;">

                        <div style="position: absolute; top: 40px; right: 55px;">
                            <asp:ImageButton ID="imageBtnCancel" ImageUrl="Images/cancel_button.png" CausesValidation="false" ToolTip="Cancel" runat="server" Width="40px" Height="40px" OnClick="InsertCancel_Click" OnClientClick="document.location.reload(true)" />
                        </div>

                        <div style="clear: left; height: 90%; width: 35%; min-width: 250px; float: left;">
                            <div style="width: 100%; height: 350px; vertical-align: middle; text-align: center; position: relative;">
                                <div style="border: 1px solid black; width: 320px; height: 320px; position: absolute; top: 0; bottom: 0; left: 0; right: 0; margin: auto; border-radius: 10px;">
                                    <asp:Image ID="ImageUpload" runat="server" BorderColor="Black" ImageUrl="Images/select_image_icon.png" Style="max-height: 300px; max-width: 300px; position: absolute; top: 0; bottom: 0; left: 0; right: 0; margin: auto;" />
                                </div>
                            </div>
                            <div style="vertical-align: middle; text-align: center; margin: 15px;">
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="115px" Style="clear: left;" CausesValidation="false" />
                                <asp:Button ID="btnUpload1" runat="server" Text="Upload" OnClick="btnUpload_Click" Width="115px" CausesValidation="false" />
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Please upload one main image." />
                            </div>
                        </div>

                        <div style="height: 90%; width: 64%; min-width: 250px; float: left;">
                            <div style="color: #404090; font-size: 26px; margin-top: 10px;">New Gallery</div>
                            <table style="width: 100%; vertical-align: middle; margin-top: 20px;">
                                <tr>
                                    <td colspan="2">Gallery Name : &ensp;<asp:TextBox ID="txtInGalleryName" runat="server" Width="82%"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInGalleryName" ForeColor="Red" ErrorMessage="Please Enter Gallery Name"></asp:RequiredFieldValidator></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <br />
                                        Product ID &emsp; : &ensp;<asp:TextBox ID="txtInProductName" runat="server" Width="82%" CssClass="editable"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td rowspan="2" colspan="2">
                                        <br />
                                        <span style="vertical-align: top;">Description &emsp;: &nbsp;</span>
                                        <asp:TextBox ID="txtInDesc" runat="server" Height="80px" BorderStyle="Solid" Width="82%" BorderColor="Silver" BorderWidth="1px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInDesc" ForeColor="Red" ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator></td>
                                </tr>
                            </table>


                            <div style="vertical-align: middle; text-align: center; margin: 15px; margin-top: 10px;">
                                <asp:FileUpload ID="FileUpload2" runat="server" Width="123px" Style="clear: left;" AllowMultiple="true" CausesValidation="false" />
                                <asp:Button ID="btnUpload2" runat="server" Text="Upload" OnClick="btnUpload2_Click" Width="115px" CausesValidation="false" />
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Please upload other images." />
                            </div>

                            <div style="text-align: center; width: 100%; margin-top: 10px;">
                                <asp:Button ID="btnInAdd" runat="server" Text="Add" CssClass="ctrlButton" OnClick="OnInsert" />
                                <asp:Button ID="btnInCancel" runat="server" Text="Cancel" OnClick="InsertCancel_Click" OnClientClick="document.location.reload(true)" CssClass="ctrlButton" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Content End -->
        </div>
        <!-- Body Content End -->
    </form>
</body>
</html>
