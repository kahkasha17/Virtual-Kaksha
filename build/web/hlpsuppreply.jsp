<%-- 
    Document   : hlpsuppreply
    Created on : Aug 15, 2022, 4:07:02 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypkg.Admin"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Css/reply.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Help Support Reply</title>
    <script>
        $(document).ready(function () {
            $("#btn1").click(function(){
                $(".ans").toggleClass("new-ans");
            });
        });

    </script>
</head>
<%
 
    
    String u=(String)session.getAttribute("uid");
         if(u==null)
         {
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }
        String hr=request.getParameter("hid");
        session.setAttribute("hids", hr);
        String nam=null;
        String email=null;
        String course=null;
//        String enty=null;
        String qry=null;
        
        ResultSet rm=Admin.hlprply(hr);
        while(rm.next())
        {
            nam=rm.getString(2);
            System.out.println(nam);
            course=rm.getString(3);
            System.out.println(course);
            email=rm.getString(5);
            System.out.println(email);
            qry=rm.getString(4);
            System.out.println(qry);
        }
        
    %>



<body>
    
    <div class="mainpage">
        <div class="startdiv">
            <div class="nav">
                <a href="Admin.jsp" style="width: 5%; height: 50%; text-align: right;"><img src="images/arrow.png" alt="back" height="100%"></a>
                <p class="fstp">Reply</p>
                <a href="#" style="width: 10%; height: 90%; "><img src="images/v1.png" alt="logo" height="100%"></a>
            </div>
<%
    

%>
            <div class="form">
                <div class="myform">
                    <div class="realform">
                        <input type="text" name="myname1" value ="<%out.print(nam);%>" placeholder="Name" class="txtview">
                        <input type="email" class="txtview" placeholder="abc@gmail.com" value ="<%out.print(email);%>">
                        <input type="text" name="mycourse" placeholder="Course" class="txtview" value="<%out.println(course);%>">
                        <!--<input type="text" name="entity1" placeholder="Student or teacher" class="txtview" value ="<% //out.print("hello");%>">-->
                        <textarea name="myques1" style="height: 35%;" id="ques" cols="20" rows="5" placeholder="Query Asked !!" class="txtview"><%out.print(qry);%></textarea>
                        <button style="background:linear-gradient(90deg,rgb(0, 0, 255),rgb(107, 209, 250)); color: white;" class="txtview" id="btn1">Reply</button>
                    </div>
                </div>
                <img src="images/sprt.png"  alt="reply image" id="imgsprt" width="" height="60%" style="margin-right:2%; align-content: stretch">
            </div>

            <div class="ans">
                <div class="ansdiv">Type your reply </div>
                <form action="hlpsprtAction" class="ansreply" method="post">
                    <div style=" width: 100%; height: 100%; display: flex; justify-content: space-around;align-items: center;">
                        <label for="mail">Send To</label><input type="email" style="height: 80%;" placeholder="abc@gmail.com" id="mail"  name="mymail1"  placeholder="abc@gmail.com" value ="<%out.print(email);%>" class="txt2">
                    </div>
                    
                    <div style="width: 100%; height: 100%; display: flex; justify-content: space-around;align-items: center;">
                        <label for="ques">Query:</label><textarea name="myques1" placeholder="Query Asked !!" style=" height: 70%;" id="ques" cols="20" rows="5" placeholder="Typee.. your query"  class="txt2"><%out.print(qry);%></textarea>
                    </div>
                    
                    <div style="width: 100%; height: 100%; display: flex; justify-content: space-around;align-items: center;">
                        <label for="ans">Answer:</label><textarea name="myans1"  style=" height: 110%;"  id="ans" cols="20" rows="5" placeholder="Typee.. your Answer" class="txt2"></textarea>
                    </div>

                    <input type="submit" value="Send Now" id="btn3">
                </form>
            </div>
        </div>
    </div>
</body>
</html>

