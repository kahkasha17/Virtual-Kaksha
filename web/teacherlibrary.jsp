
<%@page import="mypkg.Admin"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Digital Library</title>
        <link rel="stylesheet" href="Css/teacherdiglib.css">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Js/teacherdigilib.js">
    </script>
    <!-- <script>
    </script> -->
</head>
<body>
     
      <% 
          
          
          
          String u=(String)session.getAttribute("uid");
         if(u==null)
         {
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }
          
          String t=request.getParameter("t");
            if(t!=null)
            {
                if(t.equals("0"))
                {        
        %>
        <script>
            alert("Notes Uploaded Successfully");
        </script>
        
        <%}}%>
    <div class="mainpage">
        <!--------------[ header ]----------------->
        <div class="box1">
            <img src="images/v1.png" alt="Logo of virtual class" class="headimg">
            <div class="links">
                <ul class="homelinks">
                    <li><a href="Teacher.jsp">Home</a></li>
                    <li><a href="teacherlibrary.jsp">E-books</a></li>
                    <li><a href="teacherlibrary.jsp">Notes</a></li>
                    <li><a href="teacherlibrary.jsp">Video Lecture</a></li>
                </ul>
            </div>
            
<%
    HttpSession ses=request.getSession(true);
    
    String tid=(String)ses.getAttribute("ids1");
    
    String name=(String)ses.getAttribute("nm1");
    
    String course=null;
    try {
            ResultSet pc=Admin.coursePassTch(tid);
            while(pc.next())
            {
                course=pc.getString(2);
            }
        } catch (Exception e) {
        }
%>
            <div class="stdnav">
                <ul class="stdnav-ul">
                    <li class="stdnav-ul-li" style="font-size:130%; width: 100%; text-transform: capitalize" >
                        Hii, ${name}<i class='bx bx-down-arrow ' id="btn1"></i>
                    </li>
                    <li class="stdnav-ul-li2">
                        <ul class="stdnav-ul-li2-ul">
                            <li><a href="Teacher.jsp">Home</a></li>
                            <li><a href="teach_profile.jsp">Your Profile</a></li>
                            <li><a href="assign.jsp">Assignments</a></li>
                            <li><a href="logOutAction">Sign out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--------------[ heading ]----------------->
        <div class="box2">
            <div class="libimg">
                <img src="images/digilib1.jpg"
                 alt="digital library pic" class="libpic">

            </div>
            <duv class="libheading">
                <h1 style="opacity: 1;">! Digital Library !</h1>
                <p class="libp">'Upload your notes, upload books and upload recorded sessions..'</p>
            </duv>
        </div>
        <!--------------[ 3 boxes ]----------------->
        <div class="box3">
            <div class="books">
                <div class="bookpic">
                    <img src="images/ebook.jpg" alt="E-book" class="bookimg">
                    <figcaption class="bookcap">You can upload your E-books here</figcaption>
                </div>
                <div class="bookbtn">
                    <button id="bookbtn2">Upload Books</button>
                </div>
            </div>
            <div class="notes">
                <div class="notepic">
                    <img src="images/enotes.jpg" alt="E-Notes" class="noteimg">
                    <figcaption class="notecap">You can upload your E-notes here</figcaption>
                </div>
                <div class="notebtn">
                    <button id="notebtn2">Upload notes</button>
                </div>

            </div>
            <div class="vids">
                <div class="notepic">
                    <img src="images/vids.jpg" alt="E-Videos" class="vidimg">
                    <figcaption class="vidcap">Upload your recorded sessions.</figcaption>
                </div>
                <div class="notebtn">
                    <button id="vidbtn2">Upload videos</button>
                </div>
                
            </div>
        </div>
        <!--------------[ notes ]----------------->
        <div class="box4">
            <div class="notehaed">
                <h1 class="noteh1">Upload and Manage all your hand written notes...</h1>
            </div>
            <div class="notelistandbox">
                <div class="notelist">
                    <h2 class="noteh2">Your current Uploaded Notes</h2>
                                        <ul class="noteul">
<%

    String noteuploadmsg=(String)request.getAttribute("str");
    
    System.out.println(noteuploadmsg);
    
    ResultSet rsnote=Admin.noteName();
    while(rsnote.next())
    {
        if(course.equals(rsnote.getString(2)))
        {
%>
<li class="noteli"><% out.println(rsnote.getString(1)); %></li>
<%
        }
    }
        
%>       </ul>
                </div>
                    <div class="notestepbtn">
                        <div class="notesteps">
                           <h2 class="steph2"> Steps to upload Hand written notes-</h2>
                        <ul class="stepul">
                            <li>Click a neat and clean picture of notes</li>
                            <li>Combile all pictures.</li>
                            <li>Create a pdf of your notes</li>
                           <li>Upload that pdf to the given upload button below.</li> 
                        </ul>
                        </div>
                        <div class="noteuploadbtn">
                            <form action="noteAction" style="width: 100%;height: 100%;" enctype="multipart/form-data" method="post">
                                <div class="noteform">
                                    <input required="true" type="text" name="notename" id="note" placeholder="Enter the title of notes"  class="notename" required>
                                    <input required="true" type="text" name="notecourse" value="<%=course%>" class="notename" readonly required>
                                    <input required="true" type="file" name="notefile" class="notefile" required>
                                    <input type="submit" value="Upload" class="noteupload" id="noteuploadbtn">
                                </div>
                            </form>
                                    
