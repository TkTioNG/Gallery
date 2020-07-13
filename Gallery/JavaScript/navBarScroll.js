// When the user scrolls the page, execute myFunction
window.onscroll = function () { stickNavBar() };

// Get the offset position of the navbar
//var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function stickNavBar() {
    // Get the navbar
    var navbar = document.getElementById("stickyNavBar");

    if (window.pageYOffset > 228) {
        navbar.classList.add("stickyNav")
        //document.getElementById("testing").textContent = window.pageYOffset;
    } else {
        navbar.classList.remove("stickyNav");
    }
}