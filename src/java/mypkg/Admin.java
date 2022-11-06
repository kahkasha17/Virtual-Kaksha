package mypkg;
import db.DB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.commons.fileupload.FileItem;
//1. Deep
public class Admin 
{
//REGISTRATION MODULE    
    public static String addStudent(String fname,String lname,String pass,String mail,String mob,String dob,String gen,String course,String address)
    {
        String str=String.format("insert into stdRegistration(fname,lname,pass,mailid,mobile,dob,gender,course,address,lastmodified) values('%s','%s','%s','%s','%s','%s','%s','%s','%s',now());", fname,lname,pass,mail,mob,dob,gen,course, address);
        try{
        Statement st=DB.getCon().createStatement();
        int i=st.executeUpdate(str);
        ResultSet rs=st.executeQuery("select * from stdRegistration;");
        String id=null;
        String rpass=null;
        String n1=null;
        String n2=null;
        while(rs.next())
        {
            id=rs.getString(1);
            rpass=rs.getString(4);
            n1=rs.getString(2);
            n2=rs.getString(3);
        }
            System.out.println(id);
            System.out.println(pass);
            System.out.println(n1);
            System.out.println(n2);
            System.out.println(fname);
            System.out.println(lname);
            System.out.println(lname);
            System.out.println(mail);
            System.out.println(mob);
            System.out.println(dob);
            System.out.println(gen);
            System.out.println(course);
            System.out.println(address);
        String name=n1+" "+n2;
        String id2="SVKID100"+id;
        String str2=String.format("insert into tblLogin(sid,pass,Name) values('%s','%s','%s');",id2,rpass,name);
        st.execute(str2);
        if(i>0)
        {
            return id2 ;
        }
        else{
            return "!!..Some problem occur..!!";
        }
        }catch(Exception ex){
            return "Exception is "+ex;
        }
    }  
    
