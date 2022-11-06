/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author Dell
 */
public class Contact_Us extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        String name=req.getParameter("nm");
        String email=req.getParameter("email");
        String options=req.getParameter("Options");
        String mobile=req.getParameter("mobile");
        String qta=req.getParameter("qta");
        
        String st=mypkg.Admin.addContactus(name, email, options, mobile, qta);
        req.setAttribute("st", st);
 String sname=null;
 String str=null;
 String str1=null;
 try{
     ResultSet rs=Admin.getId();
     while(rs.next())//this is used becoz that fetching next data  from the table or fetching each record 
         //of the table
     {
    str1=rs.getString(2);     
    str=rs.getString(3);     
    sname="VKQID100"+rs.getString(1); 
     }
     req.setAttribute("nme",sname);
     req.setAttribute("names",str1);
     req.setAttribute("str",str);
 }catch(Exception ex){}
       
        
        try{
            
//        String fromEmail[]={"kaksha17820virtual@gmail.com"};
//        String password="Vir17tual820";
        String tomail=str;
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
        msg.setSubject("User Query Verification");
   
        msg.setText("Hello,"+str1+" We recieved your Query having the QueryId:- "+sname+". We will get Back to you as soon as Possible");
        Transport.send(msg);   
        req.setAttribute("msg",msg); 
        
          
        }catch(Exception ex){System.out.println("Here is the position!!!!"+ex);  }
     
        
    req.getRequestDispatcher("index.jsp?t=3").forward(req, resp);
        
    
    }

    
    
    
    
    
    
    
}
