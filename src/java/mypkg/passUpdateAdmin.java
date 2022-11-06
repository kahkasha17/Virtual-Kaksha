package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class passUpdateAdmin extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession ses=req.getSession();
//        Session aid=(Session)req.getAttribute("uid");
        String uid=(String)ses.getAttribute("uid");
        System.out.println(uid);
        String pass=req.getParameter("sspass");
        
        System.out.println(uid+"  "+pass);
        String p1=(String)ses.getAttribute("pass");
        String updpass=Admin.passUpdateAdmin(uid, pass);
           
        System.out.println(uid+"  "+pass+"  "+"  "+p1);
        req.setAttribute("updmsg",updpass);
        System.out.println(updpass);
        req.getRequestDispatcher("AdminProfile.jsp").forward(req, resp);
    }


}
