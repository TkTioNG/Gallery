<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GalleryDetails.aspx.cs" Inherits="Gallery.GalleryDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <link rel="stylesheet" href="CSS/master.css" />
    <link rel="stylesheet" href="CSS/Homepage.css" />
    <script type="text/javascript" src="JavaScript/navBarScroll.js"></script>

    <style>
        #checkOutBg {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 10;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.2);
        }

        #checkOutForm {
            position: absolute;
            height: 680px;
            width: 1350px;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            background-color: white;
            border-radius: 20px;
            padding: 60px;
        }

        .ctrlButton {
            margin-left: 20px;
            margin-right: 20px;
            width: 100px;
            border-radius: 5px;
            transition-duration: 0.2s;
            -webkit-transition-duration: 0.2s;
            background-color: transparent;
            color: black;
            border: 1.5px solid black;
            height: 30px;
        }

            .ctrlButton:hover {
                color: #404090;
                border: 2px solid #404090;
                box-shadow: 0 6px 8px 0 rgba(64,64,144,0.2), 0 8px 12px 0 rgba(64,64,144,0.15);
            }

        .formSubTitle {
            font-size: 24px;
            text-decoration: underline;
            color: #404090;
        }

        .shopButton {
            width: 160px;
            height: 50px;
            margin: 10px 10px 10px 5px;
            font-size: 15px;
            background-color: #404090;
            color: white;
            border: none;
            text-align: center;
            float: left;
        }

            .shopButton:hover {
                background-color: #6060B0;
                color: white;
            }

        .fakeBtn:hover {
            cursor: pointer;
        }

        .img-zoom-lens {
            position: absolute;
            border: 1px solid #d4d4d4;
            /*set the size of the lens:*/
            width: 40px;
            height: 40px;
        }

        #imageHover:hover + #myresult {
            display: block;
        }

        .img-zoom-result {
            border: 1px solid #d4d4d4;
            /*set the size of the result div:*/
            width: 400px;
            height: 400px;
            z-index: 2;
            position: absolute;
            top: 348px;
            left: 520px;
            display: none;
        }
    </style>

    <script>
        function plusQty() {
            var quantity = parseInt(document.getElementById("lblQuantity").textContent);
            document.getElementById("lblQuantity").textContent = (quantity + 1).toString();
            calPrice();
        }
        function minusQty() {
            var quantity = parseInt(document.getElementById("lblQuantity").textContent);
            if (quantity > 1) {
                document.getElementById("lblQuantity").textContent = (quantity - 1).toString();
                calPrice();
            }
        }
        function calPrice() {
            var quantity = parseInt(document.getElementById("lblQuantity").textContent);
            var unitPrice = parseFloat(document.getElementById("lblPrice").textContent);
            var finalPrice = "RM " + (quantity * unitPrice).toFixed(2).toString();
            document.getElementById("lblFinalPrice").textContent = finalPrice;
        }
    </script>
    <script>
        function setZoomIn() {
            imageZoom("imageField", "myresult");
        }

        function setVisible() {
            result = document.getElementById("myresult");
            result.style.display = "block";
        }

        function imageZoom(imgID, resultID) {
            var img, lens, result, cx, cy;
            img = document.getElementById(imgID);
            result = document.getElementById(resultID);
            /* Create lens: */
            lens = document.createElement("DIV");
            lens.setAttribute("class", "img-zoom-lens");
            /* Insert lens: */
            img.parentElement.insertBefore(lens, img);
            /* Calculate the ratio between result DIV and lens: */
            cx = result.offsetWidth / lens.offsetWidth / 4.2;
            cy = result.offsetHeight / lens.offsetHeight / 4.2;
            /* Set background properties for the result DIV */
            result.style.backgroundImage = "url('" + img.src + "')";
            result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
            /* Execute a function when someone moves the cursor over the image, or the lens: */
            lens.addEventListener("mousemove", moveLens);
            img.addEventListener("mousemove", moveLens);
            /* And also for touch screens: */
            lens.addEventListener("touchmove", moveLens);
            img.addEventListener("touchmove", moveLens);
            function moveLens(e) {
                var pos, x, y;
                /* Prevent any other actions that may occur when moving over the image */
                e.preventDefault();
                /* Get the cursor's x and y positions: */
                pos = getCursorPos(e);
                /* Calculate the position of the lens: */
                x = pos.x - (lens.offsetWidth / 2);
                y = pos.y - (lens.offsetHeight / 2);
                /* Prevent the lens from being positioned outside the image: */
                if (x > img.width - lens.offsetWidth) { x = img.width - lens.offsetWidth; }
                if (x < 0) { x = 0; }
                if (y > img.height - lens.offsetHeight) { y = img.height - lens.offsetHeight; }
                if (y < 0) { y = 0; }
                /* Set the position of the lens: */
                lens.style.left = x + "px";
                lens.style.top = y + "px";
                /* Display what the lens "sees": */
                result.style.backgroundPosition = "-" + (x * cx - (x * cx / 2)) + "px -" + (y * cy - (y * cy / 2)) + "px";
            }
            function getCursorPos(e) {
                var a, x = 0, y = 0;
                e = e || window.event;
                /* Get the x and y positions of the image: */
                a = img.getBoundingClientRect();
                /* Calculate the cursor's x and y coordinates, relative to the image: */
                x = e.pageX - a.left;
                y = e.pageY - a.top;
                /* Consider any page scrolling: */
                x = x - window.pageXOffset;
                y = y - window.pageYOffset;
                return { x: x, y: y };
            }
        }
    </script>
