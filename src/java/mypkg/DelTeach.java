package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelTeach extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try{
         String id=req.getParameter("sid");
         System.out.println("Heelo friends Chai peelo");
        String t_msg=Admin.A_DelTeach(id);
        System.out.println("Heelo friends Chai peelo paape khaa lo dubara se ");
        
         req.getRequestDispatcher("Admin.jsp").forward(req, resp);
    }catch(Exception ex){}    
    
    }


    
           
    
    
}
