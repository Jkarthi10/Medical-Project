
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;


@MultipartConfig(maxFileSize = 16177216)
public class uploadresult extends HttpServlet {
    PrintWriter out;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
    ServletException, IOException
    {
        int x=0;
         response.getWriter();
         out = response.getWriter();
         
    Integer labid = Integer.parseInt(request.getParameter("labid"));
    String admin = request.getParameter("admin");
    String labname=request.getParameter("labname");
     String name = request.getParameter("name");
     String email = request.getParameter("email");
     String contact = request.getParameter("contact");
     String address = request.getParameter("address");
     String typeoftest = request.getParameter("typeoftest");
     Part result = request.getPart("image");
     String filename=result.getSubmittedFileName();
     
     
     if(result!=null)
     {
         try{
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
        "jdbc:mysql://localhost:3306/medical","root","karthi");  
               PreparedStatement st = con.prepareStatement("INSERT INTO labreport(id,labid,labname,name,email,contact,address,typeoftest,result,filename,admin) VALUES(null,?,?,?,?,?,?,?,?,?,?)");
        InputStream is = result.getInputStream();
       
        st.setInt(1, labid);
        st.setString(2, labname);
        st.setString(3,name);
        st.setString(4, email);
        st.setString(5, contact);
        st.setString(6, address);
        st.setString(7, typeoftest);
        st.setBlob(8,is);
        st.setString(9,filename);
        st.setString(10,admin);
        
        x = st.executeUpdate();
        if(x>0){
            out.println("<h1>Result Uploaded successfully");
        }    
       
      } 
       catch(Exception e){
        out.println(e);
    }
    }
}
}

