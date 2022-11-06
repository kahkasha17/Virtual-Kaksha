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

public class noteAction extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String notename="",notesub="";
    FileItem file=null;
    HttpSession ses=req.getSession(true);
    String uid=(String)ses.getAttribute("uid");
    
    FileItemFactory fact=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(fact);
    try{
    List<FileItem> ph=upload.parseRequest(req);
    for(FileItem n:ph)
    {
        if(n.isFormField())
        {
            if(n.getFieldName().equals("notename"))
            {
                notename=n.getString();
            }
            if(n.getFieldName().equals("notecourse"))
            {
                notesub=n.getString();
            }
        }
        else
        {
            file=n;
        }
    }
    String msg=Admin.addNote(notename,uid, notesub, file);
    req.setAttribute("str", msg);
    if(uid.startsWith("A"))
        {
            req.getRequestDispatcher("Admin.jsp").forward(req, resp);
        }
        else
        {
            req.getRequestDispatcher("teacherlibrary.jsp?t=0").forward(req, resp);
        }
}catch(Exception ex){}

    }

}