    public static ResultSet coursePassTch(String tid) throws Exception
    {
        String str=String.format("select pass,course from teacherregis where sid=%s;", tid);
        return DB.getCon().createStatement().executeQuery(str);
    }
    public static ResultSet coursePassStd(String tid) throws Exception
    {
        String str=String.format("select pass,course from stdregistration where sid=%s;", tid);
        return DB.getCon().createStatement().executeQuery(str);
    }
    
//2. Deep    
    public static String addTeacher(String fname,String lname,String pass,String mail,String mob,String dob,String gen,String course,String address)
    {
        String str=String.format("insert into teacherRegis(fname,lname,pass,mailid,mobile,dob,gender,course,address,lastmodified) values('%s','%s','%s','%s','%s','%s','%s','%s','%s',now());", fname,lname,pass,mail,mob,dob,gen,course, address);
        try{
        Statement st=DB.getCon().createStatement();
        int i=st.executeUpdate(str);
        ResultSet rs=st.executeQuery("select * from teacherRegis;");
        String id=null;
        String rpass=null;
        String n1=null;
        String n2=null;
        
        while(rs.next())
        {
            id=rs.getString(1);
            rpass=rs.getString(4);
            n1=rs.getString(2);
            n2=rs.getString(3);
        }
        String name=n1+" "+n2;
        String id2="FVKID100"+id;
        String str2=String.format("insert into tblLogin(sid,pass,name) values('%s','%s','%s');",id2,rpass,name);
        st.execute(str2);
        if(i>0)
        {
            return id2;
        }
        else{
            return "!!..Some problem occur..!!";
        }
        }catch(Exception ex){
            return "Exception is "+ex;
        }
    }
     public static ResultSet stdmail(String id) throws Exception
    {
        String str=String.format("select sid,fname,lname,pass,mailid from stdRegistration where sid='%s';",id);
        return DB.getCon().createStatement().executeQuery(str);
    }
    public static ResultSet tchmail(String id) throws Exception
    {
        String str=String.format("select sid,fname,lname,pass,mailid from teacherRegis where sid='%s';",id);
        return DB.getCon().createStatement().executeQuery(str);
    }
//REGISTRATION MODULE END          
//1.pravin
//CONTACT US MODULE     
 public static String addContactus(String name,String email,String Options ,String mobile,String Qta){
    
    try {
        String sf= String.format("insert into cont_us(name,email,options,mobile,qrya,last_modified) values('%s','%s','%s','%s','%s',now())",name,email,Options,mobile,Qta);
        Statement s=db.DB.getCon().createStatement();
        int x=s.executeUpdate(sf);
        System.out.println(" value is  "+x);
        //execute update return the integer value
        if(x==1)
            return "successfully Inserted........";
        else
            return"UnSuccessfull command!!!! ";    
    }
    catch (Exception ec) { return ("Exception :-"+ec);
    }
}
//2.pravi 
   public static ResultSet getId() throws Exception
   {
      String str=String.format("select * from cont_us;");
      Statement st=db.DB.getCon().createStatement();
      return st.executeQuery(str);
   }
   public static ResultSet replys(String id) throws SQLException
 {
     String str=String.format("select * from cont_us where Qid='%s'",id);
     return db.DB.getCon().createStatement().executeQuery(str);

 }
 
//CONTACT US END    
 //1. Kahkasha
//LOGIN MODULE   
    public static ResultSet login(String uid,String pw) throws Exception
    {
        String str= String.format("select * from tbllogin where sid='%s' and pass='%s'",uid,pw);
        System.out.println(uid);
        System.out.println(pw);
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);
    }
     public static String loginDetails(String id,String pass,String name)
  {
    try {
        String str= String.format("insert into tbllogindetails(id,pass,Name,lastmodified) values('%s','%s','%s',now())",id,pass,name);
        Statement s=db.DB.getCon().createStatement();
        int x=s.executeUpdate(str);
        System.out.println(" value is  "+x);
        //execute update return the integer value
        if(x==1){
            return "successfully Inserted........";}
        else{
            return"UnSuccessfull !!!! ";  }  
    }
    catch (Exception ex) { return ("Exception :-"+ex);
    }
}
  public static String logOutDetails(String id,String pass,String name)
  {
    try {
        String str= String.format("insert into tbllogoutdetails(id,pass,Name,lastmodified) values('%s','%s','%s',now())",id,pass,name);
        Statement s=db.DB.getCon().createStatement();
        int x=s.executeUpdate(str);
        System.out.println(" value is  "+x);
        //execute update return the integer value
        if(x==1){
            return "successfully Inserted........";}
        else{
            return"UnSuccessfull !!!! ";  }  
    }
    catch (Exception ex) { return ("Exception :-"+ex);
    }
}
//LOGIN MODULE END    
//FORGET PW MODULE       
 //2. kahkasha   
    public static ResultSet fpw(String uid) throws Exception
    {
        String str= String.format("select * from tbllogin where sid='%s'",uid);
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);
    }          
    //3. kahkasha
    public static ResultSet sfpwmail(String uid) throws Exception
    {
//        String sp= uid.replaceAll("[SVKID100]","");
//        String id="SVKID100";
        String newId=uid.substring(7);
//        String sp=uid.substring(uid.length()-2);
        int u=Integer.parseInt(newId);
        String str= String.format("select *from stdregistration where sid=%d",u);
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);
        
    }      
    //4. kahkasha
    public static ResultSet ffpwmail(String uid) throws Exception
    {
//        String sp= uid.replaceAll("[SVKID100]","");
//        String id="SVKID100";
        String newId=uid.substring(7);
//        String sp=uid.substring(uid.length()-2);
        int u=Integer.parseInt(newId);
        String str= String.format("select *from teacherregis where sid=%d",u);
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);
        
    }
