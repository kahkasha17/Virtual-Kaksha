package mypkg;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANGELEVIL
 */
public class fLiveAction extends HttpServlet
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        
        HttpSession ses=req.getSession(true);
        PrintWriter out=resp.getWriter();
        String uid=(String)ses.getAttribute("uid");
        String url=req.getParameter("url");
        String title=req.getParameter("title");
        String name=(String)ses.getAttribute("name");
        String course=(String)ses.getAttribute("cour1");
        
            String msg=Admin.fLive(url, title,name,uid, course);    
            out.println("<script> alert(\"Meeting Hosted Successfully"+"\"); </script>");         
            req.setAttribute(msg, "Successfully inserted");
            System.out.println("Live class");
            req.getRequestDispatcher("flive.jsp").include(req, resp);
          
    }
    

}
