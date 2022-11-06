<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypkg.Admin"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Module</title>
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" type="text/css" href="Css/AdminM.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script src="Js/js.js"></script>
  <script src="Js/admin.js"></script>

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
            alert("Reply send Successfully");
        </script>
        <%      } }
        %>
  <div class="main">

    <div class="pic">
        <a href="index.jsp"> <img src="images/logo.jpg" alt="Loading..."></a>
    </div>


    <div class="logout">

    </div>


    <div class="navs">
        <i class="fa fa-sign-out" id="signout" aria-hidden="true"><a href="logOutAction" style="color: white;text-decoration: none" >LogOut</a></i>
      <ul type="none">
        <li> <a href="#Student_Det">Home</a></li>

        <li> <a href="#Student_Det">Student</a></li>

        <li> <a href="#Teacher_Det">Faculty</a></li>

        <li> <a href="AdminProfile.jsp">Profile</a></li>

        
      </ul>

    </div>



    <div class="sidebar">
      <div class="btn_one">
        <label for="check">
          <i class="bx bx-menu" id="myicon2"></i>
        </label>
      </div>

      <input type="checkbox" id="check" hidden>

      <div class="logo">
        <div class="M_logo">
          <a href="#">Admin Panel</a>

        </div>
        <div class="btn_two">
          <label for="check">
            <i class="fa fa-times" id="icon1"></i>
          </label>
        </div>
        <div class="menu">

          <ul class="menuss">
            <li>
              <a href="A_Profile.jsp"><i class="bx bx-user-pin"></i>Profile Details</a>
            </li>
            <li>
            <li>
              <a href="#Student_Det"><i class="bx bx-user-pin"></i>Student Details</a>
            </li>
            <li>
              <a href="#Teacher_Det"><i class="bx bx-user-pin"></i>Teacher Details</a>
            </li>
            <li>
              <a href="#ContactUs"><i class="bx bxs-contact"></i>Contact Us Details</a>
            </li>
            <li>
              <a href="#Book"><i class="bx bx-book"></i>
                Books Details</a>
            </li>
<!--            <li>
              <a href="#Notes"><i class="bx bxs-book-content"></i>Notes Details</a>
            </li>-->
            <li>
              <a href="has.jsp"><i class="bx bxs-videos"></i>Help And Support</a>
            </li>
            <li>
              <a href="#Assign"><i class="fa fa-tasks"></i>Assignment Details</a>
            </li>
            <li>
                <a href="feed.jsp" target="_blank"><i class=" bx bxs-contact  "></i>Feedback</a>
            </li>
            <li>
              <a href="logOutAction"><i class="fa fa-sign-out"></i>Log Out</a>
            </li>
            
          </ul>

<!--          <div class="media">
            <a href="https://www.youtube.com/channel/UCq5sU9vHAZRWin8x3NzdGhQ"><i class="bx bxl-youtube"></i></a>
            <a href=""><i class="bx bxl-instagram"></i></a>
            <a href=""><i class="bx bxl-facebook"></i></a>
          </div>-->

        </div>
      </div>
    </div>

    <div class="panels">

      <div class="User_Det">
        <p class="para"> Active Users (<%=db.DB.active_users %>) </p>

        <ul class="users">
            <%
                Set<String> ar = db.DB.getUsers();
                for(String n : ar)
                  out.println("<li>"+n+"</li>");
            %>
            
        </ul>

        
      </div>



    </div>

