<%@page import="mypkg.Admin"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Registration</title>
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <!-- jquery cdn link  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- google fonts cdn link  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- font awesome cdn link  -->
     <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <!-- custom css file link  -->
<!--    <link rel="stylesheet" href="Css/vfront.css">-->
    <!--  js file link  -->
    <script src="Js/vfront.js"></script>
     

   <style>
       :root{
    --gradient:linear-gradient(90deg,skyBlue,blue);
}
       body{
           margin: 0%;
           padding: 0%;
           }
           input {
            outline: 0;
            border-width: 0 0 2px;
            }

             #login{
             font-size: 2rem;
             color:#fff;
             cursor: pointer;
            }   
 
            #login:hover
            {
            color:#444;
            }
            .login-form{
            height:100%;
            width:100%;
            position: fixed;
            top:-120%; 
            left: 0;
            z-index: 1000;
            
            display: flex;
            align-items: center;
            justify-content: center;
            }
            .login-form.popup{
             top:0;
            }
            .login-form form{
            width:20%;
            background:#fff;
            margin:0 1rem;
            padding:0rem 2rem;
            border-radius: .5rem;
            box-shadow: 0 .1rem .3rem #333;
            position: relative;
            }
            .login-form form h3{
            font-size: 2rem;
            color:blue;
           
            }
    .login-form form .box{
    width:100%;
    padding:0rem 0;
    margin:1rem 0;
    border-bottom: .2rem solid #666;
    font-size: 1rem;
    color:#333;
    text-transform: none;
}
.login-form form .box::placeholder{
    text-transform: capitalize;
}
.login-form form .box:focus{
    border-color: blue;
}
.login-form form .box:nth-child(3){
    margin-bottom: 2rem;
}
.login-form form p{
    font-size: 1rem;
    color:#666;
    padding:0 0;
}
.login-form form p a{
    color:blue;
    text-decoration: none;
    
}
.login-form form .btn{
    width: 100%;
    margin:1rem 0;
}
.login-form form .btn:hover{
    background:#444;
}

.login-form form .fa-times{
    position: absolute;
    top:1.5rem;
    right:2rem;
    font-size: 1.5rem;
    cursor: pointer;
    color:#999;
}
.login-form form .fa-times:hover{
    color:#444;
}
.wrapper{
  display:none;
  background: #fff;
  height: 10%;
  width: 90%;
  align-items: center;
  justify-content: space-evenly;
  border-radius: 5px;
  padding: 20px 15px;
  box-shadow: 5px 5px 30px rgba(0,0,0,0.2);
}
.wrapper .option
{
  background: #fff;
  height: 100%;
  width: 91%;
  display: flex;
  align-items: center;
  justify-content: space-evenly;
  border-radius: 5px;
  cursor: pointer;
  padding: 0 10px;
  border: 2px solid lightgrey;
  transition: all 0.3s ease;
}
.wrapper .option .dot
{
  margin-right:-21%; 
  height: 20px;
  width: 20px;
  background: #d9d9d9;
  border-radius: 50%;
  position: relative;
}
.wrapper .option .dot::before{
  position: absolute;
  content: "";
  top: 4px;
  left: 4px;
  width: 12px;
  height: 12px;
  background: #0069d9;
  border-radius: 50%;
  opacity: 0;
  transform: scale(1.5);
  transition: all 0.3s ease;
}


#option-2:checked:checked ~ .option-2{
/*  border-color: #0069d9;*/
  background:var(--gradient);
}

#option-2:checked:checked ~ .option-2 .dot{
  background: #fff;
}

#option-2:checked:checked ~ .option-2 .dot::before{
  opacity: 1;
  transform: scale(1);
}
.wrapper .option span{
  font-size: 20px;
  color: #808080;
}
.option-2:hover{
  color: black;
  background:var(--gradient);
}
.option-2 span:hover{
  color: black;
  
}
.btn{
    padding:.2rem 2rem;
    font-size: 130%;
    color:#fff;
    background:var(--gradient);
    border-radius: 5rem;
    margin-top: 1rem;
    cursor: pointer;
    box-shadow: 0 .1rem .3rem rgba(0,0,0,.3);
    position: relative;
    overflow: hidden;
    z-index: 0;
    margin-left: 20px;
}