//FORGET PW END HERE    
//PROFILE MODULE     
    // 3.pravin
    public static  ResultSet profileA(int id) throws SQLException{
    String str= String.format("select * from stdregistration where sid=%d",id);
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);
    }        
 // 4.pravin
    public static  ResultSet profileTea(int id) throws SQLException{
    String str= String.format("select * from teacherregis where sid=%d",id);
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);
    }      
    // 5. pravin
   public static String udpDet(String id,String fnm,String lnm,String mailid,String mobile,String dob,String gender,String addr,String name,String uid){
try{
//       String nm3=fnm+" "+lnm; 
        String id1="SVKID100"+id;
        System.out.println(id1);
        String name1=fnm+lnm;
       String str= String.format("update stdregistration set fname='%s',lname='%s',mailid='%s',mobile='%s',dob='%s',gender='%s',address='%s' where sid=%s",fnm,lnm, mailid,mobile,dob,gender,addr,id);
       String str1= String.format("update tbllogin set name='%s' where sid='%s'",name1,id1);     
       
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       int y=st.executeUpdate(str1);

       if(x==1)
       {return "Successfully Updated";}
       if(y==1)
       {return"Succesfully updated";}
//       if(z==1)
//       {return"Successfully updated!";}
       else
       {return"Not be able to Update due to Server";}
}catch(Exception ex){return "Exception i "+ex;}
       
   }

   public static String A_udpDet(String id,String fnm,String lnm,String mailid,String mobile,String gender,String addr,String name,String uid)
           
   {
    try
    {
//       String nm3=fnm+" "+lnm; 
        String id1="AVKID100"+id;
        System.out.println(id1);
        String name1=fnm+lnm;
        String str= String.format("update admin set fname='%s',lname='%s',mailid='%s',mobile='%s',gender='%s',address='%s' where vid=%s",fnm,lnm, mailid,mobile,gender,addr,id);
        String str1= String.format("update tbllogin set name='%s' where sid='%s'",name1,id1);     
       
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       int y=st.executeUpdate(str1);

       if(x==1)
       {return "Successfully Updated";}
       if(y==1)
       {return"Succesfully updated";}
//       if(z==1)
//       {return"Successfully updated!";}
       else
       {return"Not be able to Update due to Server";}
}catch(Exception ex){return "Exception i "+ex;}
       
   }
   //6. pravin
   public static String T_udpDet(String id,String fnm,String lnm,String mailid,String mobile,String dob,String gender,String addr,String name,String uid){
try{
//       String nm3=fnm+" "+lnm; 
        String id1="FVKID100"+id;
        System.out.println(id1);
        String name1=fnm+lnm;
       String str= String.format("update teacherregis set fname='%s',lname='%s',mailid='%s',mobile='%s',dob='%s',gender='%s',address='%s' where sid=%s",fnm,lnm, mailid,mobile,dob,gender,addr,id);
       String str1= String.format("update tbllogin set name='%s' where sid='%s'",name1,id1);     
       
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       int y=st.executeUpdate(str1);

       if(x==1)
       {return "Successfully Updated";}
       if(y==1)
       {return"Succesfully updated";}
//       if(z==1)
//       {return"Successfully updated!";}
       else
       {return"Not be able to Update due to Server";}
}catch(Exception ex){return "Exception i "+ex;}
       
   }
   
   
public static String updateProfileImg(String sid,FileItem img)
 {
     try{
        
         PreparedStatement ps=db.DB.getCon().prepareStatement("update upload_img set image=?,lastmodified=now() where sid=?;");
         ps.setBinaryStream(1, img.getInputStream());
         ps.setString(2, sid);
         int i=ps.executeUpdate();
         if(i==1)
             return "Updated Sucessfully";
         else
             return "Not updated";
     }catch(Exception ex){
         return "Exception is "+ex;
     }
 }   
public static ResultSet getstdImgId() throws Exception
 {
     return DB.getCon().createStatement().executeQuery("select sid from upload_stdimg order by 1");
 } 



