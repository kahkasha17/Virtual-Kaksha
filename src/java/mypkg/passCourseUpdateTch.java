package mypkg;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class passCourseUpdateTch extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses=req.getSession();
        String sid=(String)ses.getAttribute("ids1");     
        
        String pass=req.getParameter("sspass");
        String course=req.getParameter("sscourse");       
        
        System.out.println(sid+"  "+pass+"              "+course);
        
        String updpass=null;
        
        String p1=null,c1=null;
        try {
            ResultSet pc=Admin.coursePassTch(sid);
            while(pc.next())
            {
                p1=pc.getString(1);
                c1=pc.getString(2);
            }
        } catch (Exception e) {
            System.out.println("Exeption in Course pass tecaher is "+e);
        }
        
        if(pass.length()==0 || course.length()!=0)
        {
            updpass=Admin.passCourseUpdateTch(p1, course, sid);
            System.out.println("hello");
        }
        else if(pass.length()!=0 || course.length()==0)
        {
            updpass=Admin.passCourseUpdateTch(pass, c1, sid);
        }
        else if(pass.length()!=0 || course.length()!=0)
        {
            updpass=Admin.passCourseUpdateTch(pass, course, sid);
        }else{
            updpass=Admin.passCourseUpdateTch(p1, c1, sid);
        }
        
        System.out.println(sid+"  "+pass+"  "+course+"  "+c1+"  "+p1);
        req.setAttribute("updmsgtch",updpass);
        System.out.println(updpass);
        req.getRequestDispatcher("teach_profile.jsp").forward(req, resp);
    }


}
