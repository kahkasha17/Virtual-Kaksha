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
    <title>Contact us Reply</title>
    <script>
        $(document).ready(function () {
            $("#btn1").click(function(){
                $(".ans").toggleClass("new-ans");
            });
        });

    </script>
</head>
<%
String str=request.getParameter("Qid");

session.setAttribute("str", str);
ResultSet rs=Admin.replys(str);
String nm=null;
String mail=null;
String mob=null;
String option=null;
String qry=null;
while(rs.next())
{
  nm=rs.getString(2);
  mail=rs.getString(3);
  option=rs.getString(4);
  mob=rs.getString(5);
  qry=rs.getString(6);
}


%>



<body>
    
    <div class="mainpage">
        <div class="startdiv">
            <div class="nav">
                <a href="Admin.jsp" style="width: 5%; height: 50%; text-align: right;"><img src="images/arrow.png" alt="back" height="100%"></a>
                <p class="fstp">Contact Us Reply</p>
                <a href="#" style="width: 10%; height: 90%; "><img src="images/v1.png" alt="logo" height="100%"></a>
            </div>
<%
    

%>
            <div class="form">
                <div class="myform">
                    <div class="realform">
                        <input type="text" name="myname" value ="<%out.print(nm);%>" placeholder="<%out.print(nm);%>" class="txtview">
                        <input type="email" class="txtview" placeholder="abc@gmail.com" value ="<%out.print(mail);%>">
                        <input type="number" name="mymob" placeholder="9211420420" class="txtview" value ="<%out.print(mob);%>">
                        <input type="text" name="entity" placeholder="Student or teacher" class="txtview" value ="<%out.print(option);%>">
                        <textarea name="myques" style="height: 35%;" id="ques" cols="20" rows="5"  class="txtview"><%out.print(qry);%></textarea>
                        <button style="background:linear-gradient(90deg,rgb(0, 0, 255),rgb(107, 209, 250)); color: white;" class="txtview" id="btn1">Reply</button>
                    </div>
                </div>
                <img src="images/replyimage.png" alt="reply image" width="38%" height="60%" style="margin-right:2% ;">
            </div>

            <div class="ans">
                <div class="ansdiv">Type your reply </div>
                <form action="ReplyAction" class="ansreply" method="post">
                    <div style=" width: 100%; height: 100%; display: flex; justify-content: space-around;align-items: center;">
                        <label for="mail">Send To</label><input type="email" style="height: 80%;" id="mail"  name="mymail"  placeholder="abc@gmail.com" value ="<%out.print(mail);%>" class="txt2">
                    </div>
                    
                    <div style="width: 100%; height: 100%; display: flex; justify-content: space-around;align-items: center;">
                        <label for="ques">Query:</label><textarea name="myques" style=" height: 70%;" id="ques" cols="20" rows="5" placeholder="Typee.. your query"  class="txt2"><%out.print(qry);%></textarea>
                    </div>
                    
                    <div style="width: 100%; height: 100%; display: flex; justify-content: space-around;align-items: center;">
                        <label for="ans">Answer:</label><textarea name="myans"  style=" height: 110%;"  id="ans" cols="20" rows="5" placeholder="Typee.. your Answer" class="txt2"></textarea>
                    </div>

                    <input type="submit" value="Send Now" id="btn3">
                </form>
            </div>
        </div>
    </div>
</body>
</html>