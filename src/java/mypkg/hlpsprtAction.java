/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Security;
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

public class hlpsprtAction extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //help and support  reply  Action here     
        
    
    
    
            String mail1=req.getParameter("mymail1");
            String ques1=req.getParameter("myques1");;
            String ans1=req.getParameter("myans1");
          String st=(String)req.getAttribute("str1");
         String rsn=Admin.hlpsendrply(mail1, ques1, ans1);
           
        try{
            String tomail=mail1;
            String BCC="kaksha17820virtual@gmail.com";
           Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Properties ps=new Properties();
           ps.setProperty("mail.smtp.host","smtp.gmail.com");
            ps.setProperty("mail.smtp.port","465");
            ps.setProperty("mail.smtp.auth","true");
            ps.setProperty("mail.smtp.starttls.enable","true");
            ps.put("mail.smtp.SocketFactory.port", "465");
            ps.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
                //getting Session
                System.out.println("Line 1 is working...");
         Session ses=Session.getInstance(ps, new Authenticator() {
         @Override
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
        msg.setSubject("User Help and Support Query Reply");
   
        msg.setText("Hey There!!\n\nYour query is successfully recieved.\n"
                    + "Answer of your Query:"+ans1+"\n\n\t\t ....Happy Learning....");
             Transport.send(msg);
        req.setAttribute("ansmsg1",rsn); 
            System.out.println("This line is working.....");
        req.getRequestDispatcher("Admin.jsp?t=0").forward(req, resp);
            
        }catch(Exception ex){
            
        }
         
         
    }

    
    
    
}
