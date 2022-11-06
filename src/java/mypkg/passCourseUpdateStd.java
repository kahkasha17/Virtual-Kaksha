package mypkg;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class passCourseUpdateStd extends HttpServlet 
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses=req.getSession(true);
        String sid=(String)ses.getAttribute("ids");
        
        String uid=(String)ses.getAttribute("uid");
        System.out.println(uid);
        
        String fpass=null;
        String fcourse=null;
        fpass=req.getParameter("sspass");
        fcourse=req.getParameter("sscourse");      

        System.out.println("-----------------------"+sid+"  "+fpass+"  "+fcourse);  
        String updpass=null;
        
        String p1=null,c1=null;
        try {
            ResultSet pc=Admin.coursePassStd(sid);
            while(pc.next())
            {
                p1=pc.getString(1);
                c1=pc.getString(2);
            }
        } catch (Exception e) {
            System.out.println("Exeption in Course pass Student is "+e);
        }
        
        if(uid.startsWith("A"))
        {
            String t=req.getParameter("e");
            System.out.println(t);
            String c2=" ";
            String p2=" ";
            try
            {
                ResultSet rs=Admin.DetSt(t);
                while(rs.next())
                {
                    c2=rs.getString(9);
                     p2=rs.getString(4);
                     System.out.println(p2);
                    if(fpass.equals(" ") || fcourse!=null)
                         {
                            String pass2= Admin.passCourseUpdateStd(p2, fcourse,t );
                            System.out.println("hello pass null k liy");
                            req.getRequestDispatcher("profile.jsp").forward(req, resp);
                            }

                     else if(fcourse.equals(" ") || fpass!=null)
                            {
                                String pass3=Admin.passCourseUpdateStd(fpass, c2, t);
                                 System.out.println("hello2");
                                 req.getRequestDispatcher("profile.jsp").forward(req, resp);
                            }

               }                
            }catch(Exception ex)
            {
                System.out.println("Exception is:-"+ex);
            }
            
        }
        else
        if(uid.startsWith("S"))
        {       
            if(fpass.length()!=0 && fcourse.length()!=0)
            {
                System.out.println("1st");
                updpass=Admin.passCourseUpdateStd( fpass,fcourse, sid);
            }else if(fpass.length()!=0 && fcourse.length()==0)
            {
                System.out.println("2nd");
                updpass=Admin.passCourseUpdateStd( fpass,c1, sid);
            }else if(fpass.length()==0 && fcourse.length()!=0)
            {
                System.out.println("3rd");
                updpass=Admin.passCourseUpdateStd(p1,fcourse, sid);
            }else
            {
                System.out.println("4th");
                updpass=Admin.passCourseUpdateStd(p1,c1, sid);
            }
        }
            
        System.out.println(sid+"  "+fpass+"  "+fcourse+"  "+c1+"  "+p1);
        req.setAttribute("updmsg",updpass);
        System.out.println(updpass);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
    
}