public static ResultSet getAdminImgId() throws Exception
 {
     return DB.getCon().createStatement().executeQuery("select sid from upload_adminimg order by 1");
 }


 public static ResultSet getStdProfileImg(String id) throws Exception
 {
     String str=String.format("select image from upload_stdimg where sid='%s';",id );
     return DB.getCon().createStatement().executeQuery(str);
 }
 
 
 
 public static ResultSet getAdminProfileImg(String id) throws Exception
 {
     System.out.println("Get"+id);
     String str=String.format("select image from upload_adminimg where sid='%s';",id );
     return DB.getCon().createStatement().executeQuery(str);
 }



 public static String updateStdProfileImg(String sid,FileItem img)
 {
     try{
         
         PreparedStatement ps=db.DB.getCon().prepareStatement("update upload_stdimg set image=?,lastmodified=now() where sid=?;");
         ps.setBinaryStream(1, img.getInputStream());
         ps.setString(2, sid);
         int i=ps.executeUpdate();
         if(i==1)
             return "Updated Sucessfully";
         else
             return "Not updated";
     }catch(Exception ex){
         return "Exception is "+ex;
     }
     
 }


 public static String updateAdminProfileImg(String sid,FileItem img)
 {
     try{
         System.out.println("Udate chal jaa plzz"+sid);
         PreparedStatement ps=db.DB.getCon().prepareStatement("update upload_adminimg set image=?,lastmodified=now() where sid=?;");
         ps.setBinaryStream(1, img.getInputStream());
         ps.setString(2, sid);
         int i=ps.executeUpdate();
         if(i==1)
             return "Updated Sucessfully";
         else
             return "Not updated";
     }catch(Exception ex){
         return "Exception is "+ex;
     }
 }
 public static String uploadImage(String sid,FileItem img)
 {
     try{
         
         PreparedStatement ps=db.DB.getCon().prepareStatement("insert into upload_img(sid,image,lastmodified) values(?,?,now());");
         ps.setString(1, sid);
         ps.setBinaryStream(2, img.getInputStream());
         int i=ps.executeUpdate();
         if(i==1)
             return "Added sucessfully";
         else
             return "Some error occur";
     }catch(Exception ex){ return "Exception is"+ex;}
 }
 public static ResultSet getProfileImg(String id) throws Exception
 {
     String str=String.format("select image from upload_img where sid='%s';",id );
     return DB.getCon().createStatement().executeQuery(str);
 }
 public static String stduploadImage(String sid,FileItem img)
 {
     try{
         
         PreparedStatement ps=db.DB.getCon().prepareStatement("insert into upload_stdimg(sid,image,lastmodified) values(?,?,now());");
         ps.setString(1, sid);
         ps.setBinaryStream(2, img.getInputStream());
         int i=ps.executeUpdate();
         if(i==1)
             return "Added sucessfully";
         else
             return "Some error occur";
     }catch(Exception ex){ return "Exception is"+ex;}
 }
 
 public static String AdminuploadImage(String sid,FileItem img)
 {
     try{
         
         PreparedStatement ps=db.DB.getCon().prepareStatement("insert into upload_adminimg(sid,image,lastmodified) values(?,?,now());");
         ps.setString(1, sid);
         ps.setBinaryStream(2, img.getInputStream());
         int i=ps.executeUpdate();
         if(i==1)
             return "Added sucessfully";
         else
             return "Some error occur";
     }catch(Exception ex){ return "Exception is"+ex;}
 }
 
 public static ResultSet getImgId() throws Exception
 {
     return DB.getCon().createStatement().executeQuery("select sid from upload_img order by 1");
 }   
  public static String passCourseUpdateStd(String pass,String course,String id) 
 {
     try{
         String str=String.format("update stdRegistration set pass='%s',course='%s' where sid=%s;",pass,course,id );
         String sid2="SVKID100"+id;
         String str2=String.format("update tblLogin set pass='%s' where sid='%s';", pass,sid2);
         Statement st=DB.getCon().createStatement();
         int i=st.executeUpdate(str);
         int b=st.executeUpdate(str2);
         if(i==1 || b==1)
         {
             return "Updated";
         }
         else
         {
             return "Error";
         }
     }catch(Exception ex){
         return "Exception is "+ex;
     }
 }
 public static String passCourseUpdateTch(String pass,String course,String id) 
 {
     try{
         System.out.println(pass);
         String str=String.format("update teacherRegis set pass='%s',course='%s' where sid=%s;",pass,course,id );
        System.out.println("Password for login table"+pass);
         String sid2="FVKID100"+id;
         String str2=String.format("update tblLogin set pass='%s' where sid='%s';",pass,sid2);
         System.out.println(sid2);
         Statement st;
         st=DB.getCon().createStatement();
         int i=st.executeUpdate(str);
         int b=st.executeUpdate(str2);
         if(i==1) 
         {
             return str2;
         }
         else
         {
             return "Error";
         }
     }catch(Exception ex){
         return "Exception is "+ex;
     }
 }
 
 public static ResultSet showstd(String id)throws Exception
  {   
       String str=String.format("select *from stdregistration where sid=%s", id);
       Statement s=DB.getCon().createStatement();
       return s.executeQuery(str);  
  }
public static ResultSet showteach(String id)throws Exception
  {   
       String str=String.format("select *from teacherregis where sid=%s", id);
       Statement s=DB.getCon().createStatement();
       return s.executeQuery(str);  
  }
public static ResultSet getName(String uid)throws Exception
  {   
       String str=String.format("select name from tbllogin where sid='%s'", uid);
       Statement s=DB.getCon().createStatement();
       return s.executeQuery(str);  
  }