</head>
<body onload="calPrice()">
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

            <!-- Insert your code here -->
            <div id="ProductDetails" runat="server" style="margin: 20px;">
                <div id="imageHover" style="display: inline-block; position: relative; width: 30%; min-width: 200px; max-width: 360px; padding: 10px; min-height: 180px; max-height: 300px;" onmouseover="setZoomIn()">
                    <asp:Image ID="imageField" runat="server" Style="position: absolute; vertical-align: middle; min-height: 180px; max-height: 300px; max-width: 360px; left: 0; right: 0; margin: auto;" ImageAlign="AbsMiddle" />
                </div>

                <div id="myresult" class="img-zoom-result"></div>

                <div style="float: right; display: inline-block; width: 68%; min-width: 320px; min-height: 180px; padding-left: 20px; padding-right: 5px; margin-top: 10px;">
                    <table style="width: 100%; vertical-align: middle; line-height: 36px;">
                        <tr>
                            <td colspan="2">
                                <asp:Label runat="server" ID="lblProductName" CssClass="lblTitleLink" Style="color: #404090; font-size: 28px;"></asp:Label></td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblSalerID" runat="server"></asp:Label></td>
                        </tr>

                        <tr>
                            <td style="width: 50%; max-width: 50%;">Stock &emsp;&emsp;&emsp;&ensp;:&ensp;
                                <asp:Label ID="lblStock" runat="server"></asp:Label></td>
                            <td style="width: 50%; max-width: 50%;">Sales &emsp;&emsp;&emsp;&ensp;:&ensp;
                                <asp:Label ID="lblSales" runat="server"></asp:Label></td>
                        </tr>

                        <tr>
                            <td style="width: 50%; max-width: 50%;">CategoryID &emsp;:&ensp;
                                <asp:Label ID="lblCat" runat="server"></asp:Label></td>
                            <td style="width: 50%; max-width: 50%;">Price &emsp;&emsp;&emsp;&ensp;:&ensp; RM&nbsp;<asp:Label ID="lblPrice" runat="server"></asp:Label></td>
                        </tr>

                        <tr>
                            <td rowspan="2" colspan="2"><span style="vertical-align: top;">Description &emsp;: &nbsp;</span>
                                <asp:Label ID="lblDesc" runat="server" Height="80px" BorderStyle="Solid" Width="80%" BorderColor="Silver" BorderWidth="1px"></asp:Label></td>
                        </tr>
                    </table>

                    <div style="clear: both; float: left; margin: 5px; margin-top: 15px;">
                        <div style="float: left; clear: both; margin-top: 15px;">Quantity &emsp;&emsp;&ensp;</div>
                        <div style="position: relative; width: 130px; height: 32px; border: 0.5px solid grey; margin: 10px; text-align: center; float: left;">
                            <div class="fakeBtn" style="border-right: 0.5px solid grey; position: absolute; top: 0; left: 0; height: 32px; width: 32px; text-align: center; padding-top: 5px;" onclick="minusQty()"><i class="fas fa-minus fa-xs"></i></div>
                            <div style="margin-top: 5px;">
                                <asp:Label ID="lblQuantity" runat="server" Text="1"></asp:Label>
                            </div>
                            <div class="fakeBtn" style="border-left: 0.5px solid grey; position: absolute; top: 0; right: 0; height: 32px; width: 32px; text-align: center; padding-top: 5px;" onclick="plusQty()"><i class="fas fa-plus fa-xs"></i></div>
                        </div>

                        <div style="float: left; margin-top: 10px; margin-left: 155px;">Final Price &emsp;&emsp;<asp:Label ID="lblFinalPrice" Style="color: tomato; font-size: 24px;" runat="server"></asp:Label></div>
                    </div>


                    <div style="clear: both;">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="shopButton" style="padding-top: 15px;">
                                    <asp:LinkButton ID="btnWishList" runat="server" OnClick="AddWishList"><i class="far fa-heart fa-sm"></i>&nbsp;Wishing List</asp:LinkButton>
                                </div>

                                <div class="shopButton" style="padding-top: 15px;">
                                    <asp:LinkButton ID="btnAddCart" runat="server" OnClick="AddShopCart"><i class="fa fa-shopping-cart fa-sm"></i>&nbsp;Add to Cart</asp:LinkButton>
                                </div>

                                <div class="shopButton" style="padding-top: 15px;">
                                    <asp:LinkButton ID="btnBuyNow" runat="server" OnClientClick="return confirmBuy()"><i class="fas fa-shopping-basket fa-sm"></i>&nbsp;Buy Now</asp:LinkButton>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <script>
                        function confirmBuy() {
                            if (confirm('Do you wish to check out right now?')) {
                                document.getElementById("checkOutBg").style.display = "block";
                                document.getElementById("lblProductName2").textContent = document.getElementById("lblProductName").textContent;
                                document.getElementById("lblPrice2").textContent = document.getElementById("lblPrice").textContent;
                                document.getElementById("lblQuantity2").textContent = document.getElementById("lblQuantity").textContent;
                                document.getElementById("lblFinalPrice2").textContent = document.getElementById("lblFinalPrice").textContent;
                                return true;
                            }
                            return false;
                        }
                    </script>

                </div>
                <div id="EmptyDetails" visible="false" runat="server">No Such Product</div>
            </div>

            <div id="checkOutBg" runat="server" style="display: none;">
                <div id="checkOutForm">
                    <div style="position: absolute; top: 40px; right: 55px;">
                        <asp:ImageButton ID="imageBtnCancel" ImageUrl="Images/cancel_button.png" ToolTip="Cancel" runat="server" Width="40px" Height="40px" OnClientClick="document.location.reload(true)" />
                    </div>

                    <div style="text-align: center;"><span class="formSubTitle" style="font-size: 36px; font-variant: small-caps; margin-bottom: 20px; text-decoration: none;">Checking Out</span> </div>

                    <div style="float: left; height: 400px; width: 40%; margin-top: 30px; margin-left: 80px;">
                        <table style="line-height: 32px;">
                            <tr>
                                <td><span class="formSubTitle">Product Details</span> </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="width: 100%; height: 300px; text-align: center;">
                                        <asp:Image ID="imageField2" runat="server" Style="vertical-align: middle; max-height: 300px; max-width: 100%; left: 0; right: 0; margin: auto;" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Product Name :&emsp;
                                    <asp:Label runat="server" ID="lblProductName2"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Unit Price &emsp;&nbsp; : &emsp; RM
                                    <asp:Label ID="lblPrice2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Quantity &emsp;&ensp;&nbsp; : &emsp;
                                    <asp:Label ID="lblQuantity2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Final Price &emsp;&nbsp;: &emsp;
                                    <asp:Label ID="lblFinalPrice2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div style="float: right; height: 400px; width: 40%; margin-top: 30px;">
                        <table style="line-height: 32px;">
                            <tr>
                                <td><span class="formSubTitle">Recipient Details</span> </td>
                            </tr>
                            <tr>
                                <td>Recipient Name :&ensp;
                                    <asp:TextBox ID="txtRcpName" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Recipient Name is required" ForeColor="Red" ControlToValidate="txtRcpName">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td>Phone Number :&emsp;
                                    <asp:TextBox ID="txtRcpPhone" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number is required" ForeColor="Red" ControlToValidate="txtRcpPhone">
                                    </asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="0([1-9]{2}-|[1-9]{2})[1-9]{7,8}$" ControlToValidate="txtRcpPhone" ErrorMessage="Phone Number must be 10-11 digits" ForeColor="Red"></asp:RegularExpressionValidator>
                                </td>
                            </tr>

                            <tr>
                                <td><span class="formSubTitle">Address Details</span> </td>
                            </tr>

                            <tr>
                                <td>Street Name :&emsp; &emsp;
                                    <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Recipient Name is required" ForeColor="Red" ControlToValidate="txtStreet">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td>Area Name :&emsp;&emsp;&ensp;
                                    <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Recipient Name is required" ForeColor="Red" ControlToValidate="txtArea">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td>Post Code :&emsp;&emsp;&emsp;
                                    <asp:TextBox ID="txtPostCode" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Recipient Name is required" ForeColor="Red" ControlToValidate="txtPostCode">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="[0-9]{5}$" ControlToValidate="txtPostCode" ErrorMessage="Postcode must be 5-digits number" ForeColor="Red"></asp:RegularExpressionValidator>
                                </td>
                            </tr>

                            <tr>
                                <td>State :&emsp;&emsp;&emsp;&emsp;&emsp; 
                                <asp:DropDownList ID="ddlState" runat="server" Width="220px">
                                    <asp:ListItem Selected="True"> Penang </asp:ListItem>
                                    <asp:ListItem> Kedah </asp:ListItem>
                                    <asp:ListItem> WP Kuala Lumpur </asp:ListItem>
                                    <asp:ListItem> Johor </asp:ListItem>
                                    <asp:ListItem> Sabah </asp:ListItem>
                                    <asp:ListItem> Sarawak </asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div style="position: absolute; bottom: 30px; text-align: center; width: auto; right: 0; left: 0; margin: auto;">
                        <asp:Button ID="btnInPurchase" runat="server" Text="Purchase" CssClass="ctrlButton" OnClick="BuyNow" />
                        <asp:Button ID="btnInCancel" runat="server" Text="Cancel" OnClientClick="document.location.reload(true)" CssClass="ctrlButton" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
