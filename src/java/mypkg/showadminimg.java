package mypkg;
import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class showadminimg extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        System.out.println("Hello"+id);
        try{
        ResultSet rs=Admin.getAdminProfileImg(id);
        while(rs.next())
        {
            Blob b=rs.getBlob(1);
            byte[] data=b.getBytes(1,(int) b.length());
            ServletOutputStream out=resp.getOutputStream();
            out.write(data);
        }
        }catch(Exception ex){}
    }
    
}
