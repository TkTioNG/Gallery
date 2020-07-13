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