package mypkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class vidAction extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("vidname");
        String course=req.getParameter("vidcourse");
        String link=req.getParameter("vidlink");
        HttpSession ses=req.getSession(true);
        String uid=(String)ses.getAttribute("uid");
        System.out.println(name+" "+course+" "+link+" "+uid);
        String str=Admin.addVideo(name,uid, course, link);
        req.setAttribute("vidmsg", str);
        System.out.println(str);
        if(uid.startsWith("A"))
        {
            req.getRequestDispatcher("Admin.jsp").forward(req, resp);
        }
        else
        {
            req.getRequestDispatcher("teacherlibrary.jsp").forward(req, resp);
        }
    }

}
