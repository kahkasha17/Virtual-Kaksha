$(document).ready(function () 
{
    $(".stdnav-ul-li2").hide();
    $("#btn1").click(function()
    {
        $(".stdnav-ul-li2").toggle();
        $(".bx-down-arrow").toggleClass("bx-up-arrow");
    });

    $("#bookbtn").click(function () {
       $("#bookbtn").css({"background-color":"white","color":"rgb(0, 0, 24)","font-size":"160%"});
       $("#notebtn").css({"background-color":"rgb(0, 0, 24)","color":"white","font-size":"140%"});
       $("#vidbtn").css({"background-color":"rgb(0, 0, 24)","color":"white","font-size":"140%"});
       $(".booklist").show();
       $(".notelist").hide();
       $(".vidlist").hide();
    });
    $("#notebtn").click(function () {
      $("#notebtn").css({"background-color":"white","color":"rgb(0, 0, 24)","font-size":"160%"});

      $("#bookbtn").css({"background-color":"rgb(0, 0, 24)","color":"white","font-size":"140%"});
      $("#vidbtn").css({"background-color":"rgb(0, 0, 24)","color":"white","font-size":"140%"});
       $(".notelist").show();
       $(".booklist").hide();
       $(".vidlist").hide();
    });
    $("#vidbtn").click(function () {
      $("#vidbtn").css({"background-color":"white","color":"rgb(0, 0, 24)","font-size":"160%"});
      
      $("#notebtn").css({"background-color":"rgb(0, 0, 24)","color":"white","font-size":"140%"});
      $("#bookbtn").css({"background-color":"rgb(0, 0, 24)","color":"white","font-size":"140%"});
       $(".vidlist").show();
       $(".notelist").hide();
       $(".booklist").hide();
    });
});