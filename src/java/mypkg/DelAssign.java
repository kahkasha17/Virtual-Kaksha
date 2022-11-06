package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelAssign extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try{
        
        String id=req.getParameter("id");
        String msg=Admin.A_Assign(id);
        req.getRequestDispatcher("Admin.jsp").forward(req, resp);
    
    }catch(Exception ex){System.out.println("Exception"+ex);}
        
        
    }

    
    
    
}
