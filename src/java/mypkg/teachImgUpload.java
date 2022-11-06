package mypkg;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class teachImgUpload extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id="";
        FileItem ph=null;
        try{
            FileItemFactory fact=new DiskFileItemFactory();
            ServletFileUpload up=new ServletFileUpload(fact);
            List<FileItem> lst=up.parseRequest(req);
            for(FileItem i:lst)
            {
                if(i.isFormField())
                {
                    if(i.getFieldName().equals("myid"))
                    {
                        id=i.getString();
                    }
                }else{
                    ph=i;
                }
            }
            String str=Admin.uploadImage(id, ph);
            req.setAttribute("addmsg", str);
            req.getRequestDispatcher("teach_profile.jsp").forward(req, resp);
        }catch(Exception ex){}
    }
    public static String stduploadImage(String sid,FileItem img)
 {
     try{
         
         PreparedStatement ps=db.DB.getCon().prepareStatement("insert into upload_stdimg(sid,image,lastmodified) values(?,?,now());");
         ps.setString(1, sid);
         ps.setBinaryStream(2, img.getInputStream());
         int i=ps.executeUpdate();
         if(i==1)
             return "Added sucessfully";
         else
             return "Some error occur";
     }catch(Exception ex){ return "Exception is"+ex;}
 }
}
