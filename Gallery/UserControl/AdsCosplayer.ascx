<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdsCosplayer.ascx.cs" Inherits="Gallery.AdsCosplayer" %>

<style>
    .textOnImg {
        position: absolute; color: #404090; bottom: 40px; right: 40px; font-family: Elephant; font-style: italic; font-size: 60px;
    }
    .textLeft {
        left: 40px;
    }
    .btnOnImg {
        border: 3px solid white; color: white; font-size: 20px; background-color: transparent; padding: 12px; border-radius: 10px; position: absolute; bottom: 25px; right: 100px;
    }
    .btnLeft {
        left: 100px;
    }
    .btnOnImg:hover {
        border: none; color: black; background: white;
    }
    .outsider {
        min-width: 100%; position: relative; height: 250px; overflow: hidden;
    }
    .showUp {
        position: absolute; height: 400px; width: 0; z-index: 1; top: 0; left: 0; background: rgba(0,0,0,0.5); color: forestgreen; overflow: hidden; transition: width 1.5s;
    }
    .showLeft {
        right: 0; left: auto;
    }
    .outsider:hover .showUp {
        width: 100%; height: 100%;
    }
</style>

<div class="outsider">
    <div class="slideImage"><img id="image" runat="server" src="../Images/vocaloid_hatsune.jpg" style="width:100%;" /></div>
    <div class="textOnImg" id="imageTitle" runat="server"> Anime Miniature </div>
    <div class="showUp">
        <div style="padding: 40px; margin-right: 60px; text-align: right; color: white; font-style: italic; float: right;">
            <div id="imageDesc" runat="server" style="font-family: 'Times New Roman', Times, serif; font-size: 26px; overflow: hidden; height: 130px; min-width: 750px;" >
                Adourable, Breathtaking and Simply Masterpiece <br /><br />
                Wonder How Can You Just Bypass Them?
            </div>
            <asp:Button ID="btnImage" runat="server" PostBackUrl="~/Miniature.aspx" Text="Shop Now" CssClass="btnOnImg" />
        </div>
    </div>
</div>