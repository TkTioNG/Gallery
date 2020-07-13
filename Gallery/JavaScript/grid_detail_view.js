
function changeGridView() {
    var detailsView = document.getElementsByClassName("detailsView");
    var gridView = document.getElementsByClassName("gridView");
    for (var i = 0; i < gridView.length; i++) {
        gridView[i].style.display = "block";
        detailsView[i].style.display = "none";
    }
}
function changeDetailsView() {
    var detailsView = document.getElementsByClassName("detailsView");
    var gridView = document.getElementsByClassName("gridView");
    for (var i = 0; i < gridView.length; i++) {
        gridView[i].style.display = "none";
        detailsView[i].style.display = "block";
    }
}