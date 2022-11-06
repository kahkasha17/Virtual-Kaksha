/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANGELEVIL
 */
public class UpdStud extends HttpServlet
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String t=req.getParameter("e");
        HttpSession ses=req.getSession(true);
        ses.setAttribute("ids",t);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
        
    }
    

}