<c:set var="notemsg" value="<%=noteuploadmsg%>"/>
    
    <c:if test="${fn:startsWith(notemsg,'Notes')}">
        <script>
            alert("Notes is Added sucessfullyy");
        </script>
    </c:if>                                   
                        </div>
                    </div>
            </div>
        </div>
        <!--------------[ books ]----------------->
        <div class="box5">
            <div class="bookhaed">
                <h1 class="bookh1">Upload and Manage all your E-books..</h1>
            </div>
            <div class="booklistandbox">
                <div class="booklist">
                    <h2 class="bookh2">Your current Uploaded Books</h2>
                    <ul class="bookul">
<%
    String bookuploadmsg=(String)request.getAttribute("msg");
    System.out.println("Book messaggeeeeeee    iiiissss    "+bookuploadmsg);
    ResultSet rsbook=Admin.bookName();
    while(rsbook.next())
    {
        if(course.equals(rsbook.getString(2)))
        {
         
    %> 
    
    
    
                        <li class="bookli">
                            <% out.println(rsbook.getString(1)); %>
                        </li>
<%
        }
    }
%>                           
                    </ul>
                </div>
                    <div class="bookstepbtn">
                        <div class="booksteps">
                           <h2 class="booksteph2"> Steps to upload Books-</h2>
                        <ul class="bookstepul">
                            <li>Enter the name of the book</li>
                           <li>Upload that pdf to the given upload button below.</li> 
                        </ul>
                        </div>
                      
                        <div class="bookuploadbtn">
                            <form action="bookAction" style="width: 100%;height: 100%;" enctype="multipart/form-data" method="post">
                                <div class="bookform">
                                    <input type="text" name="bookname" id="book" placeholder="Enter the name of Book"  class="bookname" required>
                                    <input type="text" name="mycourse" value="<%out.println(course);%>" class="bookname" readonly required>
                                    <input type="file" name="bookfile" class="bookfile" required>
                                    <input type="submit" value="Upload" class="bookupload">
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>


<c:set var="bookmsg" value="<%=bookuploadmsg%>"/>
    
    <c:if test="${bookmsg!=null}">
        <c:if test="${fn:startsWith(bookmsg,'Book')}">
            <script>
                alert("Book is Added sucessfullyy");
            </script>
        </c:if>
        <c:if test="${!fn:startsWith(bookmsg,'Book')}">
            <script>
                alert("!!..Some exceptin error..!!");
            </script>
        </c:if>        
    </c:if>


        <!--------------[ videos ]----------------->
        <div class="box6">
            <div class="vidhaed">
                <h1 class="vidh1">Upload the recorded sessions of your classes..</h1>
            </div>
            <div class="vidlistandbox">
                <div class="vidlist">
                    <h2 class="vidh2">Your current Uploaded sessions</h2>
                    <ul class="vidul">
                        
     <%
         String viduploadmsg=(String)request.getAttribute("vidmsg");
         ResultSet rs2=Admin.vidName();
         System.out.println(viduploadmsg);
      while(rs2.next())
    {
        if(course.equals(rs2.getString(2)))
        {
         
    %>                  
                        <li class="vidli">
                            <% out.println(rs2.getString(1)); %>
                        </li>
<%
        }
    }
%> 
                    </ul>
                </div>
                    <div class="vidstepbtn">
                        <div class="vidsteps">
                           <h2 class="vidsteph2"> Steps to upload Videos-</h2>
                        <ul class="vidstepul">
                            <li>Enter the name of the Video Lecture</li>
                            
                           <li>Login to Virtual कक्षा YouTube Channel <p style="color: blue; display: inline;" onclick="ShowPass()">Click Here</p> before uploading videos.</li>
                           <li>Upload your Video on our Promoted YouTube channal 
                               <a href="https://www.youtube.com/channel/UCq5sU9vHAZRWin8x3NzdGhQ"target="_blank">Virtual कक्षा.</a>
                           </li> 
                           <script>
                               function ShowPass()
                               {
                                   alert("Virtual कक्षा YouTube ID is kaksha17820@gmail.com\nPassword is kah17sha820");
                               }
                           </script>
                           <li>Choose share option and select embed option</li>
                           <li>Copy that link and paste in the given box and upload it.</li>
                        </ul>
                        </div>
                        <div class="viduploadbtn">
                            <form action="vidAction" style="width: 100%;height: 100%;" method="post">
                                <div class="vidform">
                                    <input type="text" name="vidname" id="book" placeholder="Topic of today's class"  class="vidname" required>
                                    <input type="text" name="vidcourse" value="<%out.println(course);%>" class="vidname" readonly required>
                                    <input type="text" name="vidlink" class="vidfile" placeholder="Paste your link Here.." required>
                                    <input type="submit" value="Upload" class="vidupload" id="myvidbtn">
<c:set var="vidmsg" value="<%=viduploadmsg%>"/>
    
    <c:if test="${fn:startsWith(vidmsg,'Video')}">
        <script>
            alert("Video is Added sucessfullyy");
        </script>
    </c:if>                                   

                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
        <!--------------[ footer ]----------------->
        <div class="box7">
            <p class="footerp">created by Mr/Miss. PRKD designer. all rights reserved. </p>
        </div>
    </div>
</body>
</html>