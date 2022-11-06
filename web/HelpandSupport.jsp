<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Help and Support</title>
    <link href="Css/help1.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="Js/HandS.js"></script>
</head>

<body>
    <%
    String u=(String)session.getAttribute("uid");
         if(u==null)
         {
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }
    %>
    
    <div class="header ">
        <h2>How Can I Help You !<a href="student.jsp" class="logo"><img src="images/logo.jpg" width="20%"></a></h2>
    </div>

    <div class="top">

        <div class="pic">
            <img src="images/SS1.jpg" alt="Loading image" class="" width="100%" height="300px">
        </div>

        <div class="main">

            <div class="disp">
                <img src="images/support.jpg" alt="Loading..." width="100%" height="150px">
                <!-- <a href="#">Help & Support</a> -->
                <hr>
                <p class="faq">  Commonly Asked. </p>
            </div>

            <div class="bod">
                <h4 style="text-align: center;">Help and Support</h4>
                Quest: How to Change Profile Details ? <img src="images/down.png" class="down">


                <ul style="list-style-type: circle;" class="myul">
                    Ans: Follow these steps:-
                    <li>Go to Student Dash Board</li>
                    <li> Click on Profile Button</li>
                    <li>Click on Edit Details </li>
                    <li>Now you can Update your Details</li>
                </ul>
            </div>

            <div class="join">
                Quest: How to Join Live Classes? <img src="images/down.png" id="joinQue">


                <ul style="list-style-type: circle;" class="joinul">
                    Ans: Follow these steps:-
                    <li>Go to Student Dash Board</li>
                    <li> Click on Live Class Button</li>
                    <li>Now you are on Live Class Pages</li>
                    <li> There you can Join Class</li>
                </ul>



            </div>


            <div class="nxtque">
                Quest: How to Access Notes,Books and Session? <img src="images/down.png" id="nxtQ1">


                <ul style="list-style-type: circle;" class="nxtul">
                    Ans: Follow these steps:-
                    <li>Go to Student Dash Board</li>
                    <li>Click On Digital Library</li>
                    <li>Click on the Notes/Videos/Books and you can access it. </li>
                </ul>

            </div>

        </div>
    </div>


    <div class="main">
        <div class="secondM">

            <div class="dis ">
                <img src="images/AnyQuestion.jpg" alt="Loading..." width="100%" height="150px">
                <hr>
                 <p class="faq">Asked Question's</p> 
            </div>
            <div class="cont">

                <!-- <h4 style="text-align: center;">Any Questions </h4> -->
                Ques:Can I Download the Study Material ? <img src="images/down.png" id="disque">

                <ul style="list-style-type: circle;" class="disul">
                 
                    Ans:
                    
                    <li>Yes, You can Access Notes/Videos/Books and You Can also Download it.</li>
                    
                </ul>
                    
                      
            </div>
            <div class="disques2">
                Ques:How I can get my Password? <img src="images/down.png" id="disques">
                <ul  style="list-style-type: disc;"class="disquesul">
                    
                    Ans:  
                      <li>  You can get your Password along with User Name on Your Mail Id that is Provided by You..
                      </li>


                </ul>

            </div>

            
            <div class="disques3">
                Ques:How to  Upload the Assignments? <img src="images/down.png" id="disque3">
                
                <ul  style="list-style-type: disc;"class="disqueul3">
                    
                    Ans:- Follow these Steps: 
                      <li>Go to Teacher Dash Board</li>
                      <li>Click on Assignment Button</li>
                      <li>Then After that Click on Upload Assignment. </li>

                </ul>

            </div>
        </div>
    </div>

  
 <div class="main">
        <div class="thirdM">
        
             <div class="cont2">

                <h4 style="text-align: center; font-size: 28px;">Any Query You Want to Ask ? </h4>
                <form action="HelpAction" method="post" class="fom">
         
             <div id="txtar"> 
                 
                 <textarea rows="6" cols="150" name="txtarea" id="txta" placeholder="Enter your Query Here. " required="true" ></textarea>
            
                    
                    <input type="submit" class="btn" value="Send" onclick='clic()'>  
                </div>
                    <p style="color:black; font-weight: bold ">Note: 
                     Please Write Query Before Clicking the Send Button... </p>
                </form>

            </div>

        </div>
    </div>






    <div class="footer">

        <div class="box-container">

            <div class="box">
                <h3>branch locations</h3>
                <a href="#">Noida</a>
                <a href="#">Patna</a>
                <a href="#">Mayur Vihar Phase-3</a>
                <a href="#">Nyay Khand</a>
            </div>

            <div class="box" style="text-transform: capitalize">
                <h3>quick links</h3>
                <a href="#home">home</a>
                <a href="#faculty">faculty</a>
                <a href="#about">about</a>
                <a href="#contact">contact</a>
            </div>

            <div class="box" style="text-transform: capitalize">
                <h3>contact info</h3>
                <p> <i class="fas fa-map-marker-alt"></i> noida, india 400104. </p>
                <p style="text-transform: lowercase"> <i class="fas fa-envelope"></i> kaksha17820virtual@gmail.com </p>
                <p> <i class="fas fa-phone"></i> +91 7217697611 </p>
            </div>

        </div>

        <h1 class="credit" style="text-transform: capitalize">created by <a href="#" >mr/miss. DKRP designer</a> all rights reserved. </h1> -->
    </div>

</body>

</html>