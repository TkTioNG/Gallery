<%@ Page Title="My Product" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="Gallery.New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <contenttemplate>
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

                    <!-- Main Content Start -->
                    <div>
                        <div style="width: 100%; position: relative; text-align: center; margin-top: 10px; margin-bottom: 10px; color: darkslategrey;">
                            You have a total of
                            <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                            product(s) is/are currently on sale.
                        </div>

                        <asp:Button ID="btnInsert1" runat="server" Text="Add New Product" CssClass="insertBtn btnInsert1" OnClick="BtnInsertNew_Click" />

                        <asp:DropDownList ID="ddlMaxProdID" runat="server" DataSourceID="SqlDataSource1" Visible="false" DataTextField="ProductID" DataValueField="ProductID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductID] FROM [NewData]"></asp:SqlDataSource>
                        <asp:Label ID="lblMaxProdID" runat="server" Visible="false"></asp:Label>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]"></asp:SqlDataSource>

                        <asp:Repeater ID="RepeaterNew" runat="server">
                            <ItemTemplate>
                                <div style="width: 95%; border-bottom: 2px solid gray; padding-top: 25px; margin-left: 2.5%; min-height: 300px;">
                                    <div style="width: 100%; min-height: 220px;">
                                        <div style="display: inline-block; position: relative; width: 30%; min-width: 200px; max-width: 30%; padding: 10px; min-height: 180px;">
                                            <a href='<%# "GalleryDetails.aspx?productID=" + Eval("ProductID") %>' title='<%# Eval("ProductName") %>' runat="server">
                                                <asp:Image ID="imageField" runat="server" ImageUrl='<%# Eval("Image") %>' Style="position: absolute; vertical-align: middle; min-height: 180px; max-height: 220px; max-width: 360px; left: 0; right: 0; margin: auto;" />
                                            </a>
                                        </div>

                                        <div style="float: right; display: inline-block; width: 68%; min-width: 320px; min-height: 180px; padding-left: 20px; padding-right: 5px; margin-top: 10px;">
                                            <asp:Label ID="lblProductID" runat="server" Visible="false" Text='<%# Eval("ProductID") %>'></asp:Label>
                                            <table style="width: 100%; vertical-align: middle; line-height: 30px;">
                                                <tr>
                                                    <td colspan="2"><a href='<%# "GalleryDetails.aspx?productID=" + Eval("ProductID") %>' title='<%# Eval("ProductName") %>' runat="server">
                                                        <asp:Label runat="server" ID="lblProductNameNew" CssClass="lblTitleLink" Style="color: #404090; font-size: 28px;" Text='<%# Eval("ProductName") %>'></asp:Label></a>
                                                        <asp:TextBox ID="txtProductNameNew" runat="server" Width="97.5%" Visible="false" Text='<%# Eval("ProductName") %>'></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="lblSalerNameNew" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 50%; max-width: 50%;">Stock &emsp;&emsp;&emsp;&ensp;:&ensp;<asp:Label ID="lblStockNew" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                                                        <asp:TextBox ID="txtStockNew" runat="server" CssClass="editable" TextMode="Number" Visible="false" Text='<%# Eval("Stock") %>'></asp:TextBox></td>
                                                    <td style="width: 50%; max-width: 50%;">Sales &emsp;&emsp;&emsp;&ensp;:&ensp;
                                                        <asp:Label ID="lblSalesNew" runat="server" Text='<%# Eval("Sales") %>'></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 50%; max-width: 50%;">Category &emsp;&emsp;:&ensp;
                                                        <asp:Label ID="lblCatNew" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                                        <asp:DropDownList ID="ddlCatNew" CssClass="editable" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryID" Visible="false" runat="server"></asp:DropDownList></td>
                                                    <td style="width: 50%; max-width: 50%;">Price &emsp;&emsp;&emsp;&ensp;:&ensp; RM&nbsp;<asp:Label ID="lblPriceNew" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                        <asp:TextBox ID="txtPriceNew" runat="server" CssClass="editable" TextMode="Number" Visible="false" Text='<%# Eval("Price") %>'></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td rowspan="2" colspan="2"><span style="vertical-align: top;">Description &emsp;: &nbsp;</span>
                                                        <asp:Label ID="lblDescNew" runat="server" Height="80px" BorderStyle="Solid" Width="82%" BorderColor="Silver" BorderWidth="1px" Text='<%# Eval("Description") %>'></asp:Label>
                                                        <asp:TextBox ID="txtDescNew" runat="server" Height="80px" BorderStyle="Solid" Width="82%" BorderColor="Silver" BorderWidth="1px" Visible="false" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                    <div style="clear: both; margin-bottom: 25px; text-align: center;">
                                        <div style="display: inline-block; margin-top: 20px;">
                                            <asp:Button ID="btnEdit" CssClass="ctrlButton" Text="Edit" runat="server" OnClick="OnEdit" />
                                            <asp:Button ID="btnUpdate" CssClass="ctrlButton" Text="Update" runat="server" Visible="false" OnClick="OnUpdate" />
                                            <asp:Button ID="btnCancel" CssClass="ctrlButton" Text="Cancel" runat="server" Visible="false" OnClick="OnCancel" />
                                            <asp:Button ID="btnDelete" CssClass="ctrlButton" Text="Delete" runat="server" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!--- <asp:SqlDataSource ID="SqlDataSourceNew1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource> --->
                    </div>

                    <div style="width: 100%; text-align: center; margin-top: 40px;">
                        <asp:Button ID="btnInsert2" runat="server" Text="Add New Product" class="insertBtn" OnClick="BtnInsertNew_Click" />
                    </div>

                    <asp:Label ID="lblStatus" runat="server" Style="display: none" Text="false"></asp:Label>

                    <!-- Main Content End -->
                </div>
                <!-- Body Content End -->
            </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
