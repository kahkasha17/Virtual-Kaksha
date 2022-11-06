function start()
{
  var b=document.getElementById("container");
  b.style.visibility="hidden"

}
function showing() {
    var element = document.getElementById("container");
    element.style.visibility="visible";
 }
 function cross()
 {
     
         var a = document.getElementById("container");
           a.style.display = "none";
 }
 function toggleFunction()
    {
    var toggle = document.getElementById("login-form");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
    } 
  }