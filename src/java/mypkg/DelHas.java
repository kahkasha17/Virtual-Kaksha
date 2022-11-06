package mypkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelHas extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   try{
        String id=req.getParameter("did");
        String d_msg=Admin.A_delHas(id);
         req.getRequestDispatcher("Admin.jsp").forward(req, resp);
   }catch(Exception ex){} 
   }
    
    
   
    
    
    

}
