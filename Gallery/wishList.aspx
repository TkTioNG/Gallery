<%@ Page Title="Wishing List" MasterPageFile="~/Site1.Master" Language="C#" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="Gallery.WishList" %>

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
        <!-- Site Map Path End -->

        <!-- Main Content Start -->
        <div id="mainContent" runat="server">
            <Log:Current runat="server" />
            <br />

            <div style="width: 100%; position: relative; text-align: center; margin-top: 10px; margin-bottom: 10px; color: darkslategrey;">
                You have a total of
                    <asp:Label ID="lblListCountNew" runat="server" Text="[lblListCountNew]"></asp:Label>
                product(s) is/are currently on sale.
            </div>

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
                                            <asp:Label runat="server" ID="lblProductName" Style="color: #404090; font-size: 28px;" Text='<%# Eval("ProductName") %>'></asp:Label></a></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="lblSalerName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 50%; max-width: 50%;">Stock &emsp;&emsp;&emsp;&ensp;:&ensp;
                                                <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label></td>
                                        <td style="width: 50%; max-width: 50%;">Sales &emsp;&emsp;&emsp;&ensp;:&ensp;
                                                <asp:Label ID="lblSales" runat="server" Text='<%# Eval("Sales") %>'></asp:Label></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 50%; max-width: 50%;">Category &emsp;&emsp;:&ensp;
                                                <asp:Label ID="lblCat" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                        </td>
                                        <td style="width: 50%; max-width: 50%;">Price &emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;:&ensp; RM&nbsp;<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td rowspan="2" colspan="2"><span style="vertical-align: top;">Description &emsp;: &nbsp;</span>
                                            <asp:Label ID="lblDesc" runat="server" Height="80px" BorderStyle="Solid" Width="82%" BorderColor="Silver" BorderWidth="1px" Text='<%# Eval("Description") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div style="clear: both; margin-bottom: 25px; text-align: center;">
                            <div style="display: inline-block; margin-top: 20px;">
                                <asp:Button ID="btnEdit" CssClass="ctrlButton" Text="Add to Cart" runat="server" OnClick="OnEdit" />
                                <asp:Button ID="btnDelete" CssClass="ctrlButton" Text="Remove" runat="server" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row from wishing list?');" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- Main Content End -->

        <Err:Login ID="plsLogin" runat="server" Visible="false" />
    </div>
    <!-- Body Content End -->
</asp:Content>
