<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Classes</title>
    <link rel="shortcut icon" href="favicon.png" type="image/x-icon">
    <!-- jquery cdn link  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- google fonts cdn link  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <!--  css file link  -->
    <link rel="stylesheet" href="Css/flive.css">
    <!-- <link rel="stylesheet" href="fpw.css"> -->
    <!--  js file link  -->
    <script src="Js/flive.js"></script>
    <!-- <script src="fpw.js"></script> -->
</head>
<body>
    
    
    <%
    
    String u=(String)session.getAttribute("uid");
         if(u==null)
         {
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }
    %>
<!-- header start -->
    <div class="container">
    <header>
        <div id="menu" class="fas fa-bars"></div>
        <a href="index.jsp" class="logo"><img src="images/logo.jpg" alt="not found"></a>
    
        <nav class="navbar">
           <h1>live classes</h1>
        </nav>
    
        <div id="back" class="fa fa-angle-double-left" style="font-size:36px;">
            <a href="Teacher.jsp">back to course</a>
        </div>
    </header>
    </div>
    <!-- header ends -->
    <!-- live section starts -->
    <div class="live">
        <div id="image">
            <img src="images/live.png" alt="">
        </div>
        <!-- live section ends -->
        <div class="link">
            <h1>host your live classes here</h1>
            <p ><a href="https://meet.google.com/?pli=1" target="blank">click here to create meet link &#128308;</a></p>
            <form action="fLiveAction" method="post">
                
                <input type="text" class="a2" placeholder="paste your meet link here" name="url">
                <input type="text" class="a1" placeholder="meeting title" name="title">
                <button id="btn" class="btn">host</button>
            </form>
           
            <!-- <iframe src="#steps" name="fram" height="30px" width="10%" title="Iframe Example"></iframe> -->
            <a href="#steps" id="step" onclick="toggleFunction()" >Dont't know to to host meet click here to know the steps</a>
            <i class="fa fa-exclamation-circle" style="font-size:1.5rem;color:red"></i>
            <div class="steps" id="steps">
                
                    <ol>
                        <li>
                            click "click here to create meet link &#128308;" to open google meet page
                        </li>
                        <li>
                            click New Meet button
                        </li>
                        <li>
                            click schedule in Google calender if you want to schedule meet weekly,
                            else click others options for recent meets
                        </li>
                        <li>
                            <li>[Schedule Meet] change doesn't repeat to every weekday</li>
                            <li>[Schedule Meet] Select Your  time of a class</li>
                            <li>Copy the link which is under the join with google meet  button</li>
                            <li>Save the changes</li>

                        </li>
                        <li>Copy the link</li>
                        <li>Go back to the live class page</li>
                        <li>Paste the link into the input box</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    
    <!-- footer section starts  -->

<div class="footer">

    <div class="box-container">

        <div class="box">
            <h3>branch locations</h3>
            <a href="#">Noida</a>
            <a href="#">Patna</a>
            <a href="#">Uttar Pradesh</a>
            <a href="#">Makanpur</a>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="vFront.html">home</a>
            <a href="#">faculty</a>
            <a href="#">about</a>
            <a href="#">contact</a>
        </div>

        <div class="box">
            <h3>contact info</h3>
            <p> <i class="fas fa-map-marker-alt"></i> noida, india 400104. </p>
            <p> <i class="fas fa-envelope"></i> example@gmail.com </p>
            <p> <i class="fas fa-phone"></i> +123-456-7890 </p>
        </div>

    </div>

    <h1 class="credit">created by <a href="#">mr/miss. DRK designer</a> all rights reserved. </h1>
</div>
<!-- footer section ends -->
</body>
</html>