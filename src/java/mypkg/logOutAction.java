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
public class logOutAction extends HttpServlet
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession ses=req.getSession(true);
        String uid=(String)ses.getAttribute("uid");
        String pass=(String)ses.getAttribute("pass");
        String name=(String)ses.getAttribute("name");
        Admin.logOutDetails(uid, pass, name);
         if(uid==null)
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        if(uid!=null)
           db.DB.delUser(uid);
//        try
//        {
//            ResultSet rs=Admin.login(uid, pass);
//            while(rs.next())
//            {
//                Admin.logOutDetails(rs.getString(1),rs.getString(2),rs.getString(3));
//            }
//        }catch(Exception es){}
        
        
        
        ses.invalidate();
        
        req.getRequestDispatcher("index.jsp?t=1").forward(req, resp);
    }
    

}
