<%-- 
    Document   : index
    Created on : 31 Mar, 2022, 8:41:18 PM
    Author     : ANGEVIL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Virtual कक्षा</title>
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <!-- jquery cdn link  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- google fonts cdn link  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="Css/vfront.css">
    <!--  js file link  -->
    <script src="Js/vfront.js"></script>

</head>
<body>
<!-- header section starts  -->
<header>
    <div id="menu" class="fas fa-bars"></div>
    <a href="images/logo.jpg" class="logo"><img src="images/logo.jpg" alt="not found"></a>

    <nav class="navbar">
        <ul>
            <li><a class="active" href="#home">home</a></li>
            <li><a href="#faculty">Faculty</a></li>
            <li><a href="#about">about</a></li>
            <li><a href="#contact">contact</a></li>
        </ul>
    </nav>

    <div id="login" class="fas fa-user-circle"></div>

</header>

<!-- header section ends -->

<!-- login form  -->
<div class="login-form  ">
    <form action="LoginAction" method="post">
        <h3>login</h3>
        <input type="text" placeholder="Enter your UserId" class="box" name="uid" required="true" autofocus="true">
        <input type="password" placeholder="enter your password" class="box" name="pw" required="">
        <% String t=request.getParameter("t");
            if(t!=null)
            {
                if(t.equals("0"))
                {        
        %>
        <script>
            alert("Sorry invalid id pW");
        </script>
        <%      } else if(t.equals("1")) {
        %>  
        <script>
            alert("You are Successfully Logout");
        </script>
        <%      } else if(t.equals("2")) {
        %>  
        <script>
            alert("You are Successfully Registerd Check Your Mail for Virtual Id");
        </script>
          
          
          <% }else if(t.equals("3")){
                  %>  
                       <script> 
                         alert("your Query Id is Sent to your Id!!");
                       </script>    
      <%
      }
}   
      %>
        
        <p>forget password?<button> <a href="forgetPw.jsp">click here</a></button></p>
        <p>don't have an account?<a href="#confirm"onclick="toggleFunction()" >register now</a></p>
        <div class="wrapper" id="confirm">
            <input type="radio" name="select" id="option-1" onclick="window.location='std_regis.jsp'">
 <input type="radio" name="select" id="option-2"onclick="window.location='teach_regis.jsp'">
   <label for="option-1" class="option option-1">
     <div class="dot"></div>
      <span>Student</span>
      </label>
   <label for="option-2" class="option option-2">
     <div class="dot"></div>
      <span>Teacher</span>
   </label>
</div>
        <input type="submit" class="btn" value="login">
        <i class="fas fa-times"></i>
        
    </form>
</div>

<!-- home section starts  -->

<section class="home" id="home">
    <h1>Virtual कक्षा</h1>
    <p>“If you want to teach people a new way of thinking, don’t bother trying to teach them. Instead, give them a tool, the use of which will lead to new ways of thinking.” The new way of learning.</p>
    <a href="std_regis.jsp"><button class="btn">get started</button></a>

</section>

<section class="faculty" id="faculty">

<h1 class="heading">our expert teachers</h1>

<p>In any classroom, it’s not just the students who are there to learn. As a teacher, you can give yourself the opportunity to learn from your class in new and unexpected ways each day. And remember that your job isn’t just about sharing knowledge. You have the power to spark an interest and desire to learn that extends far beyond books and blackboards.

For those times when you’re challenging your students as well as yourself,</p>

<a href="teach_regis.jsp"><button class="btn">Register here</button></a>

</section>

<!-- teacher section ends -->
<!-- about section starts  -->

<section class="about" id="about">

    <div class="image">
        <img src="images/coding.jpg" alt="not found">
    </div>

    <div class="content">
        <h3>why choose us?</h3>
        <p>E-learning and virtual classroom is critical support mechanism for educational institutions to grow, improve the performance of students, teachers, as well as useful for organizations to enhance the performance of employees.
Today’s virtual classrooms are online spaces that share some features of brick-and-mortar classrooms but different in other ways.
</p>
        <p>Virtual Classroom is an online system that allows students and teachers to communicate and collaborate. Virtual classrooms are typically cloud-based learning solutions that are part of larger learning management systems (LMS). They are highly customizable and are accessible to users on a variety of devices, like smartphones, tablets and laptops..</p>
        <a href="aboutus.jsp"><button class="btn">learn more</button></a>
    </div>

</section>

<!-- about section ends -->

<!-- contact section starts  -->

<section class="contact" id="contact">

<h1 class="heading">contact us</h1>

<div class="row">
    <form action="Contact_Us" method="post">
        <input type="text" name="nm" placeholder="full name" class="box" required>
        <input type="email" name="email" placeholder="your email" class="box" required>
        <input type="text" name="Options" placeholder="student or teacher" class="box">
        <input type="number" name="mobile" placeholder="your number" class="box" required>
        <textarea name="qta" id="" cols="30" rows="10" class="box address" placeholder="your query" required></textarea>
        <input type="submit" class="btn" value="send now">
    </form>

<!--    <div class="image">
        <img src="images/contact-img.png" alt="">
    </div>-->

</div>

</section>

<!-- contact section ends -->

<!-- footer section starts  -->

<div class="footer">

    <div class="box-container">

        <div class="box">
            <h3>branch locations</h3>
            <a href="#">Noida</a>
            <a href="#">Patna</a>
            <a href="#">Mayur Vihar Phase-3</a>
            <a href="#">Nyay Khand</a>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="#home">home</a>
            <a href="#faculty">faculty</a>
            <a href="#about">about</a>
            <a href="#contact">contact</a>
        </div>

        <div class="box">
            <h3>contact info</h3>
            <p> <i class="fas fa-map-marker-alt"></i> noida, india 400104. </p>
            <p style="text-transform: lowercase"> <i class="fas fa-envelope"></i> kaksha17820virtual@gmail.com </p>
            <p> <i class="fas fa-phone"></i> +91-7217697611 </p>
        </div>

    </div>

    <h1 class="credit">created by <a href="#">mr/miss. PRDK designer</a> all rights reserved. </h1>
</div>
<!-- footer section ends -->
<script>
    function toggleFunction()
    {
    var toggle = document.getElementById("confirm");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
    } 
  }
</script>
</body>
</html>