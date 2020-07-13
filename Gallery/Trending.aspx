<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trending.aspx.cs" Inherits="Gallery.Trending1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trending</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <link rel="stylesheet" href="CSS/master.css" />
    <link rel="stylesheet" href="CSS/Homepage.css" />
    <link rel="stylesheet" href="CSS/Gallery.css" />
    <script type="text/javascript" src="JavaScript/navBarScroll.js"></script>
    <script type="text/javascript" src="JavaScript/grid_detail_view.js"></script>
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
            <!-- Site Map Path End -->

            <!-- Main Content Start -->
            <div>
                <div style="width: 100%; position: relative; text-align: center; margin-top: 10px; margin-bottom: 10px; color: darkslategrey;">
                    There is a total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                    product(s) is/are currently on sale.
                    <br />
                    Filter by : &nbsp; 
                    <asp:DropDownList ID="ddlFilter" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="all">All Newest</asp:ListItem>
                        <asp:ListItem Value="cosplay">Cosplay Costume</asp:ListItem>
                        <asp:ListItem Value="miniature">Cute Miniature</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="styleView" style="top: 325px;">
                    <div class="styleViewType" style="border-right: 1px solid black;" onclick="changeGridView()"><span><i class="fas fa-th-large" style="font-size: 13px;">&nbsp;</i>Grid View</span></div>
                    <div class="styleViewType" onclick="changeDetailsView()"><span><i class="fas fa-list" style="font-size: 13px;">&nbsp;</i>Details View</span></div>
                </div>

                <div style="width: 1251px; margin-left: auto; margin-right: auto; left: 0; right: 0;">
                    <asp:Repeater ID="RepeaterNew" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div id="detailsView" class="detailsView">
                                <div style="width: 100%; min-height: 220px;">
                                    <div class="imgDiv" style="background-image: url(<%# Eval("Image") %>); background-size: contain;">
                                        <a href='<%# "GalleryDetails.aspx?productID=" + Eval("ProductID") %>' title='<%# Eval("ProductName") %>' runat="server"></a>
                                    </div>

                                    <div style="float: right; display: inline-block; width: 68%; min-width: 320px; min-height: 180px; padding-left: 20px; padding-right: 5px; margin-top: 10px;">
                                        <table style="width: 100%; vertical-align: middle; line-height: 30px;">
                                            <tr>
                                                <td colspan="2"><a id="linkName" href='<%# "GalleryDetails.aspx?productID=" + Eval("ProductID") %>' title='<%# Eval("ProductName") %>' runat="server">
                                                    <asp:Label runat="server" ID="lblProductName" CssClass="lblTitleLink" Style="color: #404090; font-size: 28px;" Text='<%# Eval("ProductName") %>'></asp:Label></a></td>
                                            </tr>

                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lblSalerIDNew" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></td>
                                            </tr>

                                            <tr>
                                                <td style="width: 50%; max-width: 50%;">Stock &emsp;&emsp;&emsp;&ensp;:&ensp;
                                                    <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label></td>
                                                <td style="width: 50%; max-width: 50%;">Sales &emsp;&emsp;&emsp;&ensp;:&ensp;
                                                    <asp:Label ID="lblSales" runat="server" Text='<%# Eval("Sales") %>'></asp:Label></td>
                                            </tr>

                                            <tr>
                                                <td style="width: 50%; max-width: 50%;">CategoryID &emsp;:&ensp;
                                                    <asp:Label ID="lblCatNew" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label></td>
                                                <td style="width: 50%; max-width: 50%;">Price &emsp;&emsp;&emsp;&ensp;:&ensp; RM&nbsp;<asp:Label ID="lblPriceNew" runat="server" Text='<%# Eval("Price") %>'></asp:Label></td>
                                            </tr>

                                            <tr>
                                                <td rowspan="2" colspan="2"><span style="vertical-align: top;">Description &emsp;: &nbsp;</span>
                                                    <asp:Label ID="lblDescNew" runat="server" Height="80px" BorderStyle="Solid" Width="80%" BorderColor="Silver" BorderWidth="1px" Text='<%# Eval("Description") %>'></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div id="gridView" class="test gridView">
                                <a href='<%# "GalleryDetails.aspx?productID=" + Eval("ProductID") %>' title='<%# Eval("ProductName") %>' runat="server">
                                    <div class="imgDiv" style="background-image: url(<%# Eval("Image") %>);"></div>

                                    <div>
                                        <div style="text-align: center; width: 100%; margin-bottom: 10px; font-size: 20px; padding: 5px; color: black;">
                                            <span><%# Eval("ProductName") %></span>
                                            <br />
                                            <span style="font-size: 16px;"><%# "RM " + Eval("Price") %></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div style="clear: both;">
                    <br />
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P.ProductID, P.ProductName, P.SalerID, P.Image, P.Stock, P.Sales, P.CategoryID, P.Description, P.Price, U.UserName, C.CategoryName FROM Product AS P INNER JOIN Users AS U ON P.SalerID = U.UserID INNER JOIN Category AS C ON P.CategoryID = C.CategoryId ORDER BY P.ProductID DESC"></asp:SqlDataSource>
            </div>
            <!-- Main Content End -->
        </div>
        <!-- Body Content End -->
    </form>
</body>
</html>
