$(document).ready(function(){
    $(".down").click(function () {
        $(".myul").toggle();
        $(".bod").toggleClass("new-bod");
        $(".join").toggleClass("new-join");
        $(".nxtque").toggleClass("nxtAgain");
    });

    $("#joinQue").click(function () {
        $(".joinul").toggle();
        $(".join").toggleClass("new-jin");
        $(".bod").toggleClass("new-nxtque");
        $(".nxtque").toggleClass("bodnxt");
    });

    $("#nxtQ1").click(function () {
        $(".nxtul").toggle();
      //$(".nxtque").toggleClass("new-jin");
        $(".bod").toggleClass("bodnxt");
        $(".join").toggleClass("joinxt");
        $(".nxtque").toggleClass("new-nxt2");
    });
    
    $("#disque").click(function () {
       $(".disul").toggle();
       $(".cont").toggleClass("disc");
       $(".disques2").toggleClass("disqu1");
       $(".disques3").toggleClass("disq1");
    });

    $("#disques").click(function () {
        $(".disquesul").toggle();
        $(".disques2").toggleClass("disqu");
        $(".cont").toggleClass("disqu2");
        $(".disques3").toggleClass("dispqu");
    });
    $("#disque3").click(function () {
       $(".disqueul3").toggle();
       $(".disques2").toggleClass("disq3");
       $(".cont").toggleClass("disqu2");
        
    });
    $(".btn").click(function () { 
      window.alert(" We Recieved Your Query. We Will Revert you As Soon As Possible "); 
    });

});