.btn::before{
    content: '';
    position: absolute;
    top:-1rem; left:-100%;
    background:#fff9;
    height:150%;
    width:20%;
    transform: rotate(25deg);
    z-index: -1;
}

.btn:hover::before{
    transition: .3s linear;
    left: 120%;
}



                










       
        
        .mainpage{
            width: 100vw;
            height: 100vh;
            background-color: rgba(253, 251, 251, 0.815);
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            position: absolute;
        }
        header{
            width: 100%;
            height: 11%;
            background:linear-gradient(90deg,rgb(195, 238, 255),blue);
            display: flex;
            justify-content: space-between;
            align-items: center;
            
            

        }
        /* .logo{
            width: 15%;
            margin-left: 4%;
        } */
        .heading{
            height: 10%;
            display: flex;
            justify-content: center;
            align-self: center;
            width: 70%;
            box-shadow: 0px -2px 0.3rem 0.01rem black;
            position: relative;
        }
        header-content{
            font-family:Georgia, 'Times New Roman', Times, serif;
            
        }
        .nav{
            color: white;
            font-size: 130%;
            text-decoration: none;
            font-weight: bold;
        font-family: Constantia;
        }
        .formbox{
            width: 70%;
            height: 70%;
            position:relative;
            left: 15%;
            display: flex;
            justify-content: space-between;
           box-shadow: 0 4px 0.3rem 0.01rem black;
        }
        .form{
            width: 50%;
            height: 100%;
            background-color: white;
        }
        .form-fields{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }
        .bottomborder{
            border-top-style: none;
            border-left-style: none;
            border-right-style: none;
            outline: none;
            font-size: 110%;
            font-family: cursive;
        }
        .inputs{
            width: 100%;
            height: 10%;
            text-align: center;
            /* background-color: brown; */
            padding: 1%;
        }
        .extrawidth{
            width: 54%;
        }
        .span{
            font-family: cursive; font-size: 110%;
        }
        .btns{
            display: flex;
            justify-content: space-evenly;
        }
        .btn1{
            font-size: 120%;
            font-family: cursive;
            width: 200%;
            background:linear-gradient(90deg,blue,rgb(0, 183, 255));
            border-radius: 25px;
            color: white;
        }
        .btn2{
            font-size: 120%;
            font-family: cursive;
            width: 110%;
            background:linear-gradient(90deg,rgb(110, 110, 255),rgb(156, 227, 255));
            border-radius: 25px;
            color: white;
        }
        .pic{
            width: 50%;
            height: 100%;
            background-color: rgb(63, 22, 28);
        }
        .footer{
            width: 100%;
            height: 6%;
            background-color: black;
        }
        .footer-content{
            color: white;
            text-align: center;
            /* font-family: cursive; */
        }
        </style>
    </head>
<body>
     <% String t=request.getParameter("t");
            if(t!=null)
            {
                if(t.equals("2 "))
                {        
        %>
        <script>
            alert("You are Successfully Registerd Check Your Mail for Virtual Id");
        </script>
        
        <%}}%>
    
    <div class="mainpage">
        <!---------------------------------[ Header ]--------------------------------->
        <header>
            <%
                String uid=(String)session.getAttribute("uid");
                if(uid==null)
                {
            %>
            <div class="nav" style="margin: 1%; color: white;">&lt;&lt;<a href="index.jsp" style="color:white; text-decoration: none;">Back</a>
            </div>
            <%} else if(uid.startsWith("A"))
                {
            %>
            <div class="nav" style="margin: 1%; color: white;">&lt;&lt;<a href="Admin.jsp" style="color:white; text-decoration: none;"> Back</a>
            </div>
            <%}%>
            <div style="width:22%; margin-right: 2%; margin-left: 85%">
                
                    <div id="login" class="fas fa-user-circle"></div>
            </div>
            
<!--            <div style="margin: 1%; ">
                <a href="index.jsp" class="nav">Already Registered? Login Here</a>
            </div>-->
        </header>
            <div class="login-form  ">
    <form action="LoginAction" method="post">
        <h3>Login</h3>
        <input type="text" placeholder="Enter your UserId" class="box" name="uid" required="true" autofocus="true">
        <input type="password" placeholder="enter your password" class="box" name="pw" required="">
        
        
        <p>Forget password? <a href="forgetPw.jsp">Click here</a></p>
        <p>Don't have an account?<a href="#confirm"onclick="toggleFunction()" >Register Now</a></p>
        <div class="wrapper" id="confirm">
           
   <label for="option-2" class="option option-2 rad">
     <div class="dot" onclick="window.location='teach_regis.jsp'" ></div>
      <span>Teacher</span>
   </label>
