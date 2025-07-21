// function step()
// {
//     var a=document.getElementsByClassId("step");
//     var b=document.getElementsByClassName("steps")
    
//         b.style.display="block";
    
// }
function toggleFunction(){
    var toggle = document.getElementById("steps");
    if (toggle.style.display === "none")
     {
      toggle.style.display ="block";
    } else {
      toggle.style.display ="none";
    } 
  }
  function myFunction() {
    /* Get the text field */
    var copyText = document.getElementById("myInput");
  
    /* Select the text field */
    copyText.select();
    copyText.setSelectionRange(0, 99999); /* For mobile devices */
  
    /* Copy the text inside the text field */
    navigator.clipboard.writeText(copyText.value);
    
    /* Alert the copied text */
    alert("Copied the text: " + copyText.value);
  }
  function live()
  {
    var copyText = document.getElementById("myInput");
    copyText.select();
    copyText.setSelectionRange(0, 99999); /* For mobile devices */
  }
  