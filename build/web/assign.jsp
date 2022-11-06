<%@page import="mypkg.showPdf"%>
<%@page import="java.sql.Blob"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypkg.Admin"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assignment</title>
    <link rel="stylesheet" href="Css/assign.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <%
        
        String uid=(String)session.getAttribute("uid");
        String name=(String)session.getAttribute("name");
        String pd=(String)session.getAttribute("pd");
        String time=(String)session.getAttribute("time");
        String title=(String)session.getAttribute("title");
        String course=(String)session.getAttribute("course");
        String cour1=(String)session.getAttribute("cour1");
        String msg=(String)request.getAttribute("msg");

       
        if(uid==null)
            {
                
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
    %>
    
    <%
     String t=request.getParameter("t");
            if(t!=null)
            {
                if(t.equals("0"))
                {        
        %>
        <script>
            alert("Assignment Uploaded Successfully");
        </script>
        <%      }}   %>
    
    
        <nav class="navbar navbar-expand-lg navbar-light  ">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><img src="images/logo.jpg" alt=""></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                  <li class="nav-item navbar-dark">
                    <a class="nav-link active  abc " aria-current="page" href="#">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link abc" href="#updass">Upload Assignment</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link abc" href="#getass">Get Assignment</a>
                  </li>
                </ul>
                <div class="dropdown">
                    <button class="btn  dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false" style="text-transform:capitalize;">
                    Hi! <%out.println(name);%>
                   </button>
                  <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenu2">
                      <%if(uid.startsWith("F"))
                      {
                      %>
                      <li><a class="dropdown-item active" href="Teacher.jsp">Home</a></li>
                      <li><a class="dropdown-item" href="teach_profile.jsp">Profile</a></li>
                      <li><a class="dropdown-item" href="teacherlibrary.jsp">Digital Library</a></li>
                      <li><a class="dropdown-item" href="flive.jsp">Live Classes</a></li>
                      
                    <li><a class="dropdown-item" href="logOutAction">Sign out</a></li>
                    <%}
                    else if(uid.startsWith("S"))
                     {
                    %>
                    <li><a class="dropdown-item active" href="student.jsp">Home</a></li>
                    <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                    <li><a class="dropdown-item" href="student_library.jsp">Digital Library</a></li>
                    <li><a class="dropdown-item" href="slive.jsp">Live Classes</a></li>
                    <li><a class="dropdown-item" href="HelpandSupport.jsp">Help and Support</a></li>
                    <li><a class="dropdown-item" href="logOutAction">Sign out</a></li>
                    <%}%>
                  </ul>
                </div>
              </div>
            </div>
          </nav>
          <!--Navbar ends here  -->

          <!--Slider starts here  -->
          <div class="container" >
          <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                  <img src="images/assign.jpg" class="d-block w-100  " alt="...">
              </div>
              <div class="carousel-item">
                  <img src="images/assign2.jpg" class="d-block  w-100" alt="...">
              </div>
              <div class="carousel-item">
                  <img src="images/assign1.jpg" class="d-block w-100 " alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
        <br>
          <!-- Slider ends here -->
          <!-- Get Assignment Start -->
          <div class="container-fluid">
              <div class="row align-items-start mainrow " id="updass">
              <div class="col ">
                <div class="card text-center">
                  <div class="card-body">
                    <h5 class="card-title">Upload Assignment Here</h5>
                    <form class="d-flex" action="AssignAction"enctype="multipart/form-data" method="post">
                        <input class="form-control me-2" type="text" name="Title" placeholder="Enter File Title"style=" ">
                         <% if(uid.startsWith("F")){%>
                      <label for="date" style="margin-left:1%">Last Day Of Submission:</label>
                      <input class="form-control" type="date" name="date" id="date"style="margin-right:2%;margin-left:1%; width: 50%" >
                     <%}%>
                        <input class="form-control me-2" type="file" name="pdf"style="padding:10px">
                      <button class="btn btn-outline-success" type="submit"style="width: 30%">Upload</button>
                     
                    </form>
                    <br>
                    <%if(uid.startsWith("F")){%>
                    <a href="#" class="btn btn-primary " onclick="toggle()">See Your Uploaded File Here</a><%}%>
                  </div>
                </div>
              </div>
              </div>
                    <br><br>                       
                    <div class="row align-items-start mainrow " id="getass">       
              <div class="col">
                <div class="card text-center">
                  <div class="card-body ck">
                    <h5 class="card-title">Get Assignment Here</h5>
                    <p class="card-text">Get your Assignment here please click download button to download your assignment in your system </p>
                    <a href="#" class="btn btn-primary " onclick="togg()">Get Your Assignment Here</a>
                  </div>
                </div>
              </div>
              </div>
          </div>
              <br><br>                       
            <div class="row align-items-center bg-primary tglupd" id="upd" >
                
              <div class="table-responsive">
                <table class="table table-hover table-success table-striped  caption-top">
                    <caption style="font-family: cursive;font-weight: bolder;font-size: 200%;color: black;text-align: center;">List of Uploaded Files</caption>
                  <thead>
                    <tr>
                      <th scope="col">UID</th>
                      <th scope="col">Name</th>
                      <th scope="col">Uploaded PDF</th>
                      <th scope="col">Title</th>
                      <th scope="col">Last Date of Submission</th>
                    </tr>
                  </thead>
                  <%  
                    try{
                    ResultSet rs=Admin.getAssign(uid);
                    ResultSet qs=Admin.fGetAssignDown(cour1);            
                    ResultSet s=Admin.SGetAssignDown(course);            
                     while(rs.next())
                    {    
                        System.out.println("HEllo Jaan3");
                        
                  %>
                  <tbody>                  
                      <tr>
                      <th scope="row"><%out.println(rs.getString(2));%></th>
                      <td><% out.println(rs.getString(5)); %></td>
                      <td><a  target="_blank" href=showPdf?t=<%out.println(rs.getString(1));%>>PDF</a></td>
                      <td><%out.println(rs.getString(4));%></td>
                      <td><%out.println(rs.getString(8));%></td>
                    <%}%>
                    </tr>
                  </tbody>
                </table>
              </div>
              </div>
            <div class="row align-items-center bg-success tglget" id="get">
                <div class="col">
                  <table class="table table-hover table-success table-striped caption-top">
                      <% if(uid.startsWith("F")){%>
                             <caption style="font-family: cursive;font-weight: bolder;font-size: 200%;color: black;text-align: center;">Student Uploaded Files</caption>
                             <%}else{%>
                            <caption style="font-family: cursive;font-weight: bolder;font-size: 200%;color: black;text-align: center;">Your Assignment</caption>
                             
                     <%}%>
                    <thead>
                      <tr>
                      <th scope="col">UID</th>                     
                      <%if(uid.startsWith("S")){%> 
                      <th scope="col">Name</th>
                      <th scope="col">Title of the Assignment</th>
                      <th scope="col">Your Assignmnet</th>
                      <th scope="col">Last Day Of Submission</th>
                      <%}else{%>
                      <th scope="col">Student's Name</th>
                      <th scope="col">Title of the Assignment</th>
                      <th scope="col">Student's Assignmnet</th>
                      <th scope="col">Date Of Submission</th>
                      <%}%>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                          if(uid.startsWith("F"))
                          while(qs.next())
                        {    
                            System.out.println("HEllo Jaan3");
                      %>
                      <tr>  
                        <th scope="row"><%out.println(qs.getString(2));%></th>
                        <td><%out.println(qs.getString(5));%></td>
                        <td><%out.println(qs.getString(4));%></td>
                        <td><a href=showPdf?t=<%out.println(qs.getString(1));%>>PDF</a></td>
                        <td><%out.println(qs.getString(9));%></td>
                      </tr>
                      <%
                         }
                          else if(uid.startsWith("S"))
                          {
                          while(s.next())
                        {    
                            System.out.println("HEllo Jaan3");
                      %>
                      <tr>  
                        <th scope="row"><%out.println(s.getString(2));%></th>
                        <td><%out.println(s.getString(5));%></td>
                        <td><%out.println(s.getString(4));%></td>
                        <td><a  href=showPdf?t=<%out.println(s.getString(1));%>>Click Here to Download</a></td>
                        <td><%out.println(s.getString(8));%></td>
                      </tr>
                      <%}}}catch(Exception ex){}%>  
                    </tbody>
                  </table>
                </div>
              
              </div>
            </div>
            <div class="container-fluid">
              <div class="row align-items-start mainrow">
                <div class="col bg-dark foot ">
                  Designed by PRDK Designer
                  </div>
                </div>
              </div>
    <script>
    function toggle()
    {
    var toggle = document.getElementById("upd");
    var toggle1 = document.getElementById("get");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
      toggle1.style.display ="none";
    } 
  }
  function togg()
    {
    var toggle = document.getElementById("get");
    var toggle1 = document.getElementById("upd");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
      toggle1.style.display ="none";
    } 
  }
  </script>          
</body>
</html>
