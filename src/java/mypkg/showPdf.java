package mypkg;
import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANGELEVIL
 */
public class showPdf extends HttpServlet 
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        Blob pdf;
        HttpSession ses=req.getSession(true);
        String t=req.getParameter("t");
        try
        {
           ResultSet rs=Admin.getPdf(t);
           
            while(rs.next())
            {               
            pdf=rs.getBlob(1);
            byte data[]=pdf.getBytes(1,(int)pdf.length());
            ServletOutputStream out=resp.getOutputStream();
            out.write(data);
            } 
        }catch(Exception ex){}
        
    }   
    


}
