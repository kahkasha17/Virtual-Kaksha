package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowLink extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        PrintWriter out=resp.getWriter();
                
        try {
            ResultSet rs=Admin.showVid(id);
            if(rs.next())
            {
                String str=rs.getString(1);
                String str2=str.replace(".be/", "be.com/embed/");
              resp.sendRedirect(str2);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShowLink.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }


}
