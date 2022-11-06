
package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

public class HelpAction extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try{
        HttpSession ses=req.getSession(true);
        String uid=(String)ses.getAttribute("uid");
        
        String mail=(String)ses.getAttribute("mail");
        
        
        String mail1=(String)ses.getAttribute("mail1");
          
        String name =(String)ses.getAttribute("nm");

        String nm1=(String)ses.getAttribute("nm1");
        
        String cour=(String)ses.getAttribute("course");
        String cour1=(String)ses.getAttribute("cour1");
        String txtar=req.getParameter("txtarea");
      
        
        
      System.out.println("Hello is this working or not");
        
//        out.println("Hello is this working or not1212121");
//        String id=(String)ses.getAttribute("uid");
        
//        out.println("Hello is this working989898");
        
//        out.println("After Name ");
//       out.println("After Txtar");
//       out.println("After Txtar25");
if(uid.startsWith("S"))
{ 
    String str=Admin.HlpandSprt(uid,name,cour,txtar,mail); 
}

if(uid.startsWith("F"))
{
    String str=Admin.HlpandSprt(uid,nm1,cour1,txtar,mail1);
    
}
//        out.println("After Admin method");
//        ses.setAttribute("msg", str);
//        out.println("After Attribute");
      
       
      }catch(Exception ex){System.out.println("Exception is:"+ex);}  
     
      
      try{
          ResultSet rs=Admin.HS_getMail();
          String name=null;
          String mails=null;
          while(rs.next())
          {
              name=rs.getString(2);
              mails=rs.getString(5);
          }
          
          
//        String fromEmail[]={"kaksha17820virtual@gmail.com"};
//        String password="Vir17tual820";
        String tomail=mails;
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
         Session ses1=Session.getInstance(pr, new Authenticator(){

         protected PasswordAuthentication getPasswordAuthentication(){
           return new PasswordAuthentication("kaksha17820virtual@gmail.com","lqfejnrpnfkaqmbg");
         }  
     });
            ses1.setDebug(true);
           Message msg=new MimeMessage(ses1);   
       InternetAddress inrt=new InternetAddress("kaksha17820virtual@gmail.com");
           msg.setFrom(inrt);
         msg.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
         msg.setRecipient(Message.RecipientType.BCC,new InternetAddress(BCC));
        msg.setSubject("User Email Verification");
   
        msg.setText("Hello"+" "+name+" Your Query is Sumbitted to Us we Will get Back to your Query As Soon As Possible");
        Transport.send(msg);   
        req.setAttribute("msg",msg); 
        
          
        }catch(Exception ex){System.out.println("Here is the position!!!!"+ex);  }
      
      
      
      req.getRequestDispatcher("HelpandSupport.jsp").forward(req, resp);
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }

    
    
    
    
    
}
    













