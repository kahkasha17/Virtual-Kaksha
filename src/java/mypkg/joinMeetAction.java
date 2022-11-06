/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANGELEVIL
 */
public class joinMeetAction extends HttpServlet 
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession ses=req.getSession(true);
        String course=(String)ses.getAttribute("course");
        
        try
        {
            String msg=Admin.delLive(course);
            ResultSet rs=Admin.joinLive(course);
            while(rs.next())
            {   
                String title=rs.getString(1);
                String url=rs.getString(2);
                ses.setAttribute("url", url);
                ses.setAttribute("title", title);
                if(url!=null)
                {
                    resp.sendRedirect(url);
                }
            }
        }catch(Exception ex)
        {
            
        }
    }
    
}
