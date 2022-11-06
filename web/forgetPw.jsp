<%-- 
    Document   : forgetPw
    Created on : 31 Mar, 2022, 9:04:12 PM
    Author     : ANGELEVIL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <% String t=request.getParameter("t");
            if(t!=null)
            {
                if(t.equals("0"))
                {        
        %>
        <script>
            alert("Your Password  is Send to your Email id");
        </script>
        <%      } }
        %>  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <!-- fevicon -->
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <!-- google fonts cdn link  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="Css/fpw.css">
    <script src="Js/fpw.js"></script>
    
</head>
<body>
    <%
       String uid=(String)session.getAttribute("uid");
      String pass=(String)session.getAttribute("pass");
      String mail=(String)session.getAttribute("mail");
      
    %>
    <div class="container" id="container">
        <header >
    <div id="menu" class="fas fa-bars"></div>
    <a href="index.jsp" class="logo"><img src="images/logo.jpg" alt="not found"></a>
    <h2 style=" font-family: cursive">FORGET PASSWORD</h2>
    
    
<!--    <div id="login" class="fas fa-user-circle" onclick="toggleFunction()"></div>-->

</header>     
             
        <!-- <button onclick="cross()" id="close"><i class="fas fa-times"></i></button> -->
        <div class="outer">
           
        <i class="fa fa-lock"></i>
        <h2>FORGOT PASSWORD?</h2>
        <p>You can reset your password here.</p>
        <div class="tab">
            <table border="0">
                <form action="fpwAction" method="post">
                    <tr>
                        <td>
                        <label for="uid"> 
                            <i class="fas fa-user-circle"></i>
                        </label>
                        </td>
                        <td>
                            <input type="text" id="uid" name="uid" placeholder="Enter your virtual id" style="padding: 2em;">
                        </td>
                    </tr>
<!--                    <tr>
                        <td>
                        <label for="mail"> 
                            <i class="fa fa-envelope"></i>
                        </label>
                        </td>
                        <td>
                            <input type="email" id="mail" placeholder="email address">
                        </td>
                    </tr>-->

                     <button id="Pw" onclick="toggle()">Send Password</button>
                     
                    
                </form>
            </table>
        </div>
    </div>
        
    </div>
    <!-- footer section starts  -->

<div class="footer"> 
<h1 class="credit">created by <a href="#">mr/miss. PRDK designer</a> all rights reserved. </h1>


<script>
    function toggle()
    {
        alert("Your Password is send to your registered email id");
    }
    </script>

</body>
</html>