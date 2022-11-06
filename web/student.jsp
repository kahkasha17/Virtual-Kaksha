<%@page import="mypkg.Admin"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <title>Student Page</title>
    <link rel="stylesheet" href="Css/student_1.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <script type="text/javascript" src="Js/student_1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn").click(function () {
                $(".maindiv").toggleClass("setmain");
                $(".pad").toggleClass("setpad");
                $(".livdiv_content").toggleClass("set_live_contant_togle");
                $(".joinbtn").toggleClass("setjointogle");
                $(".set_both_div").toggleClass("set_both_togle");
                $(".assignments").toggleClass("togle_assign");
            });
            $("#dropli").click(function() {
               $(".scndul .myli .ul_under_scnd_ul").toggle();
            });
        });
    </script>
</head>

<body>
    <%
        String u=(String)session.getAttribute("uid");
      String n=(String)session.getAttribute("name");
      if(u==null)
            {
                
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
    %>
    
                
    
    
    <!-----------[ Horizontal navigation bar ]-------->
    <header>
        <nav>
            <div class="logo">
                <img src="images/logo.jpg" alt="Picture not found" class="mylogo">
            </div>
            <ul class="fstul">
                <li class="fstul-lis"><a href="student.jsp">Home</a></li>
                <li class="fstul-lis"><a href="student_library.jsp">Digital Library</a></li>
                <li class="fstul-lis"><a href="assign.jsp">Assignment</a></li>
                <li class="fstul-lis"><a href="HelpandSupport.jsp">Support</a></li>
            </ul>
            <div class="sign">
                 <ul class="scndul">
                    <li class="myli">
                    <span style="font-family: constantia;font-size: 70%; text-transform:capitalize;">Hi, <%out.print(n);%></span><span style="font-size: 90%;" ><i class='bx bx-chevron-down-circle' id="dropli"></i></span>                        
                    <ul class="ul_under_scnd_ul">
                        <li class="dropli"><a href="student_library.jsp" class="mylink">Digital Library</a></li>
                            <li class="dropli"><a href="profile.jsp" class="mylink">Your Profile</a></li>
                            <li class="dropli"><a href="slive.jsp" class="mylink">Live Class</a></li>
                            <li class="dropli"><a href="assign.jsp" class="mylink">Assignment</a></li>
                            <li class="dropli"><a href="logOutAction" class="mylink">Sign-Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!---------------[ vertical side bar ]------------------------->
    <!-- <div class="iamdiv"> -->
    <div class="sidebar">
        <div class="logo">
            <div class="logincontent">
<%
    HttpSession ses=request.getSession();
     String id=(String)ses.getAttribute("ids");
    ResultSet rs=Admin.getstdImgId();
    String sid=null;
    String fid="SVKID100"+id;
    while(rs.next())
    {
        if(rs.getString(1).equals(fid))
        {
            sid=rs.getString(1);
        }
    }
    if(sid!=null)
    {
%>                
                <img src="showstdimg?id=<%out.print("SVKID100"+id);%>" alt="Picture not found" class="loginpic">
<%}else{%>      
<img src="images/login.png" alt="Picture not found" class="loginpic">
<%}%>
<div class="content" style="text-transform: capitalize" ><%out.print(n);%><br><%out.print(u);%></div>
            </div>
            <div class="menu">
                <i class='bx bx-menu' id="btn" onclick="baractivefuntion()"></i>
                
            </div>
        </div>
        <ul class="navlist">
       
            <!--[ account ]-->
            <li>
                <a href="profile.jsp">
                    <i class='bx bxs-user-account'></i>
                    <span class="navcontent">My Account</span>
                </a>
                <span class="tooltip">Profile</span>
            </li>
            <!--[ cources ]-->
            <li>
                <a href="slive.jsp">
                    <i class="bx bx-book"></i>
                    <span class="navcontent">Live Class</span>
                </a>
                <span class="tooltip">Live Class</span>
            </li>
            <!--[ Digital library ]-->
            <li>
                <a href="student_library.jsp">
                    <i class="bx bx-library"></i>
                    <span class="navcontent">Digital Library</span>
                </a>
                <span class="tooltip">Library</span>
            </li>
            <!--[ Assignments ]-->
            <li>
                <a href="assign.jsp">
                    <i class='bx bxs-book-open'></i>
                    <span class="navcontent">Assignments</span>
                </a>
                <span class="tooltip">Assignments</span>
            </li>
            <!--[ help and support ] -->
            <li>
                <a href="HelpandSupport.jsp">
                    <i class='bx bx-help-circle'></i>
                    <span class="navcontent">Help and Support</span>
                </a>
                <span class="tooltip">Help</span>
            </li>
            <!--Feedback-->
            <li>
                <a href="feed.jsp">
                    <i class='far fa-comment' style='font-size:43px;color:white'></i>
                    <span class="navcontent">FeedBack</span>
                </a>
                <span class="tooltip">Feedback</span>
            </li>
            <!--[ sign out ]-->
            <li>
                <a href="logOutAction">
                    <i class='bx bx-exit'></i>
                    <span class="navcontent">Sign out</span>
                </a>
                <span class="tooltip">Sign Out</span>
            </li>
        </ul>
    </div>

    <!-- main div start from here -->
    <div class="maindiv">
        <!-------------------------------[ Profile section ]----------------------->
        <div class="pad profile">
            <div class="profile_content">
                <div class="content2">
                    <p class="heading1">Your Profile</p>
                    <p class="pf_cont">
                        <b style="text-transform: capitalize">
                            Hey <%out.println(n);%>!!
                        </b>
                        Welcome to <b>Virtual Classroom</b> your Virtual-Buddy in your journey of learning. 
                    </p>
                </div>
                <button class="profile_btn"><a href="profile.jsp" class="btn">Profile</a></button>
            </div>
            <div class="set_profile_img_div">
                <img src="images/profile1.jpg" alt="no Picture found" class="set_profile_img">
            </div>
        </div>
        <!-------------------------------[ Library section ]----------------------->
        <div class="pad classroom">
            <h1 class="classroomhead">Your Classroom</h1>
            <div class="libset">
                <div class="livediv set_both_div">
                    <div class="setbtn">
                        <div class="livdiv_content">
                            Join our <b>Live Classes</b> for the better Learning experience.
                        </div>
                        <button class="joinbtn"> <a href="slive.jsp" style="color:white;"> Go Live</a></button>
                    </div>
                </div>
                <div class="stdmat set_both_div">
                    <div class="setotherbtn">
                        <div class="set_img_con">
                            <img src="images/dlib.png" alt="No Picture found" class="dlib">
                            <div class="set_dig_lib">
                                <div class="dig_div_content">
                                    Get your study Material from our <b>Digital Library</b>.
                                </div><br>
                                <button class="joinbtn"><a href="student_library.jsp"style="color: white;">Visit Now</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-------------------------------[ Assignment section ]----------------------->
        <div class="pad">
            <h1 class="assign_heading">Your Assignments</h1>
            <div class="assignment">
                <div class="assign">
                    <p class="no_of_assign">Get and Upload Assignments for Students
                    <p class="up_assign">Hey there!! You can get and upload your assignments here.<br>
                    And you can also Arrange your Assignments.
                    </p>          
                    <button class="mybtn" ><a href="assign.jsp" style="color:white;"> Click Me</a></button>
                </div>
                <img src="images/assign2.jpg" alt="Assignment Image" class="assign-img">
            </div>
        </div>
    </div>

    <!-- </div> -->

    <!-- footer section starts  -->

    <div class="footer">

        <div class="box-container">

            <div class="box">
                <h3>branch locations</h3>
                <a href="#">Noida</a>
                <a href="#">Patna</a>
                <a href="#">Utter Pradesh</a>
                <a href="#">Makanpur</a>
            </div>

            <div class="box">
                <h3>quick links</h3>
                <a href="index.jsp">home</a>
                <a href="aboutus.jsp">about</a>
                <a href="aboutus.jsp#team">faculty</a>
                <a href="index.jsp#contact">contact</a>
            </div>

            <div class="box">
                <h3>contact info</h3>
                <p> <i class="fas fa-map-marker-alt"></i> noida, india 400104. </p>
                <p style="text-transform: lowercase"> <i class="fas fa-envelope"></i> kaksha17820virtual@gmail.com </p>
                <p> <i class="fas fa-phone"></i> +91-7217697611 </p>
            </div>

        </div>

        <h1 class="credit">created by <a href="#">mr/miss. PDRK designer</a> all rights reserved. </h1>
    </div>
    <!-- footer section ends -->
</body>

</html>