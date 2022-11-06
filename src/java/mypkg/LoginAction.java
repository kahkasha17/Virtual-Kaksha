package mypkg;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction extends HttpServlet
{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String uid=req.getParameter( "uid");
        String pw=req.getParameter("pw");
      HttpSession ses=req.getSession(true);
       if(uid!=null)
         db.DB.addUser(uid);
        int new_id= Integer.parseInt(uid.substring(8));
        
        
        
        
        try
        {
            ResultSet rs=Admin.login(uid, pw);
            System.out.println(uid);
            System.out.println(pw);
            
   
            ResultSet r=Admin.profileTea(new_id);
   
            ResultSet sr=Admin.profileA(new_id);
String pass=" ";
String vid=" ";
//Teacher Registration.............
 while(r.next())
   {
    String id1=r.getString(1);
    String fnm1=r.getString(2);
    String lnm1=r.getString(3);
    String nm1=r.getString(2)+" "+r.getString(3);
    pass=r.getString(4);
    String mail1=r.getString(5);
    String mob1=r.getString(6);
    String dob1=r.getString(7);
    String gender1=r.getString(8);
    String cour1=r.getString(9);
    String addr1=r.getString(10);
    String last1=r.getString(11);

    ses.setAttribute("ids1",id1);
    ses.setAttribute("fnm1", fnm1);
    ses.setAttribute("lnm1",lnm1);
    ses.setAttribute("nm1",nm1);
    ses.setAttribute("pass1",pass);
    ses.setAttribute("mail1", mail1);
    ses.setAttribute("mob1", mob1);
    ses.setAttribute("dob1", dob1);
    ses.setAttribute("gender1", gender1);
    ses.setAttribute("cour1", cour1);
    ses.setAttribute("addr1",addr1);
    ses.setAttribute("last1", last1);
    
   }

//Student Registration....... 
 while(sr.next())   
{
    
        String st1=sr.getString(2);
        String st2=sr.getString(3);
        String mail=sr.getString(5);
        String mob=sr.getString(6);
        
                String id= sr.getString(1);
                String nm= sr.getString(2)+" "+ sr.getString(3);
                pass=sr.getString(4);
                String course = sr.getString(9);
                String dob = sr.getString(7);
                String gender = sr.getString(8);
                String lstmod=sr.getString(11);  
                String addr=sr.getString(10);  

               //profile page Details
                ses.setAttribute("ids",id);
                ses.setAttribute("nm", nm);
                ses.setAttribute("pass", pass);
                ses.setAttribute("course",course);
                ses.setAttribute("dob", dob);
                ses.setAttribute("gender", gender);
                ses.setAttribute("last", lstmod);
                ses.setAttribute("addr",addr);
                ses.setAttribute("st1",st1);
                ses.setAttribute("st2",st2);
               ses.setAttribute("mail",mail);
               ses.setAttribute("mob",mob);
              
}
 
 
 
 
 ////Login Module......
while(rs.next())
            {
                vid=rs.getString(1);
                pass=rs.getString(2);
                ses.setAttribute("name",rs.getString(3));
                ses.setAttribute("uid", uid);
                ses.setAttribute("pass",pw);
                Admin.loginDetails(uid, pw,rs.getString(3));
                
            
                 
                  if(uid.equals(vid) && pw.equals(pass))
                      
                    {  
                        System.out.println("matched");
                            if(uid.startsWith("A"))
                            {
                                req.getRequestDispatcher("Admin.jsp").forward(req, resp);
                            }    

                          else if(uid.startsWith("F"))
                          {
                              req.getRequestDispatcher("Teacher.jsp").forward(req, resp);
                          }
                          else if(uid.startsWith("S"))
                           {
                               req.getRequestDispatcher("student.jsp").forward(req, resp);
                           }
                     }  
                  else if(uid!=vid && pw!=pass)
                  {
                      System.out.println("not matched");
                      req.getRequestDispatcher("index.jsp?t=0").forward(req, resp);
                  }
                 System.out.println("pta nh kya hai");
                req.getRequestDispatcher("index.jsp?t=0").forward(req, resp);
        }
        }
        
        
        catch(Exception e)
        {
            System.out.println("Exception is:-  "+e);
        }
        
    
         req.getRequestDispatcher("index.jsp?t=0").forward(req, resp);
    }

}
