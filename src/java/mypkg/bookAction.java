package mypkg;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class bookAction extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        
        String bname="",course="";
        HttpSession ses=req.getSession(true);
        String uid=(String)ses.getAttribute("uid");
        FileItem bk=null;
        FileItemFactory fact=new DiskFileItemFactory();
        ServletFileUpload upload=new ServletFileUpload(fact);
        List<FileItem> lst=null;
        try{
        lst=upload.parseRequest(req);
            for (FileItem n : lst) 
            {
                if(n.isFormField())
                {
                    if(n.getFieldName().equals("bookname"))
                    {
                        bname=n.getString();
                    }
                    if(n.getFieldName().equals("mycourse"))
                    {
                        course=n.getString();
                    }
                }else
                {
                    bk=n;
                }
            }
        String msg=Admin.addBook(bname,uid, course, bk);
        System.out.println("This line is working "+bname);
        req.setAttribute("msg",msg);
        if(uid.startsWith("A"))
        {
            req.getRequestDispatcher("Admin.jsp").forward(req, resp);
        }
        else
        {
            req.getRequestDispatcher("teacherlibrary.jsp").forward(req, resp);
        }
        
        }
        catch(Exception ex){
        }
        
        
    }
}
