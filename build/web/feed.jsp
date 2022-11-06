<%-- 
    Document   : feed
    Created on : 4 Jun, 2022, 2:49:21 PM
    Author     : ANGELEVIL
--%>

<%@page import="mypkg.Admin"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FeedBack</title>
    <link rel="stylesheet" href="Css/feed.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
</head>
<% 
    String uid=(String)session.getAttribute("uid");
    String name=(String)session.getAttribute("name");
    String course=(String)session.getAttribute("course");
    String cour=(String)session.getAttribute("cour");
    
 if(uid==null)
            {
                
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
%>

<% String t=request.getParameter("t");
            if(t!=null)
            {
                if(t.equals("0"))
                {        
        %>
        <script>
            alert("Your Feedback is Submitted with us");
        </script>
        <%      } }   %>  
<body>
    <nav class="navbar navbar-expand-lg navbar-light  ">
        <div class="container-fluid" style="height: 70px;">
            <a class="navbar-brand" href="index.jsp"><img src="images/logo.jpg" alt=""></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
              <li class="nav-item navbar-dark">
                <a class="nav-link   abc " aria-current="page" href="#" style="color: white;">FEEDBACK</a>
              </li>
              
            </ul>
            <div class="dropdown">
              <button class="btn  dropdown-toggle"  type="button" id="dropdownMenu2"  data-bs-toggle="dropdown" aria-expanded="false" style="color: white; font-weight: bold; text-transform:capitalize;">
                Hi! <%out.println(name);%>
              </button>
              <%
                  if(uid.startsWith("S"))
                  {
              %>
              <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenu2">
                  <li><a class="dropdown-item active" href="student.jsp">Home</a></li>
                  <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                  <li><a class="dropdown-item" href="student_library.jsp">Digital Library</a></li>
                  <li><a class="dropdown-item" href="HelpandSupport.jsp">Help and Support</a></li>
                <li><a class="dropdown-item" href="logOutAction">Sign out</a></li>
                
              </ul>
               </div>
          </div>
        </div>
      </nav>
      <!--Navbar ends here  -->
      <div class="container border">
        <div class="row">
          <div class="col p-3  head">
            How Satisfied are you with our service 
          </div>
          
      
          <!-- Force next columns to break to new line -->
          <div class="w-100"></div>
      
          <div class="col imgg">
              <img src="images/download1.png" alt="" style="width: 10%;"/>
                
              <img src="images/n4.png" alt="" style="width: 10%;"/>
            
              <img src="images/sat1.png" alt=""style="width: 10%;"/> 
          </div>
          <div class="w-100"></div>
          <div class="col rate">
              <form action="feedAction">
                <div class="form-check form-check-inline inp ">
                    <input class="form-check-input" type="radio" name="rate" id="inlineRadio1" value="unhappy">
                  <label class="form-check-label" for="inlineRadio1">UNHAPPY</label>
                </div>
                <div class="form-check form-check-inline inp1">
                  <input class="form-check-input" type="radio" name="rate" id="inlineRadio2" value="neutral">
                  <label class="form-check-label" for="inlineRadio2">NEUTRAL</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="rate" id="inlineRadio3" value="satisfied" >
                  <label class="form-check-label" for="inlineRadio3" required="">SATISFIED</label>
                </div>
                <div class="form-floating ">
                    <textarea class="form-control " placeholder="Leave a comment here" id="floatingTextarea2" maxlength="500"name="txt" style="height: 200px"></textarea>
                  <label for="floatingTextarea2">Comments <small style="color: red;">(optional:Max-600char)</small></label>
                </div>
                  <div class="w-100"></div>
          <div class="col">
            <button class="btn cbtn text-white" style="position: relative;float: right; margin-top:1% ; margin-right: 2%; margin-bottom: 1%; font-weight: bolder; font-size: large;" type="submit">&nbsp &nbsp Submit &nbsp &nbsp</button>
          </div>
              </form>   
          </div>
          
        </div>
      </div>
      <div class="w-100"></div>
      <div class="container-fluid "style="margin-top: .6%;">
        <div class="row align-items-start mainrow">
          <div class="col bg-dark foot ">
            Designed by PRDK Designer
            </div>
          </div>
        </div>
            <%}%>  
            <%
                  if(uid.startsWith("F"))
                  {
              %>
              <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenu2">
                  <li><a class="dropdown-item active" href="Teacher.jsp">Home</a></li>
                  <li><a class="dropdown-item" href="teach_profile.jsp">Profile</a></li>
                  <li><a class="dropdown-item" href="teacherlibrary.jsp">Digital Library</a></li>
                  
                <li><a class="dropdown-item" href="logOutAction">Sign out</a></li>
                
              </ul>
               </div>
          </div>
        </div>
      </nav>
      <!--Navbar ends here  -->
      <div class="container border">
        <div class="row">
          <div class="col p-3  head">
            How Satisfied are you with our service 
          </div>
          
      
          <!-- Force next columns to break to new line -->
          <div class="w-100"></div>
      
          <div class="col imgg">
              <img src="images/download1.png" alt="" style="width: 10%;"/>
                
              <img src="images/n4.png" alt="" style="width: 10%;"/>
            
              <img src="images/sat1.png" alt=""style="width: 10%;"/> 
          </div>
          <div class="w-100"></div>
          <div class="col rate">
              <form action="feedAction">
                <div class="form-check form-check-inline inp ">
                    <input class="form-check-input" type="radio"  name="rate" id="inlineRadio1" value="unhappy">
                  <label class="form-check-label" for="inlineRadio1">UNHAPPY</label>
                </div>
                <div class="form-check form-check-inline inp1">
                  <input class="form-check-input" type="radio" name="rate" id="inlineRadio2" value="neutral">
                  <label class="form-check-label" for="inlineRadio2">NEUTRAL</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="rate" id="inlineRadio3" value="satisfied" >
                  <label class="form-check-label" for="inlineRadio3" required="">SATISFIED</label>
                </div>
                <div class="form-floating ">
                    <textarea class="form-control " placeholder="Leave a comment here"maxlength="500" id="floatingTextarea2"name="txt" style="height: 200px"></textarea>
                  <label for="floatingTextarea2">Comments <small style="color: red;">(optional:Max-600char)</small></label>
                </div>
                  <div class="w-100"></div>
          <div class="col">
            <button class="btn cbtn text-white" style="position: relative;float: right; margin-top:1% ; margin-right: 2%; margin-bottom: 1%; font-weight: bolder; font-size: large;" type="submit">&nbsp &nbsp Submit &nbsp &nbsp</button>
          </div>
              </form>   
          </div>
          
        </div>
      </div>
      <div class="w-100"></div>
      <div class="container-fluid "style="margin-top: .6%;">
        <div class="row align-items-start mainrow">
          <div class="col bg-dark foot ">
            Designed by PRDK Designer
            </div>
          </div>
        </div>
            <%}%>  
            
            
            
            
            
            
         
            <%
                  if(uid.startsWith("A"))
                  {
              %>
              <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenu2">
                  <li><a class="dropdown-item active" href="Admin.jsp">Home</a></li>
                  <li><a class="dropdown-item" href="AdminProfile.jsp">Profile</a></li>
                  <li><a class="dropdown-item" href="logOutAction">Sign out</a></li>
                
              </ul>
              </div>
          </div>
        </div>
      </nav>
      <!--Navbar ends here  -->
      <div class="container" style="margin-top: 2%;margin-bottom: 4%;">
          
          <table class="table table-hover table-primary "style="">
  <thead>
    <tr>
      <th scope="col">Sr.No</th>
      <th scope="col">VID</th>
      <th scope="col">Name</th>
      <th scope="col">Course</th>
      <th scope="col">Rate</th>
      <th scope="col">Feedback</th>
      <th scope="col">Mode</th>
      <th scope="col">Date</th>  
    </tr>
  </thead>
  <tbody>
    <%
        ResultSet rs=Admin.showFeed();
        int counter=1;
        while(rs.next())
        {
            
        
    %>
    <tr >
      <th scope="row"><%out.println(counter++);%></th>
      <td><%out.println(rs.getString(2));%></td>
      <td><%out.println(rs.getString(3));%></td>
      <td><%out.println(rs.getString(4));%></td>
      <td><%out.println(rs.getString(6));%></td>
      <td class="over"><%out.println(rs.getString(7));%></td>
      <td><%out.println(rs.getString(5));%></td>
      <td><%out.println(rs.getString(8));%></td>
    </tr>
   <%}%> 
  </tbody>
</table>  
      </div>         
          <div class="w-100"></div>
      <div class="container-fluid fixed-bottom  hov"style="">
        <div class="row align-items-start mainrow">
            <div class="col bg-dark foot " >
            Designed by PRDK Designer
            </div>
          </div>
        </div>
      </div>
      
          
        
      
            <%}%>  
            
      <!--Admin end-->      
           
      
      
</body>
</html>