//PROFILE MODULE END     
//DIGITAL LIBRARY MODULE   
   //3. Deep
   public static String addBook(String name,String uid,String subject,FileItem book)
   {
       try{
       PreparedStatement ps=DB.getCon().prepareStatement("insert into tbl_lib_books(bookname,uid,booksub,bookfile,lastmodified) values(?,?,?,?,now());");
       ps.setString(1, name);
       ps.setString(2, uid);
       ps.setString(3,subject);
       ps.setBinaryStream(4,book.getInputStream());
       int x=ps.executeUpdate();
       if(x==1)
       {
           return "Book is Added successfully";
       }
       else
       {
           return "Not inserted sucessfully";
       }
       }catch(Exception ex){
           return "Some exception Occured "+ex;
       }
   }
   //4. Deep
   public static ResultSet bookName() throws Exception
   {
       String str="select bookname,booksub,bid from tbl_lib_books order by 1;";
       return DB.getCon().createStatement().executeQuery(str);
   }
   //5. Deep
   public static String addNote(String name,String uid,String subject,FileItem note)
   {
       try{
       PreparedStatement ps=DB.getCon().prepareStatement("insert into tbl_lib_notes(notename,uid,notesub,notefile,lastmodified) values(?,?,?,?,now());");
       ps.setString(1, name);
       ps.setString(2, uid);
       ps.setString(3,subject);
       ps.setBinaryStream(4,note.getInputStream());
       int x=ps.executeUpdate();
       if(x>0)
       {
           return "notes Added successfully";
       }
       else
       {
           return "my notes Not inserted sucessfully";
       }
       }catch(Exception ex){
           return "exception in notes Occured ";
       }
   }
   //6. Deep
   public static ResultSet noteName() throws Exception
   {
       String str="select notename,notesub,nid from tbl_lib_notes order by 1;";
       return DB.getCon().createStatement().executeQuery(str);
   }
   //7. Deep
   public static String addVideo(String name,String uid,String subject,String vidlink)
   {
       try{
       String str=String.format("insert into tbl_lib_video(vidname,uid,vidsub,vidlink,lastmodified) value('%s','%s','%s','%s',now());", name,uid,subject,vidlink);
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       if(x==1)
       {
           return "Video link Added successfully";
       }
       else
       {
           return "Link is  Not!!";
       }
       }catch(Exception ex){
           return "!!..Some Error Occur..!! "+ex;
       }
   }
   //8. deep
   public static ResultSet vidName() throws Exception
   {
       String str="select vidname,vidsub,vid from tbl_lib_video order by 1;";
       return DB.getCon().createStatement().executeQuery(str);
   }
   //9. deep
   public static ResultSet showBook(String bid) throws Exception
   {
       String str=String.format("select bookfile from tbl_lib_books where bid=%s;", bid);
       return DB.getCon().createStatement().executeQuery(str);
   }
   //10. deep
   public static ResultSet showNote(String nid) throws Exception
   {
       String str=String.format("select notefile from tbl_lib_notes where nid=%s;", nid);
       return DB.getCon().createStatement().executeQuery(str);
   }
   //11. deep
   public static ResultSet showVid(String vid) throws Exception
   {
       String str=String.format("select vidlink from tbl_lib_video where vid=%s;", vid);
       return DB.getCon().createStatement().executeQuery(str);
   }  