</div>
        <input type="submit" class="btn" value="Login">
        <i class="fas fa-times"></i>
        
    </form>
</div>
         <!---------------------------------[ Heading ]--------------------------------->
        <div class="heading" style="margin-top:1%">
            <h1 class="header-content">Student Registration Form</h1>
        </div>
         
         <!---------------------------------[ forom ]--------------------------------->
        <div class="formbox" style="margin-bottom :1%">
            <div class="form">
                <form action="SignupAction" method="post" >
                    <div class="form-fields">
                        <div class="inputs">
                            <span><i class='bx bxs-user'></i></span><input type="text" pattern="[A-Za-z\s]{3,}" name="fname" id="fid" placeholder="Enter First Name" class="bottomborder" required title="Enter only Alhabets">
                         </div>
                         <div class="inputs">
                            <span><i class='bx bxs-user'></i></span><input type="text" pattern="[A-Za-z\s]{3,}"  name="lname" id="lid" placeholder="Enter Last Name" class="bottomborder" title="Enter only Alhabets" >
                        </div>
                        <div class="inputs">
                            <span><i class='bx bxs-key'></i></span><input type="password" name="mypass" id="pass" placeholder="Enter password" class="bottomborder" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                        </div>
                        <div class="inputs">
                            <span><i class='bx bxl-gmail'></i></span><input type="email" name="mymail" id="mail" placeholder="abc123@gmail.com" class="bottomborder" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                        </div>
                        <div class="inputs">
                            <script>
                                function checklength(len)
                                {
                                    var leng=document.getElementById("mob").value.length;
//                                    document.write(leng);
                                    if(leng<=len)
                                    {
                                        return true;
                                    }else
                                    {
                                        var str=document.getElementById("mob").value;
                                        str=str.substring(0,str.length-1);
                                        document.getElementById("mob").value=str;
                                    }
                                }
                            </script>                   
                            <span><i class='bx bx-mobile'></i></span><input type="number" name="mymob" id="mob" placeholder="9211420420" class="bottomborder" oninput="checklength(10)" required>
                        </div>
                        <div class="inputs">
                            <span><i class='bx bxs-calendar'></i></span><input type="date" name="mydob" id="dob" placeholder="01-01-2001" min="1970-01-01" max="2030-12-30" class="bottomborder extrawidth" required>
                        </div>
                        <div class="inputs">
                            <span class="span">Male<i class='bx bx-male'></i></span><input type="radio" name="gen"  id="male" value="male">
                                    <span class="span">Female<i class='bx bx-female'></i></span><input type="radio" name="gen" id="female" value="female">
                                    <span class="span">Others<i class='bx bx-body'></i></span><input type="radio" name="gen" id="others" value="others">
                        </div>
                        <div class="inputs">
                            <span><i class='bx bxs-book'></i></span><select required name="mycourse" id="course" class="bottomborder extrawidth">
                                <option value="">Select your Course..</option> 
                                <option value="C programming">C Programming</option>
                                <option value="C++">C++</option>
                                <option value="Python">PYTHON</option>
                                <option value="Java">JAVA</option>
                                <option value="DataBase management System">DBMS</option>
                            </select>
                        </div>
                        <div class="inputs">
                            <span><i class='bx bxs-home-heart' style="font-size: 200%;"></i></span><textarea name="myadd" id="add" cols="24" rows="3" placeholder="Enter your full Address" required
                                                                            style="font-family: cursive; font-size: 100%;"></textarea>
                        </div>
                        <div class="inputs btns">
                            <div class="input">
                                <input type="submit" value="Sign-Up" class="btn1">
                            </div>
                            <div class="input">
                                <input type="reset" value=" Clear " class="btn2">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="pic">
                <img src="images/signin.jpg" alt="SIGN-UP picture" width="100%" height="100%">
            </div>
        </div>
         <div style="font-size:25px;color:red;"> 
         </div>
         </script>
         <!---------------------------------[ footer ]--------------------------------->
        <div class="footer">
            <p class="footer-content">MR/MISS. PRDK DESIGNER. ALL RIGHTS RESERVED.</p>
        </div>
    </div>
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