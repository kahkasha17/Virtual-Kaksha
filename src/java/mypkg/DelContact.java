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


public class DelContact extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try{
        
       String id=req.getParameter("Qid");
       String msg=Admin.A_Contact_Us(id);
       req.getRequestDispatcher("Admin.jsp").forward(req, resp);
       
    }catch(Exception ex){ System.out.println("Exception "+ex);}
    
       
        
        
        
    }


    
    
    
    

}
