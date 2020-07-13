<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralError.aspx.cs" Inherits="Gallery.ErrorPages.GeneralError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <link rel="stylesheet" href="../CSS/master.css" />
    <link rel="stylesheet" href="../CSS/Homepage.css" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- Sticky Nav Bar Start -->
        <div class="title-up">
            <div style="text-align: center; padding-top: 50px;">
                <img src="../Images/New_Logo.png" style="width: 800px;" />
            </div>
            <div id="stickyNavBar" class="movNavBar">  
                <div class="navBar" style="padding-bottom: 0; bottom: 0;">
                    <div>
                        <a href="../Homepage.aspx" class="shopName" title="This is the shop name" style="margin-right:-30px; margin-top: -5px;">
                            <img src="../Images/New_Logo_2.png" style="width: 100px;" />
                        </a>
                        <nav class="navBarRow">
                            <ul>
                                <li class="navBarJump notFirst"><a href="../Trending.aspx" title="Trending"><span>Trending</span></a>
                                </li>                        
                                <li class="navBarJump notFirst"><a href="../Gallery.aspx" title="Gallery"><span>Gallery</span></a>
                                </li>
                                <li class="navBarJump notFirst"><a href="../Cosplay.aspx" title="Cosplay"><span>Cosplay</span></a>
                                    <div class="subMenu" style="width: 210px;">
                                        <ul>
                                            <li><a href="../Cosplay.aspx" title="All Cosplay"><span>All</span></a></li>
                                            <li><a href="../Cosplay.aspx?filter=male" title="Male Costume"><span>Male Costume</span></a></li>
                                            <li><a href="../Cosplay.aspx?filter=female" title="Female Costume"><span>Female Costume</span></a></li>
                                            <li><a href="../Cosplay.aspx?filter=anime" title="Anime Style"><span>Anime Style</span></a></li>
                                            <li><a href="../Cosplay.aspx?filter=europe" title="Europe Style"><span>Europe Style</span></a></li>
                                        </ul>
                                    </div>
                                </li>                        
                                <li class="navBarJump notFirst"><a href="Miniature.aspx" title="Miniature"><span>Miniature</span></a>
                                    <div class="subMenu" style="width: 210px;">
                                        <ul>
                                            <li><a href="../Miniature.aspx?filter=figure" title="All Figure"><span>All Figure</span></a></li>
                                            <li><a href="../Miniature.aspx?filter=pvc" title="PVC Figure"><span>PVC Figure</span></a></li>
                                            <li><a href="../Miniature.aspx?filter=nendoroid" title="Nendoroid Figure"><span>Nendoroid Figure</span></a></li>
                                            <li><a href="../Miniature.aspx?filter=gundam" title="Gundam Figure"><span>Gundam Figure</span></a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </nav>

                        <div class="navBarRow" style="float: right; margin-right: 8%; padding-bottom: 20px;">
                            <ul>
                                <li class="navBarJump" style=" padding-bottom: 20px;"><a href="../ShoppingCart.aspx" title="Shopping Cart" style="padding-bottom: 20px;"><span id="shoppingCart" style="padding-bottom: 20px;">Shopping Cart</span></a></li>
                                <li class="navBarJump notFirst"><a href="../WishList.aspx" title="Wish List"><span id="wishList">Wish List</span></a></li>
                                <li class="navBarJump notFirst"><a href="../MyAccount.aspx" title="My Account"><span runat="server" id="myAccount">My Account</span></a>
                                    <div class="subMenu" style="width: 210px;">
                                        <ul>
                                            <li><a href="../MyAccount.aspx" title="My Account"><span>My Account</span></a></li>
                                            <li><a href="../PurchaseHistory.aspx" title="Purchase History"><span>Purchase History</span></a></li>
                                            <li id="myGalleryList" visible ="false" runat="server"><a href="../MyGallery.aspx" title="My Gallery"><span>My Gallery</span></a></li>
                                            <li id="myProductList" visible ="false" runat="server"><a href="../New.aspx" title="My Product"><span>My Product</span></a></li>
                                        </ul>
                                        <ul style="border-top: 2px solid white;">
                                            <li><a href="../Login.aspx" title="Logout / Signin"><span>Logout/Signin</span></a></li>
                                            <li><a href="../Register.aspx" title="Register"><span>Register</span></a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>                
                </div>
            </div>
        </div>

        <!-- Sticky Nav Bar Script Start -->
        <script>
            // When the user scrolls the page, execute myFunction
            window.onscroll = function () { myFunction() };

            // Get the navbar
            var navbar = document.getElementById("stickyNavBar");

            // Get the offset position of the navbar
            //var sticky = navbar.offsetTop;

            // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
            function myFunction() {
                if (window.pageYOffset > 228) {
                    navbar.classList.add("stickyNav")
                    //document.getElementById("testing").textContent = window.pageYOffset;
                } else {
                    navbar.classList.remove("stickyNav");
                }
            }
        </script>
        <!-- Sticky Nav Bar Script End -->
        <!-- Sticky Nav Bar End -->

        <!-- Body Content Start -->
        <div id="body">
            <!-- Main Content End --> 
            <div style="width: 100%; margin-top: 10px; text-align: center;">
                <asp:Image ID="Image1" runat="server" ImageUrl="../Images/sorry.jpg" Width="600px" />

                <div style="width: 600px; text-align: left; left: 0; right: 0; margin: auto;">
                    <i>Sorry&ensp;&nbsp;That&ensp;&nbsp;Our&ensp;&nbsp;Website&ensp;&nbsp;Is&ensp;&nbsp;Currently&ensp;&nbsp;Facing&ensp;&nbsp;Some&ensp;&nbsp;Issues.&ensp;&nbsp;Please&ensp;&nbsp;Be&ensp;Patient&ensp;&nbsp;That&ensp;&nbsp;We&ensp;&nbsp;Will&ensp;&nbsp;Fixed&ensp;&nbsp;It&ensp;&nbsp;As&ensp;&nbsp;Soon&ensp;&nbsp;As&ensp;&nbsp;Possible.&ensp;&nbsp;<br /><br />Please&ensp;&nbsp;Refer&ensp;&nbsp;The&ensp;&nbsp;Error&ensp;&nbsp;Below&ensp;&nbsp;To&ensp;&nbsp;Acknowledge&ensp;&nbsp;The&ensp;&nbsp;Issue&ensp;&nbsp;Faced.</i>
                </div> <br />

                <div id="errMsg" runat="server" style="width: 600px; text-align: left; left: 0; right: 0; margin: auto; background-color: lightgray;">

                </div>
            </div>
            <!-- Main Content End -->        
        </div>
            
            
        <!-- Body Content End -->       
    </form>
</body>
</html>