<!--      
<script>  
           document.getElementById("Student_Show").onClick=function() {
           
           document.getElementById("Student_Det").style.display="none";
            
           }             
      </script>-->


    <div class="mainDet"style="margin-bottom: 10%; ">

      <div class="Student" id="Student_Det">
        <!-- <img src="Images/regis.jpg" style="width:32%; height: 100%;"> -->

        <h1>Student  Section</h1>

        <div class="btns">
            <a href="std_regis.jsp"><button> Add Student</button></a>
          <button id="Student_Show" class="butn"> Student Details </button>
        </div>
      </div>

        <div class="stud_det" style="overflow-x: hidden;overflow-y: auto; height: 200px;">
          
        <table  class="content">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Email</th>
              <th>Mobile</th>
              <th>Course</th>
              <th>Student Registered</th>
              <th>Action</th>                        
            </tr>
          </thead>
          <% 
            try{
          
                ResultSet rs= Admin.Student_Det();
                
                
                
             while(rs.next())
            {
          %>
          <tbody>
              <tr>
                  
          
                  <td><%out.println("SVKID100"+rs.getString(1));%></td>
                  <td style="text-transform: capitalize"><%out.println(rs.getString(2)+" "+rs.getString(3));%></td>
                  <td><%out.println(rs.getString(5));%></td>
                  <td><%out.println(rs.getString(6));%></td>
                  <td><%out.println(rs.getString(9));%></td>
                  <td><%out.println(rs.getString(11));%></td>
                  <td><a href='DelStd?e=<%out.print(rs.getString(1));%>'>Delete</a> | <a target="_blank" href='UpdStud?e=<%out.println(rs.getString(1));%>'> Modify</a></td>
<!--                  <td><a href='DelStd?e="<%out.print(rs.getString(1));%>"'>Delete</a> | <a href='p'> Modify</a></td>-->
              </tr>
          </tbody>
        <%
         
        
           }
           }catch(Exception ex){}            
        
        %>

        </table>

      </div>

      <div class="Student1" id="Teacher_Det"> 
        <h1>Teacher  Section</h1>
        <div class="btns">
            <a href="teach_regis.jsp" style="text-decoration:none"> <button>Add Teacher</button> </a>
             <button id="Teach_Det">Teacher Details </button>
        </div>
      </div>

      <div class="teach_det"  style="overflow-x: hidden;overflow-y: auto; height: 200px;">
        <table  class="content">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Email</th>
              <th>Mobile</th>
              <th>Course</th>
              <th>Teacher Registered</th>
              <th>Action</th>              
          
            </tr>
          </thead>
