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
public class DelStd extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try{
                String id=req.getParameter("e");
                System.out.println("id"+ id);
                String msg=Admin.A_DelStud(id);
                
                System.out.println("Heelo friends Chai peelo paape khaa lo ");
                req.getRequestDispatcher("Admin.jsp").forward(req, resp);
                
        
        }catch(Exception ex){ System.out.println("Exception is"+ex);}
    }
                
}