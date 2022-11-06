$(document).ready(function() {

//    document.getElementById("#icon1");

   $("#myicon2").click(function () {
    
    $(".mainDet").toggleClass("new-student");

   });
   $("#icon1").click(function () {
    
    $(".mainDet").toggleClass("new-student");

   });

  $("#Student_Show").click(function () {
  
   $(".stud_det").toggleClass("student_disp");     
  $(".butn").toggleClass("btnclick");

  });

  $("#Teach_Det").click(function () {
  
   $(".teach_det").toggleClass("teach_disp");  

  });

  $("#Contact_Det").click(function () {
  
   $(".contact_det").toggleClass("contact_disp");  

  });


  
  $("#Assign_Det").click(function () {
  
   $(".assign_det").toggleClass("assign_disp");  

  });
  
  $("#Has_Det").click(function () {
       $(".has_det").toggleClass("has_disp"); 
    });
  
  
  $("#Book_Det").click(function () {
  
   $(".book_det").toggleClass("book_disp");  

  });


  $("#Notes_Det").click(function () {
  
   $(".notes_det").toggleClass("notes_disp");  

  });


  $("#Videos_Det").click(function () {
  
   $(".videos_det").toggleClass("videos_disp");  
  
  });

$("button").click(function () {
  
  $("button").toggleClass("btnclick");
});


  
});







