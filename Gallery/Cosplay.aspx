<%@ Page Title="Cosplay" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="Cosplay.aspx.cs" Inherits="Gallery.Cosplay1" %>

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
        <!-- Site Map Path End -->

        <!-- Main Content Start -->
        <div>
            <Ads:Cosplayer runat="server" ID="Ads" />

            <div style="width: 100%; position: relative; text-align: center; margin-top: 10px; margin-bottom: 10px; color: darkslategrey;">
                <br />
                There is a total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                product(s) is/are currently on sale.
                    <br />
                Filter by : &nbsp;
                    <asp:DropDownList ID="ddlFilter" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="cosplay">All</asp:ListItem>
                        <asp:ListItem Value="cosplay male">Male Costume</asp:ListItem>
                        <asp:ListItem Value="cosplay female">Female Costume</asp:ListItem>
                        <asp:ListItem Value="anime">Anime Style</asp:ListItem>
                        <asp:ListItem Value="europe">Europe Style</asp:ListItem>
                    </asp:DropDownList>
            </div>

            <div class="styleView">
                <div class="styleViewType" style="border-right: 1px solid black;" onclick="changeGridView()"><span><i class="fas fa-th-large" style="font-size: 13px;">&nbsp;</i>Grid View</span></div>
                <div class="styleViewType" onclick="changeDetailsView()"><span><i class="fas fa-list" style="font-size: 13px;">&nbsp;</i>Details View</span></div>
            </div>

            <div style="width: 1251px; margin-left: auto; margin-right: auto; left: 0; right: 0;">
                <asp:Repeater ID="RepeaterNew" runat="server" DataSourceID="SqlDataSource1">
                    <itemtemplate>
                            <div id="detailsView" class="detailsView" style="width: 95%; border-bottom: 2px solid gray; padding-top: 25px; margin-left: 2.5%; min-height: 300px; display: none;">
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
                        </itemtemplate>
                </asp:Repeater>
            </div>

            <div style="clear: both;">
                <br />
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P.ProductID, P.ProductName, P.SalerID, P.Image, P.Stock, P.Sales, P.CategoryID, P.Description, P.Price, U.UserName, C.CategoryName FROM Product AS P INNER JOIN Users AS U ON P.SalerID = U.UserID INNER JOIN Category AS C ON P.CategoryID = C.CategoryId WHERE (C.CategoryName LIKE '%cosplay%') ORDER BY P.ProductID DESC"></asp:SqlDataSource>
        </div>
        <!-- Main Content End -->
    </div>
    <!-- Body Content End -->
</asp:Content>
