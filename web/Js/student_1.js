// Side bar scroling javascript

function baractivefuntion() {
    let sidebarbtn = document.querySelector("#btn");
    let sidebar = document.querySelector(".sidebar");
    let searchbtn = document.querySelector(".bx-search-alt-2");

    sidebar.classList.toggle("active");
    console.log("Clicked");
}

function searchactive() {
    let sidebarbtn1 = document.querySelector("#btn");
    let sidebar1 = document.querySelector(".sidebar");
    let searchbtn1 = document.querySelector(".bx-search-alt-2");

    sidebar1.classList.toggle("active");
    console.log("Clicked");
}