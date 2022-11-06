package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class DelNotes extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        
        try{
        
        String nid=req.getParameter("nid");
        String msg=Admin.A_Notes(nid);
        req.getRequestDispatcher("Admin.jsp").forward(req, resp);
    
    }catch(Exception ex){System.out.println("Exception"+ex);}
        
    
    }

    

    
    
    
}
