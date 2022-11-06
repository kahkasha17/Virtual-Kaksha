package mypkg;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AdminImgUpdate extends HttpServlet {
 @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id="AVKID1001";
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
//                        id=i.getString();
                        System.out.println("my id"+id);
                    }
                }else{
                    ph=i;
                }
            }
            System.out.println("Update"+id);
            String str=Admin.updateAdminProfileImg(id, ph);
            System.out.println("Not working");
            System.out.println(str);
            req.setAttribute("updmsg", str);
            req.getRequestDispatcher("AdminProfile.jsp").forward(req, resp);
        }catch(Exception ex){}
    }

}