<%
    try{
    ResultSet rs=Admin.Teacher_Det();
    while(rs.next())
    {
%>
          <tbody>
            <tr>
              <td><%out.println("FVKID100"+rs.getString(1));%></td>
              <td style="text-transform: capitalize"><%out.println(rs.getString(2)+" "+rs.getString(3));%></td>
              <td><%out.println(rs.getString(5));%></td>
              <td><%out.println(rs.getString(6));%></td>
              <td><%out.println(rs.getString(9));%></td>
              <td><%out.println(rs.getString(11));%></td>
              <td><a href='DelTeach?sid=<%out.print(rs.getString(1));%>'>Delete</a> | <a target="_blank" href='Updteach?e=<%out.println(rs.getString(1));%>'> Modify</a></td>
            </tr>
          </tbody>
     <%
         }
}catch(Exception ex){}
     %>
        </table>

      </div>

      <div class="Student2" id="ContactUs">
        <h1> Contact Us</h1>
        <div class="btns">
            <!--<a href="reply.jsp"><button>Reply</button></a>-->
          <button id="Contact_Det">Contact Us Details</button>
        </div>
      </div>

      <div class="contact_det"  style="overflow-x: hidden;overflow-y: auto; height: 200px;">

        <table class="content">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Email</th>
              <th>Option</th>
              <th>Course</th>
              <th>Query_Sent_On</th>
              <th>Action</th>              
            
            </tr>
          </thead>

          <%
 try{
              ResultSet rs=Admin.Contact_Det();
              while(rs.next()){
              
          %>
          <tbody>
            <tr>
                <td><%out.println("QVKID100"+rs.getString(1));%></td>
                <td><%out.println(rs.getString(2));%></td>
                <td><%out.println(rs.getString(3));%></td>
                <td><%out.println(rs.getString(4));%></td>
                <td><%out.println(rs.getString(5));%></td>
                <td><%out.println(rs.getString(7));%></td>
                <td><a href='DelContact?Qid=<%out.print(rs.getString(1));%>'>Delete</a>| <a href='reply.jsp?Qid=<%out.println(rs.getString(1));%>'>Reply</a></td>
            </tr>
          </tbody>
     <%
         }
}catch(Exception ex){}
     %>       </table>

      </div>

     
     
     
      <div class="Student3" id="HAS">
        <h1>Help And Support</h1>
        <div class="btns">
            <button id="Has_Det">Help Support Details</button>
        </div>
      </div>

      <div class="has_det" style="overflow-x: hidden;overflow-y: auto; height: 200px;">
        <table  class="content">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Course</th>
              <th>Query</th>
              <th>Mail</th>
              <th>Action</th>
             </tr>
          </thead>
          <%
 try{
              ResultSet rs=Admin.HS_getMail();
              while(rs.next()){              
          %>
          
          <tbody>
            <tr>
              <td><%out.println(rs.getString(1));%> </td>
              <td><%out.println(rs.getString(2));%> </td>
              <td><%out.println(rs.getString(3));%> </td>
              <td><%out.println(rs.getString(4));%> </td>
              <td><%out.println(rs.getString(5));%> </td>              
              <td><a href='DelHas?did=<%out.print(rs.getString(1));%>'>Delete</a> 
<!--                  | <a href='hlpsuppreply.jsp?hid=<%out.println(rs.getString(1)); %>'>Reply</a>-->
              </td>
            </tr>
          </tbody>
        <%
        }
}catch(Exception ex){}
        %>
        
        
        
        
        
        </table>

      </div>
     
     
     
     
     
     
     
     

      <div class="Student3" id="Assign">
        <h1>Assignments   Section</h1>
        <div class="btns">
            <a onclick="toggle()"><button>Add Assignment</button></a>
            <button id="Assign_Det">Assignments Details</button>
        </div>
      </div>

      <div class="assign_det"  style="overflow-x: hidden;overflow-y: auto; height: 200px;">
        <table  class="content">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Assign</th>
              <th>Title</th>
              <th>Last day of Submission</th>
              <th>Action</th>
             </tr>
          </thead>
          <%
 try{
                
              ResultSet rs=Admin.Assign();
              while(rs.next()){
                  
          %>
          
          <tbody>
            <tr>
              <td><%out.println(rs.getString(1));%> </td>
              <td><%out.println(rs.getString(2));%> </td>
              <td><a href='showPdf?t="<%out.println(rs.getString(1));%>"'>PDF</a> </td>
              
              <td><%out.println(rs.getString(4));%> </td>
              <td><%out.println(rs.getString(8));%> </td>
              <td><a href='DelAssign?id="<%out.print(rs.getString(1));%>"'>Delete</a></td>
            </tr>
          </tbody>
        <%
        }
}catch(Exception ex){}
        %>
        
        
        
        
        
        </table>

      </div>
        
        
 <!--Assignment Upload-->       
        <div class="add" id="add" style="text-align: center;padding: 2%;z-index:99; " >
            <form action="AssignAction"enctype="multipart/form-data" method="post">
                <i class="fa fa-close" id="close" onclick="toggle()" style="font-size:20px; color: white;margin-left:400px "></i>
                <h3 style="font-family: cursive">Assignment Upload</h3><br>
                <table style="background-color:transparent;border-radius:0px;width:100%  ">
                    <tr>
                        <td style="background-color: transparent">
                           <label for="course" >Select Course:</label>
                        </td>
                        <td style="background-color: transparent;">
                           <select required name="mycourse"   id="course" style="background:transparent;color: white;border: none;margin-left: -37% ">
                               <option value="" >Select  Course..</option> 
                                <option value="C programming" style="color: black">C Programming</option>
                                <option value="C++" style="color: black">C++</option>
                                <option value="Python" style="color: black">PYTHON</option>
                                <option value="Java" style="color: black">JAVA</option>
                                <option value="DataBase management System" style="color: black">DBMS</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: transparent">
                           <label for="File" >Upload Your File:</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="file" name="pdf" id="File"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: transparent">
                           <label for="date" >Last Day Of Submission:</label> 
                        </td>
                        <td style="background-color: transparent">
                            <input type="date" name="date" id="date"  style="background:transparent;color: white;border: none;margin-left:-50%;  ">
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: transparent">
                           <label for="Title" >Title of The Assignment:</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="text" id="Title"name="Title" placeholder="eg.Java ch-1" style="background:transparent;color: white;border: none;margin-left:-30%  "/>
                        </td>
                    </tr>
                </table>            
                <button class="addbtn" type="submit ">Submit</button>  
            </form>
        </div>
 
 
 
 
 
 
 
 
 
