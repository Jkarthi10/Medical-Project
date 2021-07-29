
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
public class ordermed extends HttpServlet {
    PrintWriter out;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
    ServletException, IOException
    {
        int result=0;
         response.getWriter();
         out = response.getWriter();
         
    Integer pharmid = Integer.parseInt(request.getParameter("id"));
    String pname=request.getParameter("pname");
     String name = request.getParameter("name");
     String email = request.getParameter("email");
     String contact = request.getParameter("contact");
     String address = request.getParameter("address");
     String drug = request.getParameter("drug");
     Part prescription = request.getPart("image");
     String filename=prescription.getSubmittedFileName();
     
     
     if(prescription!=null)
     {
         try{
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
        "jdbc:mysql://localhost:3306/medical","root","karthi");  
               PreparedStatement st = con.prepareStatement("INSERT INTO ordermed(id,pharmid,pname,name,email,contact,address,drug,prescription,filename) VALUES(null,?,?,?,?,?,?,?,?,?)");
        InputStream is = prescription.getInputStream();
       
        st.setInt(1, pharmid);
        st.setString(2, pname);
        st.setString(3,name);
        st.setString(4, email);
        st.setString(5, contact);
        st.setString(6, address);
        st.setString(7, drug);
        st.setBlob(8,is);
        st.setString(9,filename);
        
        result = st.executeUpdate();
        if(result>0){
            out.println("<h1>Ordered Placed successfully");
        }    
       
      } 
       catch(Exception e){
        out.println(e);
    }
    }
}
}
