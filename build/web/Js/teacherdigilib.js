$(document).ready(function () 
{
    $(".stdnav-ul-li2").hide();
    $("#btn1").click(function()
    {
        $(".stdnav-ul-li2").toggle();
        $(".bx-down-arrow").toggleClass("bx-up-arrow");
    });
    
    $("#notebtn2").click(function () {
        if($(".box5").hasClass("new-box5"))
        {
            $(".box5").removeClass("new-box5");
            $(".box4").toggleClass("new-box4");
        }
        else
        {
        $(".mainpage").toggleClass("new-mainpage");
     $(".box1").toggleClass("new-box1");
  $(".box2").toggleClass("new-box2");
  $(".box3").toggleClass("new-box3");
          $(".box4").toggleClass("new-box4");	
          
          $(".box7").toggleClass("new-box7");	

        }
        
        if($(".box6").hasClass("new-box6"))
        {
          $(".box6").removeClass("new-box6");
          $(".maindiv").toggleClass("new-maindiv");
         $(".mainpage").toggleClass("new-mainpage");
         $(".box1").toggleClass("new-box1");
      $(".box2").toggleClass("new-box2");
      $(".box3").toggleClass("new-box3");
      $(".box7").toggleClass("new-box7");	
      $(".box4").addClass("new-box4");
        }
     });
     
     $("#bookbtn2").click(function () {
        if($(".box4").hasClass("new-box4"))
        {
            $(".box4").removeClass("new-box4");
            $(".box5").toggleClass("new-box5");
        }
        else
        {
        $(".mainpage").toggleClass("new-mainpage");
        $(".box1").toggleClass("new-box1");
        $(".box2").toggleClass("new-box2");
        $(".box3").toggleClass("new-box3");
        $(".box7").toggleClass("new-box7");	 
        $(".box5").toggleClass("new-box5");
        }

        if($(".box6").hasClass("new-box6"))
        {
          $(".box6").removeClass("new-box6");
          $(".mainpage").toggleClass("new-mainpage");
 $(".box1").toggleClass("new-box1");
 $(".box2").toggleClass("new-box2");
 $(".box3").toggleClass("new-box3");
 $(".box7").toggleClass("new-box7");	
           $(".box5").addClass("new-box5");
        }
     });
     $("#vidbtn2").click(function () {
        if($(".box4").hasClass("new-box4"))
        {
            $(".box4").removeClass("new-box4");
            $(".box6").toggleClass("new-box6");
        }
        else
        {
  
$(".mainpage").toggleClass("new-mainpage");
$(".box1").toggleClass("new-box1");
$(".box2").toggleClass("new-box2");
$(".box3").toggleClass("new-box3");
$(".box7").toggleClass("new-box7");
        $(".box6").toggleClass("new-box6");
        }

        if($(".box5").hasClass("new-box5"))
        {
$(".mainpage").toggleClass("new-mainpage");
 $(".box1").toggleClass("new-box1");
 $(".box2").toggleClass("new-box2");
 $(".box3").toggleClass("new-box3");
 $(".box7").toggleClass("new-box7");	
          $(".box5").removeClass("new-box5");
           $(".box6").addClass("new-box6");
        }
     });
});