<!--Book upload-->
<div class="add" id="addbook" style="text-align: center;padding: 2%;z-index:99;" >
            <form action="bookAction"enctype="multipart/form-data" method="post">
                <i class="fa fa-close"  onclick="toggli()" style="font-size:20px; color: white;margin-left:400px "></i>
                <h3 style="font-family: cursive">Books Upload</h3><br>
                <table style="background-color:transparent;border-radius:0px;width:100%  ">
                    <tr>
                        <td style="background-color: transparent">
                           <label for="course" >Select Course:</label>
                        </td>
                        <td style="background-color: transparent;">
                           <select required name="mycourse"   id="course" style="background:transparent;color: white;border: none;margin-left: -37% ">
                               <option value="" >Select Course..</option> 
                                <option value="C programming" style="color: black">C Programming</option>
                                <option value="C++" style="color: black">C++</option>
                                <option value="Python" style="color: black">PYTHON</option>
                                <option value="Java" style="color: black">JAVA</option>
                                <option value="DataBase management System" style="color: black">DBMS</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: transparent">
                           <label for="File" >Upload Your Book:</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="file" name="pdf" id="File"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="background-color: transparent">
                           <label for="Title" >Title of The Book</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="text" id="Title"name="bookname" placeholder="eg.Java" style="background:transparent;color: white;border: none;margin-left:-30%  "/>
                        </td>
                    </tr>
                </table>            
                <button class="addbtn" type="submit ">Submit</button>  
            </form>
        </div>


<!--Add Notes-->
<div class="add" id="addnotes" style="text-align: center;padding: 2%;z-index:99;">
            <form action="noteAction"enctype="multipart/form-data" method="post">
                <i class="fa fa-close"  onclick="toggla()" style="font-size:20px; color: white;margin-left:400px "></i>
                <h3 style="font-family: cursive">Notes Upload</h3><br>
                <table style="background-color:transparent;border-radius:0px;width:100%  ">
                    <tr>
                        <td style="background-color: transparent">
                           <label for="course" >Select Course:</label>
                        </td>
                        <td style="background-color: transparent;">
                           <select required name="notecourse"   id="course" style="background:transparent;color: white;border: none;margin-left: -37% ">
                               <option value="" >Select Course..</option> 
                                <option value="C programming" style="color: black">C Programming</option>
                                <option value="C++" style="color: black">C++</option>
                                <option value="Python" style="color: black">PYTHON</option>
                                <option value="Java" style="color: black">JAVA</option>
                                <option value="DataBase management System" style="color: black">DBMS</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: transparent">
                           <label for="File" >Upload Your Book:</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="file" name="pdf" id="File"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="background-color: transparent">
                           <label for="Title" >Title of The Note</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="text" id="Title"name="notename" placeholder="eg.Java" style="background:transparent;color: white;border: none;margin-left:-30%  "/>
                        </td>
                    </tr>
                </table>            
                <button class="addbtn" type="submit ">Submit</button>  
            </form>
        </div>  





<!--video upload-->
<!--<div class="add" id="addvideo" style="text-align: center;padding: 2%;z-index:99;">
            <form action="vidAction" method="post">
                <i class="fa fa-close"  onclick="togglaa()" style="font-size:20px; color: white;margin-left:400px "></i>
                <h3 style="font-family: cursive">Videos Upload</h3><br>
                <table style="background-color:transparent;border-radius:0px;width:100%  ">
                    <tr>
                        <td style="background-color: transparent">
                           <label for="course" >Select Course:</label>
                        </td>
                        <td style="background-color: transparent;">
                            <select required name="vidcourse"   id="course" style="background:transparent;color: white;border: none;margin-left: -37% ">
                               <option value="" >Select Course..</option> 
                                <option value="C programming" style="color: black">C Programming</option>
                                <option value="C++" style="color: black">C++</option>
                                <option value="Python" style="color: black">PYTHON</option>
                                <option value="Java" style="color: black">JAVA</option>
                                <option value="DataBase management System" style="color: black">DBMS</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: transparent">
                           <label for="Url" >Paste Your Url Here:</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="text"  name="vidlink" id="Url" placeholder="eg.https://youtu.be/WUQZPKnmwPI" style="background:transparent;color: white;border: none;margin-left:-30%  "/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="background-color: transparent">
                           <label for="Title" >Title of The Video</label>
                        </td>
                        <td style="background-color: transparent">
                            <input type="text" id="Title" name="vidname" placeholder="eg.Java" style="background:transparent;color: white;border: none;margin-left:-30%  "/>
                        </td>
                    </tr>
                </table>            
                <button class="addbtn" type="submit ">Submit</button>  
            </form>
        </div>
