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

/**
 *
 * @author ANGELEVIL
 */
public class fpwAction extends HttpServlet 
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
      String uid=req.getParameter("uid");
     
      try
        {
         HttpSession ses=req.getSession(true);
         System.out.println("Hello Mom I love to spend time with u  ");      
         ResultSet rs=Admin.fpw(uid); 
         ResultSet sr=Admin.sfpwmail(uid);
         ResultSet fr=Admin.ffpwmail(uid);
         String mail;
         
            
            if(uid.startsWith("S")) 
            {      
                
                if(sr.next())
                 {
                     mail=sr.getString(5);
                  
                    ses.setAttribute("mail", mail);
                    if(rs.next())
                        {

                            String pass= rs.getString(2); 
                            String name=rs.getString(3);
                            ses.setAttribute("uid", uid);
                            ses.setAttribute("pass", pass);
                            String tomail=mail; 
                            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider()); 
                            Properties pr=new Properties(); 
                            pr.setProperty("mail.smtp.host","smtp.gmail.com"); 
                            pr.setProperty("mail.smtp.port","465"); 
                            pr.setProperty("mail.smtp.auth","true"); 
                            pr.setProperty("mail.smtp.starttls.enable","true"); 
                            pr.put("mail.smtp.SocketFactory.port", "465"); 
                            pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");           
            //getting Session 
                            Session s=Session.getInstance(pr, new Authenticator() { 
                            protected PasswordAuthentication getPasswordAuthentication(){ 
                                return new PasswordAuthentication("kaksha17820virtual@gmail.com","lqfejnrpnfkaqmbg"); 
                                }   
                            }); 
            s.setDebug(true); 
           Message msg=new MimeMessage(s);    
       InternetAddress inrt=new InternetAddress("kaksha17820virtual@gmail.com"); 
           msg.setFrom(inrt); 
         msg.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail)); 
        
        msg.setSubject("User Email Verification"); 
        msg.setText("Hi "+name+" , your pw is :- "+pass+" Your virtual id is :-"+uid); 
        Transport.send(msg);    
          
          req.setAttribute("msg",msg);  
                            
                            
                            req.getRequestDispatcher("forgetPw.jsp").forward(req, resp);
                        }
                 }
            }
            else if(uid.startsWith("F"))
                    {
                        
                        if(fr.next())
                        {
                           mail=fr.getString(5);
                           ses.setAttribute("mail", mail);
                           if(rs.next())
                                {

                                    String pass= rs.getString(2);           
                                    String name= rs.getString(3);           
                                    ses.setAttribute("uid", uid);
                                    ses.setAttribute("pass", pass);
                                    PrintWriter out= resp.getWriter();
                                    String tomail=mail; 
                            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider()); 
                            Properties pr=new Properties(); 
                            pr.setProperty("mail.smtp.host","smtp.gmail.com"); 
                            pr.setProperty("mail.smtp.port","465"); 
                            pr.setProperty("mail.smtp.auth","true"); 
                            pr.setProperty("mail.smtp.starttls.enable","true"); 
                            pr.put("mail.smtp.SocketFactory.port", "465"); 
                            pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");           
            //getting Session 
                            Session s=Session.getInstance(pr, new Authenticator() { 
                            protected PasswordAuthentication getPasswordAuthentication(){ 
                                return new PasswordAuthentication("kaksha17820virtual@gmail.com","lqfejnrpnfkaqmbg"); 
                                }   
                            }); 
            s.setDebug(true); 
           Message msg=new MimeMessage(s);    
       InternetAddress inrt=new InternetAddress("kaksha17820virtual@gmail.com"); 
           msg.setFrom(inrt); 
         msg.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail)); 
        
        msg.setSubject("User Email Verification"); 
        msg.setText("Hi "+name+" , your pw is :- "+pass+" Your virtual id is :-"+uid); 
        Transport.send(msg);    
          
          req.setAttribute("msg",msg);  
          
                            
                            
                                    
                                }
                        }
                        
                    }
            
              
        }
        
     catch(Exception e)
        {
            System.out.println(e);
        } 
      req.getRequestDispatcher("forgetPw.jsp?t=0").forward(req, resp);
    }

}