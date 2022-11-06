package mypkg;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author ANGELEVIL
 */
public class U_AssignAction extends HttpServlet
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String Title="";
        String date=null;
        
            HttpSession ses=req.getSession(true);
            PrintWriter out=resp.getWriter();
         //   String uid=(String)ses.getAttribute("uid");
            String id=req.getParameter("t");
            System.out.println(id);
            String Name=(String)ses.getAttribute("name");
         //   String course=(String)ses.getAttribute("course");// student
         //   String cour1=(String)ses.getAttribute("cour1");// faculty
            System.out.println("Hello Assignment");
                   
        FileItem pdf=null;
        try{
        FileItemFactory fact=new DiskFileItemFactory();
        ServletFileUpload upload=new ServletFileUpload(fact);
        List<FileItem> list=upload.parseRequest(req);
        System.out.println("Hello Assignment3");
        
            for (FileItem n : list) 
            {
                if(n.isFormField())
                {
                    if(n.getFieldName().equals("Title"))
                    {
                        Title=n.getString();
                        System.out.println("Hello Assignment3");
                    }

                    if(n.getFieldName().equals("date"))
                    {
                        date=n.getString();
                        System.out.println("Hello Assignment3");
                    }
                }else
                {
                    pdf=n;
                }
                
            }
            
            System.out.println(pdf.getSize());
            long fsize = pdf.getSize()/1024; // convert into byte to kb
            if(fsize<=1024)
            {    
                    
                String msg=Admin.U_assign(id, pdf, Title, date);
                System.out.println(msg);
                req.setAttribute("msg",msg);
                System.out.println("This line is working "+msg);
                req.getRequestDispatcher("Admin.jsp").forward(req, resp);
            }
    
            else
            {

               out.println("<script> alert(\"Sorry U can upload max 1mb file"+"\"); </script>");
                req.setAttribute("msg", "Sorry U can upload max 1MB file.");
            }
            req.getRequestDispatcher("Admin.jsp").include(req, resp);
        }   
        catch(Exception ex){System.out.println("Exception is "+ex);
        
        }
        
        
    }
        
        
        
    }
    