-->


        
        
        
        
        
        
        
      <div class="Student4" id="Book">

        <h1> Books  Section</h1>
        <div class="btns">
          <!-- <button>Books Uploaded</button> -->
          <a onclick="toggli()"><button>Add Books </button></a>
          <button id="Book_Det">Books Uploaded </button>
        </div>
      </div>

<div class="book_det" style="overflow-x: hidden;overflow-y: auto; height: 200px;">
        <table  class="content">
          <thead>
            <tr>
              <th>Id</th>
              <th>Book_Name</th>
              <th>Subject_Name</th>
              <th>PDF</th>
              <th>Uploaded Date</th>
              <th>Action</th>
            </tr>
          </thead>
<%
   try{
ResultSet rs=Admin.Books();
ResultSet sr=Admin.bookName();
while(rs.next() && sr.next())
{
%>
          <tbody>
            <tr>
            
              <td><%out.println(rs.getString(2));%></td>
              <td><%out.println(rs.getString(3));%></td>
              <td><%out.println(rs.getString(4));%></td>
              <td><a target="_blank" href='ShowBook?id="<%out.println(sr.getString(3));%>"'>PDF</a></td>
              <td><%out.println(rs.getString(6));%></td>
              <td><a href='DelBooks?bid="<%out.print(rs.getString(1));%>"'>Delete</a> </td>
            </tr>
          </tbody>
   <%
   }

   }catch(Exception ex){}
 %>  
        </table>

   </div>

        
        
      <div class="Student5" id="Notes">
        <h1>Notes  Section</h1>
        <div class="btns">
            <a onclick="toggla()"><button>Add Notes </button></a>
            <button id="Notes_Det">Uploaded Notes </button>
        </div>
      </div>


        <div class="notes_det" style="overflow-x: hidden;overflow-y: auto; height: 200px;">
        <table  class="content">
          <thead>
            <tr>
              <th>Id</th>
              <th>Note_Name</th>
              <th>Subject_Name</th>
              <th>PDF</th>
              <th>Uploaded Date</th>
              <th>Active</th> 
            </tr>
          </thead>
<%
   try{
ResultSet rs=Admin.Notes();
ResultSet sr=Admin.noteName();
while(rs.next() && sr.next())
{
%>
          <tbody>
           <tr>
              <td><%out.println(rs.getString(2));%></td>
              <td><%out.println(rs.getString(3));%></td>
              <td><%out.println(rs.getString(4));%></td>
              <td><a target="_blank" href='ShowNotes?id="<%out.println(sr.getString(3));%>"'>PDF</a></td>
              <td><%out.println(rs.getString(6));%></td>
              <td><a href='DelNotes?nid="<%out.print(rs.getString(1));%>"'>Delete</a></td>
           </tr>
          </tbody>
   <%
   }
}catch(Exception ex){}
   %>           </table>

      </div>

      
   
   
   
   
   
   
   
   
<%
//try{
//   ResultSet rs=Admin.Videos();
//   while(rs.next())
//   {
%>
          <!--<tbody>-->
            <!--<tr>-->
              <!--<td><%
                  //out.println(rs.getString(1));%></td>-->
              <!--<td><%
                  //out.println(rs.getString(2));%></td>-->
              <!--<td><% 
//out.println(rs.getString(3));%></td>-->
              <!--<td><%
                  //out.println(rs.getString(4));%></td>-->
              <!--<td><%
                  //out.println(rs.getString(5));%></td>-->
<!--              <td><a href='DelVideo?vid="
                     
                     <%
                        // out.print(rs.getString(1));
                     %>"'>Delete</a></td>
            </tr>
          </tbody>-->
<%
//   }
//}catch(Exception ex){}

%> 
<!--       </table>
     
      </div>-->

    <!--</div>-->


<script>
    function toggle()
    {
    var toggle = document.getElementById("add");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
    } 
  }
    function toggli()
    {
    var toggle = document.getElementById("addbook");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
    } 
  }
 
  function toggla()
    {
    var toggle = document.getElementById("addnotes");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
    } 
  }
  function togglaa()
    {
    var toggle = document.getElementById("addvideo");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
    } 
  }
 
</script>

    </div>


</body>

</html>