
package mypkg;  

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class T_UpdAction extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        HttpSession ses=req.getSession(true);
        //LoginAction se uthayi hai  sirf UID and st
        String uid=(String)ses.getAttribute("uid");
        int st=Integer.parseInt((String)ses.getAttribute("ids1"));
        String nm=(String)ses.getAttribute("name");
        String str1=(String)ses.getAttribute("ids1");
        
     resp.getWriter().print(nm);
        
        
        
        
        //yeh Teacher ke Profile ka data pick kar rha hai ...........
        
        String fnm=req.getParameter("fname");
        String lnm=req.getParameter("lname"); 
//        String pass=req.getParameter("mypass");
        String mail=req.getParameter("mymail");
        String mob=req.getParameter("mymob");
        String dob=req.getParameter("mydob");
        String gen=req.getParameter("gen");
        String Address=req.getParameter("myadd1");
        String nm3=fnm+" "+lnm; 
        resp.getWriter().print("Hello1452");
        String str=Admin.T_udpDet(str1,fnm, lnm,mail, mob, dob,gen, Address,nm3,str1);     
        resp.getWriter().print("Hello14525655");
        ses.setAttribute("str", str);
        req.getRequestDispatcher("teach_profile.jsp").forward(req, resp);
        
        
        
        
        
        
        
        
        
        
    }
    
    

    
            
    
    
   
    
    
}
