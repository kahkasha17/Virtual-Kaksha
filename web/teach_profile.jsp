<%@page import="mypkg.Admin"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your profile</title>
    <link rel="stylesheet" href="Css/teach_profile.css">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        function hideBox() {
            $(".main").toggleClass("new-main");
            $(".header").toggleClass("new-header");
            $(".profile").toggleClass("new-profile");
            $(".form").toggleClass("new-form");
            $(".footer").toggleClass("new-footer");
            $(".img-id").toggleClass("new-img-id");
            $(".profile-img").toggleClass("new-profile-img");
        }
          $(document).ready(function() {
         $("#ssarow").click(function(){ 
             $(".ss").toggleClass("new-ss2");   
             $(".sshead").toggleClass("new-sshead");   
             $(".bx").toggleClass("bxs-chevron-up");   
             $(".sschng").toggleClass("new-sschng");   
             $(".ssbtns").toggleClass("new-ssbtns");   
            });
        });
    </script>

</head>
<body>
     <%
     String str1=request.getParameter("e");
     if(str1!=null)
     {
         if(str1.equals("2"))
         {
   %>
   <script>
    alert("Successfully Updated..");   
   </script>
         <%}}%>
    
    <%
    String uid=(String)session.getAttribute("uid");     
         if(uid==null)
         {
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }
    String id1=(String)session.getAttribute("ids1");
    ResultSet r=Admin.showteach(id1);
    ResultSet s=Admin.getName(uid);
    while(r.next())
          {
    %>          
    <div class="main">
        <div class="header">
            <div class="head1">
                <img src="images/logo.jpg" alt="Logo" class="pic">
            </div>
            <div class="head2">
                <h1 class="p1">Teacher's Profile</h1>
            </div>
            <div class="head3">
                <%while(s.next())
                    {
                    %>
                <ul>
                    
                    <li class="l1" style="text-transform:capitalize;">Welcome <%out.print(s.getString(1));}%><i class='bx bx-chevron-down-circle'></i>
                        <ul>
                            <%if(uid.startsWith("A"))
                            {
                                
                            
                            %> 
                            <li><a href="Admin.jsp">Home</a></li>
                            <li><a href="feed.jsp">FeedBack</a></li>
                            <li><a href="logOutAction">Sign-Out</a></li>
                           <%}else
                                {
                           %> 
                            <li><a href="Teacher.jsp">Home</a></li>
                            <li><a href=teacherlibrary.jsp>Digital Library</a></li>
                            <li><a href="flive.jsp">Live Class</a></li>
                            <li><a href="assign.jsp">Assignment</a></li>
                            <li><a href="logOutAction">Sign-Out</a></li><%}%>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- [ Profile part ] -->
        <div class="profile">
            <div class="profile-cont">
                <h1 class="cont fsize">Hey Mam/sir!! This is Your profile</h1>
                <p class="cont">Here you can see all your details and can update them...</p>
            </div>
            <div class="detail-box">
                <div class="detail">
                    <ul class="detail-uls">
                        
                        <li class="detail-lis">Your Registration ID <u><%out.println("FVKID100"+r.getString(1));%></u></li>
                        <li class="detail-lis">Your Full name <u><%out.println(r.getString(2)+" "+r.getString(3));%></u></li>
                        <li class="detail-lis">You are Assign to Teach   <u><%out.print(r.getString(9));%></u></li>
                        <li class="detail-lis">Your Date of Birth <u><%out.print(r.getString(7));%></u></li>
                        <li class="detail-lis">Gender <u><%out.print(r.getString(8));%></u></li>
                        <li class="detail-lis">You Update your Profile on <u><%out.print(r.getString(11));%></u></li>
                        <li class="detail-lis">Your Address <u><%out.print(r.getString(10));%></u></li>

                    </ul>
                </div>
                        <script>
                            function addDiv()
                            {
                             $(".uploadimgdiv").toggleClass("new-uploadimgdiv");
                            }
                        </script>
                        <div class="uploadimgdiv">
    <%
        ResultSet rs=Admin.getImgId();
                           String tid=null;
                           String fid="FVKID100"+id1;
                           while(rs.next())
                           {
                               if(rs.getString(1).equals(fid))
                               {
                                   tid=rs.getString(1);
                               }
                           }
                        if(tid==null)
                        {
    %>                    
                      <form action="teachImgUpload" enctype="multipart/form-data" method="post" class="uploadform">
                                <input type="text" value="<%out.print("FVKID100"+id1);%>" name="myid" class="stylepic" readonly>
                                 
                                 <input type="file" name="myfile" class="stylepic">
                                 
                                 <input type="submit" value="Upoad Image" class="stylepic" style="background-color: blueviolet; color: white; height: 40%;">
                            </form>
                       <%}
                    else  if(tid!=null && tid.equals(fid))
                      {
%>           <form action="teachImgUpdate" enctype="multipart/form-data" method="post" class="uploadform">
                                <input type="text" value="<%out.print("FVKID100"+id1);%>" name="myid" class="stylepic" readonly>
                                 
                                 <input type="file" name="myfile" class="stylepic">
                                 
                                 <input type="submit" value="Upoad Image" class="stylepic" style="background-color: blueviolet; color: white; height: 40%;">
                            </form>
<%}%>

                       <%
                           String addmsg=(String)request.getAttribute("addmsg");
                           if(addmsg!=null)
                           {
                               out.println(addmsg);
                           }
                       %>         
                        </div>
                <div class="profile-img">
                    <div class="img-id">
                    <%
                        if(addmsg!=null)
                        {
                            if(tid!=null)
                            {
                                if(tid.equals(fid))
                                {
                    %>
                      <img src="showTeachimg?id=<%out.print("FVKID100"+id1);%>" alt="profile image" width="90%" height="70%" style="border-radius: 50%;margin-top: 10%; border: 2px solid blueviolet;" class="logoimg" onclick="addDiv()">
                    <%            
                                }
                                else
                                {
                    %>
                        <img src="images/teacherlogo.png" alt="profile image" width="90%" height="70%" style="border-radius: 50%;margin-top: 10%; border: 2px solid blueviolet;" class="logoimg" onclick="addDiv()">
                    <%            
                                }
                             }else{    
                    %>
                        <img src="images/teacherlogo.png" alt="profile image" width="90%" height="70%" style="border-radius: 50%;margin-top: 10%; border: 2px solid blueviolet;" class="logoimg" onclick="addDiv()">
                    <%
                                }
                            }
                        else
                        {
                            if(tid!=null)
                            {    
                                if(tid.equals(fid))
                                {
                    %>
                      <img src="showTeachimg?id=<%out.print("FVKID100"+id1);%>" alt="profile image" width="90%" height="70%" style="border-radius: 50%;margin-top: 10%; border: 2px solid blueviolet;" class="logoimg" onclick="addDiv()">
                    <%
                                }
                                else
                                {
                    %>
                        <img src="images/teacherlogo.png" alt="profile image" width="90%" height="70%" style="border-radius: 50%;margin-top: 10%; border: 2px solid blueviolet;" class="logoimg" onclick="addDiv()">
                    <%            
                                }
                            }else{
%>
                                                <img src="images/teacherlogo.png" alt="profile image" width="90%" height="70%" style="border-radius: 50%;margin-top: 10%; border: 2px solid blueviolet;" class="logoimg" onclick="addDiv()">
                    <%
                                }
                        }
                    %>
                        
                        <span style="position: absolute; right: 15%; font-size: 65%;">Click Icon To upload and Update Image</span>
                        <figcaption class="mycont"><%out.print("FVKID100"+id1);%></figcaption>
                        <figcaption class="mycont"><%out.println(r.getString(2)+" "+r.getString(3));%></figcaption>
                    </div>
                    <button class="editbtn" id="btn1" onclick="hideBox()" >Edit Your Details</button>
                </div>
            </div>
        </div>
        <!-- [ form part ] -->
        <div class="form">
            <div class="form-cont">
                <h1 style="margin: 0%;padding: 0%;">Hey There!! Here you can update your details..</h1>
                <p style="margin: 0%;padding: 0%;">Please enter your details carefully which you want to update</p>
            </div>
            <div class="form-det">
                <form action="T_UpdAction" method="post" class="myform">
                    <div class="form2">
                        <div class="inputs">
                            <input type="text" name="fname" id="fid" value="<%out.print(r.getString(2));%>" class="myinp">
                            <input type="text" name="lname" id="lid" value="<%out.print(r.getString(3));%>" class="myinp">
                         </div> 
                        <div class="inputs">
                            <input type="email"    name="mymail" id="mail" value="<%out.println(r.getString(5));%>" class="myinp">
                            <input type="text" name="mymob" id="mob" value="<%out.print(r.getString(6));%>" class="myinp">
                        </div>
                        <!-- <div class="inputs">
                        </div> -->
                        <div class="inputs">
                            <input type="date" name="mydob" id="dob" value="<%out.print(r.getString(7));%>" min="01-01-1790" max="30-12-2030" class="myinp">
                            <textarea class="myinp" name="myadd1" id="add" cols="24" rows="2" placeholder="<%out.print(r.getString(10));}%>"
                                      required="true" ></textarea>
                        </div>
                        <!-- <div class="inputs">
                        </div> -->
                        <div class="inputs radiobtn">
                      
                            <span class="span">Male<i class='bx bx-male'></i></span><input type="radio" name="gen" id="male" value="male" required="">
                                    <span class="span">Female<i class='bx bx-female'></i></span><input type="radio" name="gen" id="female" value="female">
                                    <span class="span">Others<i class='bx bx-body'></i></span><input type="radio" name="gen" id="others" value="others">
                        </div>
                       
                        <div class="inputs btns">
                            <div class="input">  
                            
                                <input type="submit" value="Update" class="btn1">
                            </div>
                            <div class="input">
                                <input type="reset" value=" Clear " class="btn2" >
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
                                     
        <div class="ss">
        <div class="sshead">
            <div style="width: 95%;height: 100%;">
                <span class="ssp"> Security Section <span style="font-weight: normal; font-size: 70%;">(*Change if needed )</span></span>  
            </div>
            <div class="ssarrow" id="ssarow">
            <span><i class='bx bxs-chevron-down' ></i></span>
            </div>
        </div>
       
        <form class="ssform" action="passCourseUpdateTch">
            <div class="sschng">
                <div class="sspass">
                    <span style="font-size: 110%;">Change Your Password</span>
                    <input type="password" id="ssmypass" name="sspass" placeholder="Enter your password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                </div>
                <div class="sscour">
                    <span style="font-size: 110%;">Change Your Course</span>
                    <select name="sscourse" id="sscourse">
                                <option value="">Select your Course..</option> 
                                <option value="C programming">C Programming</option>
                                <option value="C++">C++</option>
                                <option value="Python">PYTHON</option>
                                <option value="Java">JAVA</option>
                                <option value="DataBase management System">DBMS</option>
                            </select>
                </div>
            </div>
            <div class="ssbtns">
                <%
                    String tchmsg=(String)request.getParameter("updmsgtch");
                    if(tchmsg!=null)
                    {
                        out.println(tchmsg);
                    }
                %>
                <input type="submit" value="Change" class="sschnge">
            </div>
        </form>  
     </div>                                      
        <!-- [ footer part ] -->
        <div class="footer">
            <p class="footer-content">Designed by &copy;PRKD Products.</p>
        </div>
    </div>
</body></html>
