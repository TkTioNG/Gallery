<%@ Page Title="Homepage" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Gallery.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Body Content Start -->
    <div id="body">
        <!-- Site Map Path Start -->
        <div style="margin: 0 0 0 30px; padding-top: 15px;">
            <asp:SiteMapPath ID="SiteMapPath2" runat="server" Font-Names="Verdana" Font-Size="0.8em" PathSeparator=" &gt;">
                <CurrentNodeStyle ForeColor="#333333" />
                <NodeStyle Font-Bold="True" ForeColor="#7C6F57" />
                <PathSeparatorStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <RootNodeStyle Font-Bold="True" ForeColor="#5D7B9D" />
            </asp:SiteMapPath>
        </div>
        <!-- Site Map Path End -->

        <!-- Main Content Start -->
        <div>
            <!-- Slideshow Container Start -->
            <div class="slideshow-container" onload="showSlidesAuto()">

                <!-- Full-width images with number and caption text -->
                <div class="mySlides fade" onmouseover="hangAutoSlide()" onmouseout="contAutoSlide()">
                    <div class="numbertext">1 / 3</div>
                    <div class="slideImage">
                        <img src="Images/kaori_miyazono.jpg" style="width: 100%" />
                    </div>
                    <div class="text">Beware   .  .  .   The   Beauty   Of   Cosplaying   .  .  .</div>
                </div>

                <div class="mySlides fade" onmouseover="hangAutoSlide()" onmouseout="contAutoSlide()">
                    <div class="numbertext">2 / 3</div>
                    <div class="slideImage">
                        <img src="Images/rwby_blake.jpg" style="width: 100%" />
                    </div>
                    <div class="text">Fabulous   Cosplay   Costume   New   In   Town</div>
                </div>

                <div class="mySlides fade" onmouseover="hangAutoSlide()" onmouseout="contAutoSlide()">
                    <div class="numbertext">3 / 3</div>
                    <div class="slideImage">
                        <img src="Images/vocaloid_hatsune.jpg" style="width: 100%;" />
                    </div>
                    <div class="text">Lastest   Miniature   Collection .   .   .   Purely   Masterpiece</div>
                </div>

                <!-- Next and previous buttons -->
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <!-- Slideshow Container End -->

            <!-- The dots/circles for Slideshow Start -->
            <div style="text-align: center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>
            <!-- The dots/circles for Slideshow End -->

            <!-- Three column row start -->
            <div style="text-align: center; border-bottom: 3px solid darkslategrey; margin-top: 20px; color: darkred; font-size: 28px;">*** &emsp; YOU MUST NOT MISS *** &emsp; </div>

            <div class="three-row" style="height: 300px; overflow: hidden;">
                <div class="row-column">
                    <img src="Images/squeni.jpg" style="height: 270px; margin-top: 15px; margin-left: 10px; float: left;" />
                    <div style="float: right; width: 200px; padding: 10px; height: 280px; margin-top: 10px;">
                        Latest Square Enix PVC Figure !!<br />
                        <br />
                        Fantastics time !!
                            <br />
                        <br />
                        Start from RM 39.00 **
                            <br />
                        <br />
                        Best price in town
                            <br />
                        <br />
                        Come and buy now!!
                            <br />
                        <asp:Button ID="Button7" runat="server" PostBackUrl="~/Miniature.aspx?filter=pvc" Text="Go Now!" CssClass="ctrlButton" />
                    </div>
                </div>
                <div class="row-column">
                    <img src="Images/figma.jpg" style="height: 270px; margin-top: 15px; margin-left: 10px; float: left;" />
                    <div style="float: right; width: 200px; padding: 10px; height: 280px; margin-top: 10px;">
                        Latest Square Enix PVC Figure !!<br />
                        <br />
                        Fantastics time !!
                            <br />
                        <br />
                        Start from RM 39.00 **
                            <br />
                        <br />
                        Best price in town
                            <br />
                        <br />
                        Come and buy now!!
                            <br />
                        <asp:Button ID="Button8" runat="server" PostBackUrl="~/Miniature.aspx?filter=nendoroid" Text="Go Now!" CssClass="ctrlButton" />
                    </div>
                </div>
                <div class="row-column">
                    <img src="Images/nendoro.jpg" style="height: 270px; margin-top: 15px; margin-left: 10px; float: left;" />
                    <div id="testing" style="float: right; width: 200px; padding: 10px; height: 280px; margin-top: 10px;">
                        Latest Square Enix PVC Figure !!<br />
                        <br />
                        Fantastics time !!
                            <br />
                        <br />
                        Start from RM 39.00 **
                            <br />
                        <br />
                        Best price in town
                            <br />
                        <br />
                        Come and buy now!!
                            <br />
                        <asp:Button ID="Button9" runat="server" PostBackUrl="~/Miniature.aspx?filter=gundam" Text="Go Now!" CssClass="ctrlButton" />
                    </div>
                </div>
            </div>

            <div style="text-align: center; border-bottom: 3px solid darkslategrey; margin-top: 20px; color: darkred; font-size: 28px;">*** &emsp; YOU MUST NOT MISS *** &emsp; </div>
            <div class="outsider" style="">
                <div class="slideImage">
                    <img src="Images/kaori_miyazono.jpg" style="width: 100%" />
                </div>
                <div class="textOnImg">Cosplay Gallery </div>
                <div class="showUp">
                    <div style="padding: 40px; margin-right: 60px; text-align: right; color: white; font-style: italic; float: right;">
                        <div style="font-family: Elephant; font-size: 60px; height: 75px; overflow: hidden; min-width: 750px;">Cosplay Gallery</div>
                        <div style="font-family: 'Times New Roman', Times, serif; font-size: 26px; overflow: hidden; height: 130px; min-width: 750px; margin-top: 30px;">
                            View Cosplayer's Lastest Collection
                                <br />
                            <br />
                            Behold ... of Their Beauty.
                        </div>
                        <asp:Button ID="Button10" runat="server" PostBackUrl="~/Gallery.aspx" Text="View Gallery" CssClass="btnOnImg" />
                    </div>
                </div>
            </div>

            <div class="outsider">
                <div class="slideImage">
                    <img src="Images/rwby_blake.jpg" style="width: 100%" />
                </div>
                <div class="textOnImg textLeft">Cosplay Costume & Accessory </div>
                <div class="showUp showLeft">
                    <div style="padding: 40px; margin-left: 60px; text-align: left; color: white; font-style: italic;">
                        <div style="font-family: Elephant; font-size: 60px; height: 75px; overflow: hidden; min-width: 750px;">Cosplay Custom Shop</div>
                        <div style="font-family: 'Times New Roman', Times, serif; font-size: 26px; overflow: hidden; height: 130px; min-width: 750px; margin-top: 30px;">
                            Shop On Fabulous Cosplay Costume & Accessory
                                <br />
                            <br />
                            There must be somthing fall to youe eye.
                        </div>
                        <asp:Button ID="Button11" runat="server" PostBackUrl="~/Cosplay.aspx" Text="Shop Custom" CssClass="btnOnImg btnLeft" />
                    </div>
                </div>
            </div>

            <div class="outsider">
                <div class="slideImage">
                    <img src="Images/vocaloid_hatsune.jpg" style="width: 100%;" />
                </div>
                <div class="textOnImg">Anime Miniature </div>
                <div class="showUp">
                    <div style="padding: 40px; margin-right: 60px; text-align: right; color: white; font-style: italic; float: right;">
                        <div style="font-family: Elephant; font-size: 60px; height: 75px; overflow: hidden; min-width: 750px;">Anime Miniature</div>
                        <div style="font-family: 'Times New Roman', Times, serif; font-size: 26px; overflow: hidden; height: 130px; min-width: 750px; margin-top: 30px;">
                            Adorable, Breathtaking and Simply Masterpiece
                                <br />
                            <br />
                            Wonder How Can You Just Bypass Them?
                        </div>
                        <asp:Button ID="Button12" runat="server" PostBackUrl="~/Miniature.aspx" Text="Shop Miniature" CssClass="btnOnImg" />
                    </div>
                </div>
            </div>
        </div>

        <style>
            .textOnImg {
                position: absolute;
                color: #404090;
                bottom: 40px;
                right: 40px;
                font-family: Elephant;
                font-style: italic;
                font-size: 60px;
            }

            .textLeft {
                left: 40px;
            }

            .btnOnImg {
                border: 3px solid white;
                color: white;
                font-size: 26px;
                background-color: transparent;
                padding: 12px;
                border-radius: 10px;
                position: absolute;
                bottom: 45px;
                right: 100px;
            }

            .btnLeft {
                left: 100px;
            }

            .btnOnImg:hover {
                border: none;
                color: black;
                background: white;
            }

            .outsider {
                min-width: 100%;
                position: relative;
                height: 400px;
            }

            .showUp {
                position: absolute;
                height: 400px;
                width: 0;
                z-index: 1;
                top: 0;
                left: 0;
                background: rgba(0,0,0,0.5);
                color: forestgreen;
                overflow: hidden;
                transition: width 1.5s;
            }

            .showLeft {
                right: 0;
                left: auto;
            }

            .outsider:hover .showUp {
                width: 100%;
            }
        </style>

        <!-- Three column row End -->
    </div>

    <!-- Slideshow Script Start -->
    <script>
        var slideIndex = 0;
        var timeOut;
        showSlidesAuto();

        function plusSlides(n) {
            showSlides(slideIndex += n);
            resetAutoSlide()
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
            resetAutoSlide()
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }

        function resetAutoSlide() {
            clearTimeout(timeOut);
            timeOut = setTimeout(showSlidesAuto, 6000);
        }

        function hangAutoSlide() {
            clearTimeout(timeOut);
        }

        function contAutoSlide() {
            clearTimeout(timeOut);
            timeOut = setTimeout(showSlidesAuto, 1200);
        }

        function showSlidesAuto() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            timeOut = setTimeout(showSlidesAuto, 2000); // Change image every 2 seconds
        }
    </script>
    <!-- Slideshow Script End -->
    <!-- Main Content End -->

    <!-- Body Content End -->
</asp:Content>
