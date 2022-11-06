<%@page import="mypkg.Admin"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType ="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="Css/stddiglib.css">
    <script src="Js/stddiglib.js"></script>
    <title>Digital Library</title>
    <style>
        *{
            box-sizing:content-box;
                
        }
    </style>
</head>
<body>
  
  <%
      
      String uid=(String)session.getAttribute("uid");
         if(uid==null)
         {
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }
       HttpSession ses=request.getSession(true);
      String u=(String)ses.getAttribute("ids");  
      String n=(String)ses.getAttribute("name");
  %>  
  
    
    <div class="mainpage">
        <!-------------------------[ header ]----------------->
        <div class="box1">
            <img src="images/v1.png" alt="Logo of virtual class" class="headimg">
            <div class="links">
                <ul class="homelinks">
                    <li><a href="student.jsp">Home</a></li>
                    <li><a href="student_library.jsp">E-books</a></li>
                    <li><a href="student_library.jsp">Notes</a></li>
                    <li><a href="student_library.jsp">Video Lecture</a></li>
                </ul>
            </div>
            <div class="stdnav">
                <ul class="stdnav-ul">
                    <li class="stdnav-ul-li" style="font-size:130%;text-transform:capitalize;">
                        Hii, <%out.println(n);%><i class='bx bx-down-arrow ' id="btn1"></i>
                    </li>
                    <li class="stdnav-ul-li2">
                        <ul class="stdnav-ul-li2-ul">
                            <li><a href="student.jsp">Home</a></li>
                            <li><a href="profile.jsp">Your Profile</a></li>
                            <li><a href="assign.jsp ">Assignments</a></li>
                            <li><a href="HelpandSupport.jsp">Help & support</a></li>
                            <li><a href="logOutAction">Sign out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!------------------[ Library view ]------------------------>
        <div class="box2">
            <div class="sidebar">
                <div class="btnlist" >
                    <div class="btns">
                        <button id="bookbtn" class="btnstyle">Books</button>
                        <button id="notebtn" class="btnstyle">Notes</button>
                        <button id="vidbtn" class="btnstyle">Videos</button>
                    </div>
                    <div class="lists">
                        <div class="booklist">
                            <ol class="bookol">
<%
   
    String sub1=null;
    try {
            ResultSet pc=Admin.coursePassStd(u);
            while(pc.next())
            {
                sub1=pc.getString(2);
                System.out.println("Courseeeeeeeeee issssss "+sub1);
            }
        } catch (Exception e) {
        }
    try{
        
        ResultSet rs= Admin.bookName();
        String Bsub=null;
        while(rs.next())
        {
            Bsub=rs.getString(2);
            if(Bsub.equals(sub1)){
 %>
       <li ><a href='ShowBook?id="<%out.println(rs.getString(3));%>+"' target="libframe"><%
           out.println(rs.getString(1));
       %></a>
       </li>
       
                            
     <%                     
        }}
    }catch(Exception ex){}
    %>  
     </ol>
                        </div>
                        <div class="notelist">
                            <ol class="noteol">
      <%
        String id=request.getParameter("id");
    try{
        ResultSet rs= Admin.noteName();
        String Nsub=null;
        while(rs.next())
        {
            Nsub=rs.getString(2);
            if(Nsub.equals(sub1))
            {
       %>
       <li>
           
           <a href='ShowNotes?id="+<%out.println(rs.getString(3));%>+"' target="libframe">
              <% out.println(rs.getString(1)); %>
           </a>
           
       </li>
     <%                     
        }}
    }catch(Exception ex){}
    %>  
                            </ol>
                        </div>
                        <div class="vidlist">
                            <ol class="vidol">
                            <%
    try{
        ResultSet rs= Admin.vidName();
        String sub=null;
        
        while(rs.next())
        {
            sub=rs.getString(2);
             String str=rs.getString(3);
             String str1=str.replace(".be/", "be.com/embed/");
            if(sub.equals(sub1)){
       %>
       <li><a href='ShowLink?id="+<%
           out.println(str1);%>+"' target="libframe"><%
           out.println(rs.getString(1));
       %></a>
       </li>
       
     <%     
        } }
    }catch(Exception ex){}
     
     %>   
    </ol>
    
    
                         </div>
                    </div>
                </div>
            </div>
            <div class="myframe">
                  <!--<input type="submit">-->
                  <iframe  src="images/dg_1.jpg" frameborder="1" name="libframe" class="frame1">  </iframe>
                <!--<iframe  src="Tempz" frameborder="1" name="libframe" class="frame1"> </iframe>-->
                
            </div>
        </div>

        <!------------------[ Library view ]------------------------>
        <div class="box3">
            <p class="footerp">created by Mr/Miss. KDRP designer. all rights reserved. </p>
        
        </div>
    
    </div>
    
    
    
    
</body>
</html>