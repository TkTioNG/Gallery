<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewInsert.aspx.cs" Inherits="Gallery.NewInsert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New</title>
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

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
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
                            You have a total of
                            <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                            product(s) is/are currently on sale.
                        </div>

                        <asp:Button ID="btnInsert1" runat="server" CausesValidation="false" Text="Add New Product" CssClass="insertBtn btnInsert1" OnClick="BtnInsertNew_Click" />

                        <asp:DropDownList ID="ddlMaxProdID" runat="server" DataSourceID="SqlDataSource1" Visible="false" DataTextField="ProductID" DataValueField="ProductID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductID] FROM [NewData]"></asp:SqlDataSource>
                        <asp:Label ID="lblMaxProdID" runat="server" Visible="false"></asp:Label>

                        <!-- 
                            <asp:TextBox ID="txtCatNew" runat="server" CssClass="editable" Visible="false" Text='%# Eval("CategoryName") %'></asp:TextBox> -->

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]"></asp:SqlDataSource>

                        <asp:Repeater ID="RepeaterNew" runat="server">
                            <ItemTemplate>
                                <div style="width: 95%; border-bottom: 2px solid gray; padding-top: 25px; margin-left: 2.5%; min-height: 300px;">
                                    <div style="width: 100%; min-height: 220px;">
                                        <div style="display: inline-block; position: relative; width: 30%; min-width: 200px; max-width: 30%; padding: 10px; min-height: 180px;">
                                            <asp:Image ID="imageField" runat="server" ImageUrl='<%# Eval("Image") %>' Style="position: absolute; vertical-align: middle; min-height: 180px; max-height: 220px; max-width: 360px; left: 0; right: 0; margin: auto;" />
                                        </div>

                                        <div style="float: right; display: inline-block; width: 68%; min-width: 320px; min-height: 180px; padding-left: 20px; padding-right: 5px; margin-top: 10px;">
                                            <asp:Label ID="lblProductID" runat="server" Visible="false" Text='<%# Eval("ProductID") %>'></asp:Label>
                                            <table style="width: 100%; vertical-align: middle; line-height: 30px;">
                                                <tr>
                                                    <td colspan="2"><a id="linkName" href="#" onclick="" runat="server">
                                                        <asp:Label runat="server" ID="lblProductNameNew" CssClass="lblTitleLink" Style="color: #404090; font-size: 28px;" Text='<%# Eval("ProductName") %>'></asp:Label></a>
                                                        <asp:TextBox ID="txtProductNameNew" runat="server" Width="97.5%" Visible="false" Text='<%# Eval("ProductName") %>'></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="lblSalerNameNew" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 50%; max-width: 50%;">Stock &emsp;&emsp;&emsp;&ensp;:&ensp;<asp:Label ID="lblStockNew" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                                                        <asp:TextBox ID="txtStockNew" runat="server" CssClass="editable" Visible="false" Text='<%# Eval("Stock") %>'></asp:TextBox></td>
                                                    <td style="width: 50%; max-width: 50%;">Sales &emsp;&emsp;&emsp;&ensp;:&ensp;
                                                        <asp:Label ID="lblSalesNew" runat="server" Text='<%# Eval("Sales") %>'></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 50%; max-width: 50%;">Category &emsp;&emsp;:&ensp;
                                                        <asp:Label ID="lblCatNew" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                                        <asp:DropDownList ID="ddlCatNew" CssClass="editable" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryID" Visible="false" runat="server"></asp:DropDownList></td>
                                                    <td style="width: 50%; max-width: 50%;">Price &emsp;&emsp;&emsp;&ensp;:&ensp; RM&nbsp;<asp:Label ID="lblPriceNew" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                        <asp:TextBox ID="txtPriceNew" runat="server" CssClass="editable" Visible="false" Text='<%# Eval("Price") %>'></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td rowspan="2" colspan="2"><span style="vertical-align: top;">Description &emsp;: &nbsp;</span>
                                                        <asp:Label ID="lblDescNew" runat="server" Height="80px" BorderStyle="Solid" Width="82%" BorderColor="Silver" BorderWidth="1px" Text='<%# Eval("Description") %>'></asp:Label>
                                                        <asp:TextBox ID="txtDescNew" runat="server" Height="80px" BorderStyle="Solid" Width="82%" BorderColor="Silver" BorderWidth="1px" Visible="false" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                    <div style="clear: both; margin-bottom: 15px; text-align: center;">
                                        <div style="display: inline-block; margin-top: 20px;">
                                            <asp:Button ID="btnEdit" CssClass="ctrlButton" Text="Edit" CausesValidation="false" runat="server" OnClick="OnEdit" />
                                            <asp:Button ID="btnUpdate" CssClass="ctrlButton" Text="Update" CausesValidation="false" runat="server" Visible="false" OnClick="OnUpdate" />
                                            <asp:Button ID="btnCancel" CssClass="ctrlButton" Text="Cancel" CausesValidation="false" runat="server" Visible="false" OnClick="OnCancel" />
                                            <asp:Button ID="btnDelete" CssClass="ctrlButton" Text="Delete" CausesValidation="false" runat="server" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                        <!--- <asp:SqlDataSource ID="SqlDataSourceNew1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource> --->
                    </div>

                    <div style="width: 100%; text-align: center; margin-top: 40px;">
                        <asp:Button ID="btnInsert2" runat="server" Text="Add New Product" CausesValidation="false" class="insertBtn" OnClick="BtnInsertNew_Click" />
                    </div>

                    <asp:Label ID="lblStatus" runat="server" Style="display: none" Text="false"></asp:Label>
                    <!-- Main Content End -->
                </div>
                <!-- Body Content End -->
            </ContentTemplate>
        </asp:UpdatePanel>

        <div runat="server" id="inDiv" style="display: block !important; top: 0; left: 0; right: 0; bottom: 0; z-index: 10; background-color: rgba(0,0,0,0.4); position: fixed;">
            <div style="position: absolute; background-color: white; width: 84%; height: 500px; top: 50%; left: 50%; transform: translate(-50%,-50%); padding: 0 30px; padding-top: 40px; border-radius: 20px;">

                <div style="position: absolute; top: 40px; right: 55px;">
                    <asp:ImageButton ID="imageBtnCancel" CausesValidation="false" ImageUrl="Images/cancel_button.png" ToolTip="Cancel" runat="server" Width="40px" Height="40px" OnClick="InsertCancel_Click" OnClientClick="document.location.reload(true)" />
                </div>

                <div style="clear: left; height: 90%; width: 35%; min-width: 250px; float: left;">
                    <div style="width: 100%; height: 350px; vertical-align: middle; text-align: center; position: relative;">
                        <div style="border: 1px solid black; width: 320px; height: 320px; position: absolute; top: 0; bottom: 0; left: 0; right: 0; margin: auto; border-radius: 10px;">
                            <asp:Image ID="ImageUpload" runat="server" BorderColor="Black" ImageUrl="Images/select_image_icon.png" Style="max-height: 300px; max-width: 300px; position: absolute; top: 0; bottom: 0; left: 0; right: 0; margin: auto;" />
                        </div>
                    </div>
                    <div style="vertical-align: middle; text-align: center; margin: 15px;">
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="115px" Style="clear: left;" AllowMultiple="true" CausesValidation="false" />
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Width="115px" CausesValidation="false" />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Please upload an image." />
                    </div>

                    <script>
                        var validFilesTypes = ["bmp", "gif", "png", "jpg", "jpeg"];

                        function ValidateFile() {
                            var file = document.getElementById("<%=FileUpload1.ClientID%>");
                            var label = document.getElementById("<%=Label1.ClientID%>");
                            var image = document.getElementById("<%=ImageUpload.ClientID%>");
                            var path = file.value;
                            var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
                            var isValidFile = false;

                            for (var i = 0; i < validFilesTypes.length; i++) {
                                if (ext == validFilesTypes[i]) {
                                    isValidFile = true;
                                    break;
                                }
                            }

                            if (!isValidFile) {
                                label.style.color = "red";
                                label.innerHTML = "Invalid File. Please upload a File with extension:\n\n" + validFilesTypes.join(", ");
                            }
                            else {
                                label.style.color = "black";
                                label.innerHTML = path;
                                image.image = "Images/" + path;
                            }
                            return isValidFile;
                        }
                    </script>
                </div>

                <div style="height: 90%; width: 64%; min-width: 250px; float: left;">
                    <div style="color: #404090; font-size: 26px; margin-top: 10px;">New Product</div>
                    <table style="width: 100%; vertical-align: middle; margin-top: 20px;">
                        <tr>
                            <td colspan="2">Product Name : &ensp;<asp:TextBox ID="txtInProductName" runat="server" Width="82%"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtInProductName" ErrorMessage="Product Name Is Needed"></asp:RequiredFieldValidator></td>
                        </tr>

                        <tr>
                            <td style="width: 50%; max-width: 50%;">Stock &emsp;&emsp;&emsp;&ensp;: &ensp;<asp:TextBox ID="txtInStock" runat="server" TextMode="Number" CssClass="editable"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtInStock" ErrorMessage="Stock Value Is Needed"></asp:RequiredFieldValidator></td>
                            <td style="width: 50%; max-width: 50%;"></td>
                        </tr>

                        <tr>
                            <td style="width: 50%; max-width: 50%;">Category &emsp;&emsp;:&ensp;
                                <asp:DropDownList ID="ddlInCat" CssClass="editable" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryID" runat="server"></asp:DropDownList></td>
                            <td style="width: 50%; max-width: 50%;">Price &emsp;&emsp;&emsp;:&ensp; RM&nbsp;
                                    <asp:TextBox ID="txtInPrice" runat="server" CssClass="editable" TextMode="Number"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ControlToValidate="txtInPrice" ErrorMessage="Price Is Needed"></asp:RequiredFieldValidator></td>
                        </tr>

                        <tr>
                            <td rowspan="2" colspan="2"><span style="vertical-align: top;">Description &emsp;: &nbsp;</span>
                                <asp:TextBox ID="txtInDesc" runat="server" Height="80px" BorderStyle="Solid" Width="82%" BorderColor="Silver" BorderWidth="1px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ControlToValidate="txtInDesc" ErrorMessage="Description Is Needed"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    <div style="text-align: center; width: 100%; margin-top: 50px;">
                        <asp:Button ID="btnInAdd" runat="server" Text="Add" CssClass="ctrlButton" OnClick="OnInsert" /><asp:Button ID="btnInCancel" runat="server" Text="Cancel" OnClick="InsertCancel_Click" OnClientClick="document.location.reload(true)" CausesValidation="false" CssClass="ctrlButton" />
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                if (args.get_error() == null) {
                    var value = document.getElementById('<%=lblStatus.ClientID%>').innerText;
                    if (value == "false") {
                        document.getElementById("inDiv").style.display = "none";
                    }
                    else {
                        document.getElementById("inDiv").style.display = "block";
                    }
                }
            }
        </script>

    </form>
</body>
</html>
