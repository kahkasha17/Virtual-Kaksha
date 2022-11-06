/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANGELEVIL
 */
public class feedAction extends HttpServlet
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String[] rate=req.getParameterValues("rate");
        String rating=null;
        HttpSession ses=req.getSession(true);
        String uid=(String)ses.getAttribute("uid");
        String name=(String)ses.getAttribute("name");
        String Scourse=(String)ses.getAttribute("course");
        String Tcour1=(String)ses.getAttribute("cour1");
        for(String n:rate)
        {
            rating=n;
        }
        String rat=rating;
        String feed=req.getParameter("txt");
        System.out.println(rat+feed);
        try
        {
            if(uid.startsWith("S"))
            {
                String msg=Admin.feed(uid, Scourse, rat, feed, name);
                
            }
            if(uid.startsWith("F"))
            {
                String msg=Admin.feed(uid, Tcour1, rat, feed, name);
                
            }  
            req.getRequestDispatcher("feed.jsp?t=0").include(req, resp);
            
        }catch(Exception e){}
        
    }
    

    
}