//DIGITAL LIBRARY END 
//ASSIGNMENT MODULE   
//5. kahkasha   
 public static String assign(String id,FileItem Assign,String Title,String Name,String course,String last_date )
         
 {
     try
     {
         
         
          Statement s=db.DB.getCon().createStatement();
          String st= String.format("delete from tblAssign where last_date='%s'and lastmodified  < now() - last_date",course);
         int z=s.executeUpdate(st);
            if(z==1)
            {
            System.out.println("successfully deleted........"); 
            }    
            else
            {
            System.out.println("successfully deleted........"); }   
         
         
         
         
         
         
         
         
         
         
         
         
         if(id.startsWith("S"))
         {
        PreparedStatement ps=DB.getCon().prepareStatement("insert into tblAssign(id ,Assign,Title,Name,course,last_date,pos,lastmodified)values(?,?,?,?,?,?,?,now())");
        ps.setString(1, id);
         ps.setBinaryStream(2, Assign.getInputStream());
         ps.setString(3,Title );
         ps.setString(4, Name);
         ps.setString(5, course);
         ps.setString(6, last_date);
          ps.setString(7, "Student");
         int x=ps.executeUpdate();
         if(x>0)
         {
           return "Pdf Added successfully";
         }else
            {
           return "Pdf Not inserted sucessfully";
           }
         }
       else if(id.startsWith("F"))
         {
         PreparedStatement ps=DB.getCon().prepareStatement("insert into tblAssign(id ,Assign,Title,Name,course,last_date,pos,lastmodified)values(?,?,?,?,?,?,?,now())");
         ps.setString(1, id);
         ps.setBinaryStream(2, Assign.getInputStream());
         ps.setString(3,Title );
         ps.setString(4, Name);
         ps.setString(5, course);
         ps.setString(6, last_date);
         ps.setString(7, "Faculty");
         int x=ps.executeUpdate();
         if(x>0)
         {
           return "Pdf Added successfully";
         }else
            {
           return "Pdf Not inserted sucessfully";
           }
         }  
         else if(id.startsWith("A"))
         {
         PreparedStatement ps=DB.getCon().prepareStatement("insert into tblAssign(id ,Assign,Title,Name,course,last_date,pos,lastmodified)values(?,?,?,?,?,?,?,now())");
         ps.setString(1, id);
         ps.setBinaryStream(2, Assign.getInputStream());
         ps.setString(3,Title );
         ps.setString(4, Name);
         ps.setString(5, course);
         ps.setString(6, last_date);
         ps.setString(7, "Admin");
         int x=ps.executeUpdate();
         if(x>0)
         {
           return "Pdf Added successfully";
         }else
            {
           return "Pdf Not inserted sucessfully";
           }
         }  
        }catch(Exception ex){
           return "exception "+ex;
       }
     return "Successfully";
     } 
 public static String U_assign(String id,FileItem Assign,String Title,String last_date )
 {
  try{   
         String str=String.format("update tblassign set assign='%s',title='%s',last_date='%s' where sr=%s;",Assign,Title,last_date,id );
         Statement s=DB.getCon().createStatement();
         int x=s.executeUpdate(str);
         if(x>0)
         {
           return "Pdf Update successfully";
         }
         else
            {
           return "Pdf Not Update sucessfully";
           }
           
        }catch(Exception ex){
           return "exception "+ex;
       }    
     } 
 //6. kahkasha            
 public static ResultSet getAssign(String uid) throws Exception
 {
     String str=String.format("select * from tblAssign where id='%s';", uid);
     return DB.getCon().createStatement().executeQuery(str);
//     return db.DB.getCon().createStatement().executeQuery(");
 }
 //7. kahkasha
 public static ResultSet getPdf(String sr) throws Exception
 {
     return db.DB.getCon().createStatement().executeQuery("select Assign from tblAssign where sr="+sr);
 }
 //8. kahkasha
 public static ResultSet fGetAssignDown(String course) throws Exception
 {
     
        String str;
        String pos="Student";
        str = String.format("select * from tblassign where pos ='%s' And course='%s';",pos, course);
         return DB.getCon().createStatement().executeQuery(str);
     
//    else if(uid.startsWith("S"))
//     {
//         String str=String.format("SELECT *FROM tblassign WHERE id like 'F%' And course='%s'And id='%s';", uid,course);
//         return DB.getCon().createStatement().executeQuery(str);
//     }
     

 }
 //9. kahkasha
  public static ResultSet SGetAssignDown(String course) throws Exception
 {
     
        String str;
        String pos="Faculty";
        
        
        str = String.format("select * from tblassign where pos ='%s' And course='%s';",pos, course);
         return DB.getCon().createStatement().executeQuery(str);
 } 
// ASSIGNMENT MODULE END
//LIVE CLASS MODULE 
//10. kahkasha
  public static String fLive(String url,String title,String name,String uid,String course )
  {
    String pos="Faculty";
    try {
        String str= String.format("insert into tblLive(id,url,title,Name,course,wmode,lastmodified) values('%s','%s','%s','%s','%s','%s',now())",uid,url,title,name,course,pos);
        Statement s=db.DB.getCon().createStatement();
        int x=s.executeUpdate(str);
        System.out.println(" value is  "+x);
        //execute update return the integer value
        if(x==1){
            return "successfully Inserted........";}
        else{
            return"UnSuccessfull !!!! ";  }  
    }
    catch (Exception ex) { return ("Exception :-"+ex);
    }
}
  //11. kahkasha
   public static ResultSet joinLive(String course) throws Exception
   {    
       
       String str=String.format("select title,url from tblLive where course='%s'",course);
       return DB.getCon().createStatement().executeQuery(str);
   }
   public static String delLive(String course)
   {
       try
       {
         String st= String.format("delete from tbllive where course='%s'and lastmodified  < now() - interval 75 Minute",course);
        Statement s=db.DB.getCon().createStatement();
        int x=s.executeUpdate(st);
        if(x==1)
        {
            System.out.println("successfully deleted........"); 
        }    
        else
        {
            System.out.println("successfully deleted........"); }  
       }catch(Exception ex)
       {
           return "Error exception is"+ex;
       }
       return "ssss";
   }
//LIVE CLASS END   
  //Admin MODULE STARTS HERE 
