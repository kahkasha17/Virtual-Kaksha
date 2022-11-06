<%@page import="mypkg.Admin"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SLive Classes</title>
    <link rel="shortcut icon" href="favicon.png" type="image/x-icon">
    <!-- jquery cdn link  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- google fonts cdn link  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <!--  css file link  -->
    <link rel="stylesheet" href="Css/slive.css">
    <!--  js file link  -->
    <script src="Js/flive.js"></script>
    <!-- <script src="fpw.js"></script> -->
</head>
<body>
<!-- header start -->

<%
        String u=(String)session.getAttribute("uid");
      String n=(String)session.getAttribute("name");
      if(u==null)
            {
                
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
    %>


    <div class="container">
    <header>
        <div id="menu" class="fas fa-bars"></div>
        <a href="index.jsp" class="logo"><img src="images/logo.jpg" alt="not found"></a>
    
        <nav class="navbar">
           <h1>live classes</h1>
        </nav>
    
        <div id="back" class="fa fa-angle-double-left" style="font-size:36px;">
            <a href="student.jsp">back to course</a>
        </div>
    </header>
    </div>
    <!-- header ends -->
    <!-- live section starts -->
    <div class="live">
        <div id="image">
            <img src="images/slive.png" alt="">
        </div>
        <!-- live section ends -->
        <div class="link">
            <h1>connect your live classes here</h1>
             <form action="joinMeetAction" method="post">
                <%
                    try
                      {
                         String course=(String)session.getAttribute("course");
                         ResultSet rs=Admin.joinLive(course);
                         System.out.println("Live classes online2");
                         if(rs.next()==false)
                         {
                         
                            System.out.println("Live classes online5");
              
                            
                                       
                  %>
                <span><h2>No Meet Active</h2></span>  
                
                
                <%} else{
                   System.out.println("Live classes online9");
                   do
                            { 
                                System.out.println("Live classes online4");
                                String url=(String)rs.getString(2);
                                
                                   Admin.delLive(course);
                                   
                                   
                %>  

                
                
                <span><h2><%out.println(rs.getString(1));%></h2></span>
                <input type="text" class="a2" value=<%out.println(rs.getString(2));%> id="myInput" placeholder="No Meet Active" ><i class="fa fa-copy" style="font-size:30px;" onclick="myFunction()"></i>
                <button id="btn" class="btn">Join</button>
                   
                     <%}while(rs.next());
                        }}catch(Exception ex){
                                System.out.println("Exception is"+ex);}
                      %>
                                
                    
                    

            </form>
            
            <a href="#steps" id="step" onclick="toggleFunction()" >Dont't know to to connect meet click here to know the steps</a>
            <i class="fa fa-exclamation-circle" style="font-size:1.5rem;color:red;position: absolute;left: 9.2rem;"></i>
            <div class="steps" id="steps">
                
                    <ol>
                        <h5>Method 1</h5>
                        <li>
                            click "Join button to Join the Meeting"
                        </li>
                    </ol>    
                         <h5>Method 2</h5>
                    <ol>
                        <li>
                            click "copy icon which is place in the input box"
                        </li>
                        <li>
                            copy the link
                        </li>
                        <li>
                            paste link in the web browser
                        </li>
                        <li>
                            now join the meet
                        </li>
                        
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
            <a href="index.jsp">home</a>
            <a href="index.jsp#faculty">faculty</a>
            <a href="aboutus.jsp">about</a>
            <a href="index.jsp#contact">contact</a>
        </div>

        <div class="box">
            <h3>contact info</h3>
            <p> <i class="fas fa-map-marker-alt"></i> noida, india 400104. </p>
            <p> <i class="fas fa-envelope"></i> kaksha17820virtual@gmail.com </p>
            <p> <i class="fas fa-phone"></i> +91-7217697611 </p>
        </div>

    </div>

    <h1 class="credit">created by <a href="#">mr/miss. PRDK designer</a> all rights reserved. </h1>
</div>
<!-- footer section ends -->
</body>
</html>