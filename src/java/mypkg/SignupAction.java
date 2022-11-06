package mypkg;
import java.io.IOException;
import java.security.Security;
import java.sql.ResultSet;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SignupAction extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("service ,method called");
        String fname=req.getParameter("fname");
        String lname=req.getParameter("lname");
        String pass=req.getParameter("mypass");
        String mail=req.getParameter("mymail");
        String mob=req.getParameter("mymob");
        String dob=req.getParameter("mydob");
        String[] s=req.getParameterValues("gen");
        String course=req.getParameter("mycourse");
        String address=req.getParameter("myadd");
        System.out.println("Details get sucessfully");
        String gen=null;
        for(String n:s)
        {
            gen=n;
        }
        String gen2=gen;
        
        System.out.println(fname+"   "+lname+"    "+pass+"  "+mail);
        
        String msg1=Admin.addStudent(fname, lname, pass, mail, mob, dob, gen2, course, address);
        System.out.println(fname+" "+lname+" "+ pass+" "+mail+" "+mob+" "+dob+" "+gen2+" "+course+" "+address);
        System.out.println("add student method called");
        
        try{
            System.out.println(msg1);
            
            String id3=msg1.substring(8);
            System.out.println("line is working after substring id is "+id3);
            ResultSet rs=Admin.stdmail(id3);
            System.out.println("line is working after stdmailmethod");
            String id2="",name1="",name2="",pass3="",mail1="";
            if(rs.next())
            {
                String id=rs.getString(1);
                id2="SVKID100"+id;
                name1=rs.getString(2);
                name2=rs.getString(3);
                pass3=rs.getString(4);
                mail1=rs.getString(5);
            }
            System.out.println("working mail successfully");
            System.out.println("id"+id2+" "+name1+" "+name2+" "+pass3+" "+mail1);
               String tomail=mail;
               String BCC="kaksha17820virtual@gmail.com";
        
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Properties pr=new Properties();
            pr.setProperty("mail.smtp.host","smtp.gmail.com");
            pr.setProperty("mail.smtp.port","465");
            pr.setProperty("mail.smtp.auth","true");
            pr.setProperty("mail.smtp.starttls.enable","true");
            pr.put("mail.smtp.SocketFactory.port", "465");
            pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            
            
            //getting Session
         Session ses=Session.getInstance(pr, new Authenticator() {

         protected PasswordAuthentication getPasswordAuthentication(){
           return new PasswordAuthentication("kaksha17820virtual@gmail.com","lqfejnrpnfkaqmbg");
         }  
     });
            ses.setDebug(true);
           Message msg=new MimeMessage(ses);   
       InternetAddress inrt=new InternetAddress("kaksha17820virtual@gmail.com");
           msg.setFrom(inrt);
         msg.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
         msg.setRecipient(Message.RecipientType.BCC,new InternetAddress(BCC));
        msg.setSubject("User Email Verification");
   
        msg.setText("Hey "+name1+" "+name2+"!!\n\nYou are successfully Registered To virtual Classroom.\n"
                    + "Welcome to your Online Classroom where you can connect with your teachers and learn your courses...\n\nHere is your Login ID : "+id2+"\n"
                            + "Here is Your Password "+pass3+"\n\n\t\t ....Happy Learning....");
             Transport.send(msg);
        req.setAttribute("msg",msg); 
        
          
        }catch(Exception ex){
            System.out.println("Here is the position!!!!"+ex);  
        }
     
    req.getRequestDispatcher("std_regis.jsp?t=2").forward(req, resp);
        
    }
}  