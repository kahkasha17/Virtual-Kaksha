package db;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MyListener implements ServletContextListener, HttpSessionListener {

    @Override
    public void contextInitialized(ServletContextEvent sce){
       try{
        Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualkaksha","root","");
           DB.setCon(con);
           System.out.println("!!--Connection is established successfully--!!");
       }catch(Exception ex){}
                
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DB.setCon(null);
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        DB.active_users++;
        System.out.println("There are "+DB.active_users+" Active users.");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        DB.active_users--;
        System.out.println("There are "+DB.active_users+" Active users.");
    }
}