//   Pravi 
     public static ResultSet Student_Det() throws SQLException{
        String str= String.format("select * from stdregistration order by 1");
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
    }    
     
      public static ResultSet Teacher_Det() throws SQLException{
        String str= String.format("select * from teacherregis order by 1");
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
    }
      public static  ResultSet AdminDet() throws Exception
      {
          String str=String.format("select *from admin");
          Statement s=DB.getCon().createStatement();
          return s.executeQuery(str);
      }
    
    public static ResultSet Contact_Det() throws SQLException{
        String str= String.format("select * from cont_us order by 1");
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
    }           
     public static ResultSet Assign() throws SQLException{
        String str= String.format("select * from tblassign order by 1");
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
    }        
   public static ResultSet Books() throws SQLException{
        String str= String.format("select * from tbl_lib_books order by 1");
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
    }    
      
    public static ResultSet Notes() throws SQLException{
        String str= String.format("select * from tbl_lib_notes order by 1");
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
    }      
    
    public static ResultSet Videos() throws SQLException{
        String str= String.format("select * from tbl_lib_video order by 1");
        Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
    }

        public static String A_DelStud(String id) throws SQLException
    {
        
        String str=String.format("delete from stdregistration where sid=%s",id);
        System.out.println(id);
        String id1="SVKID100"+id;
        System.out.println(id1);
        String s=String.format("delete from tbllogin where sid='%s';",id1);
        Statement st=DB.getCon().createStatement();
        int x=st.executeUpdate(str);
        System.out.println("delete successfully1");
        int y=st.executeUpdate(s);
        System.out.println("delete successfully1");
        if(x==1 && y==1)
            return "Deleted Successfully ";
        else    
            return "Not Executed "; 
    }  
    
    
   public static String A_DelTeach(String id) throws SQLException {
       String str= String.format("delete from teacherregis where sid=%s",id);
       
       String id1="FVKID100"+id;
        System.out.println(id1);
        String s=String.format("delete from tbllogin where sid='%s';",id1);
        Statement st=DB.getCon().createStatement();
        int x=st.executeUpdate(str);
        int y=st.executeUpdate(s);
        if(x==1 && y==1)
            return "Deleted Successfully ";
        else    
            return "Not Executed "; 
   }
   
   
   public static String A_Contact_Us(String id) throws SQLException {
       String str= String.format("delete from cont_us where Qid=%s",id);
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       if(x==1) 
        return "Record Successfully Deleted"; 
       else
        return "Not deleted";     
   }
    
   public static String A_Assign(String id) throws SQLException {
       String str= String.format("delete from tblassign where sr=%s",id);
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       if(x==1) 
        return "Record Successfully Deleted"; 
       else
        return "Not deleted";     
   }
   public static String A_delHas(String id) throws SQLException
   {
    String str=String.format("delete from tbl_has where id=%s",id);
    Statement st=DB.getCon().createStatement();
    int x=st.executeUpdate(str);
     if(x>0)
       return "Record Deleted SuccessFully";
     else
       return "Record Not Deleted SuccessFully";  
     
       
       
   }
   
   
   
   public static String A_Books(String id) throws SQLException{
   String str= String.format("delete from tbl_lib_books where bid=%s",id);
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       if(x==1) 
        return "Record Successfully Deleted"; 
       else
        return "Not deleted";     
       
   } 
    
   public static String A_Notes(String id) throws SQLException{
   String str= String.format("delete from tbl_lib_notes where nid=%s",id);
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       if(x==1) 
        return "Record Successfully Deleted"; 
       else
        return "Not deleted";     
       
   } 
    
   public static String A_Videos(String id) throws SQLException{
   String str= String.format("delete from tbl_lib_video where vid=%s",id);
       Statement st=DB.getCon().createStatement();
       int x=st.executeUpdate(str);
       if(x==1) 
        return "Record Successfully Deleted"; 
       else
        return "Not deleted";     
       
   }

   public static  ResultSet DetSt(String id) throws Exception
   {
       String str= String.format("select *from stdregistration where sid=%s",id);
       Statement s=DB.getCon().createStatement();
        return s.executeQuery(str);  
   }
   
   
   
   
//ADMIN MODULE ENDS HERE
//FEEDBACK MODULE   
//KAHKAHSA   
   public static String feed(String uid,String course,String rate,String feed,String name)throws  Exception
   {
       if(uid.startsWith("S"))
       {    
           String wmode="Student";
           String str= String.format("insert into tbl_feed(vid,name,course,wmode,rating,feedback,lastmodified)values('%s','%s','%s','%s','%s','%s',now());",uid,name,course,wmode,rate,feed);
           Statement s=DB.getCon().createStatement();
           int x=s.executeUpdate(str);
            if(x==1) 
            return "Record Successfully Inserted"; 
            else
            return "Not Inserted";     
           
       }
       if(uid.startsWith("F"))
       {    
           String wmode="Faculty";
           String str= String.format("insert into tbl_feed(vid,name,course,wmode,rating,feedback,lastmodified)values('%s','%s','%s','%s','%s','%s',now());",uid,name,course,wmode,rate,feed);
           Statement s=DB.getCon().createStatement();
           int x=s.executeUpdate(str);
            if(x==1) 
            return "Record Successfully Inserted"; 
            else
            return "Not Inserted";     
       }
       
      return"some" ;
       
   }     
   public static ResultSet showFeed()throws Exception
   {
       String str=String.format("select * from tbl_feed");
       Statement s=DB.getCon().createStatement();
       return s.executeQuery(str);  
       
   }
   
   
//FEEDBACK END HERE
//HELP & SUPPORT MODULE

public static String HlpandSprt(String uid,String name,String Course,String textarea,String mail) throws SQLException
{  
     try{
     
     if(uid.startsWith("S")){    
       { 
           System.out.println("Kuch toh garbar hai");
     String str=String.format("insert into tbl_has(vid,name,course,qry,mailid,last_modified) values('%s','%s','%s','%s','%s',now());",uid,name,Course,textarea,mail);
     Statement st=db.DB.getCon().createStatement(); 
     int x=st.executeUpdate(str);
           System.out.println("Working prop");
    if(x==1)
        return"Statement Executed Successfully";
    else 
        return"Not Executed Successfully";
     }
       
     }
     
     if(uid.startsWith("F"))
     {
   
     String str=String.format("insert into tbl_has(id,Name,course,qry,mailid,last_modified) values('%s','%s','%s','%s',%s',now());",uid,name,Course,textarea,mail);
  Statement st=db.DB.getCon().createStatement(); 
     int x=st.executeUpdate(str);
    if(x==1)
        return "Statement Executed Successfully";
    else 
        return "Not Executed Successfully";
   
     }
     
     
     } catch(Exception ex){return " "+ex;} 
    return " ";
   }

   
  public static ResultSet HS_getMail() throws SQLException{
      
      String str=String.format("Select * from tbl_has order by 1");
      return DB.getCon().createStatement().executeQuery(str);
  } 
//HELP & SUPPORT MODULE END  
  
  public static String passUpdateAdmin(String id,String pass)
  {
    try{
        String myid=id.substring(8);
        System.out.println(myid);
         String str=String.format("update admin set pass='%s' where vid=%s;",pass,myid );
         String str2=String.format("update tbllogin set pass='%s' where sid='%s';", pass,id);
         System.out.println(str2);
         Statement st;
         st=DB.getCon().createStatement();
         int i=st.executeUpdate(str);
         int b=st.executeUpdate(str2);
         if(i==1) 
         {
             return str2;
         }
         else
         {
             return "Error";
         }
     }catch(Exception ex){
         return "Exception is "+ex;
     }
  }
  public static String ansReply(String mail,String ques,String ans)
  {
      try{
          String str=String.format("insert into replyAns(mailid,qury,ans) values('%s','%s','%s');", mail,ques,ans);
          Statement st=DB.getCon().createStatement();
          int i=st.executeUpdate(str);
          if(i==1)
          {
              return "Ans is replied";
          }
          else
          {
              return "Some error is occured";
          }
      }catch(Exception ex){
          return "Exception is "+ex;
      }
  }


 public static ResultSet hlprply(String aid ) throws SQLException
  {
      String str=String.format("Select * from tbl_has where id='%s'",aid);
      Statement st=DB.getCon().createStatement();
      return st.executeQuery(str);    
  }
  
  public static String hlpsendrply(String mailid,String querys,String ans)
  {
      try{
  String str=String.format("insert into tblhlprply(mailid,querys,ans)values('%s','%s','%s')",mailid,querys,ans);
  Statement st=DB.getCon().createStatement();
      int x=st.executeUpdate(str);
        if(x>1)
        {return"Data Insertdd"+x;}
        else
            return"Data Not Inserted";
      }catch(Exception ex){ 
          return "Exception is:-"+ex;
                  }
  }



}   
