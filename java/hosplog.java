import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class hosplog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public hosplog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		 response.setContentType("text/html");
	       
	        String email=request.getParameter("email");  
	        String password=request.getParameter("password");  
	              
	        if(validate(email,password)){  
	           
	            out.println("Welcome"+email);
	            HttpSession session=request.getSession(true);
	            session.setAttribute("email",email);
	           
	            response.sendRedirect("hosphome.jsp");
	        }  
	        else{  		
	        	  RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");  
		            rd.forward(request,response);    
	        }  
	              
	        out.close(); 
	        
	       

	}


public static boolean validate(String email,String password){  
    boolean status=false;
try {	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
      PreparedStatement ps=con.prepareStatement("select * from hospitals where email=? and password=?");
      ps.setString(1,email);  
      ps.setString(2,password);  
                   
      ResultSet rs=ps.executeQuery();
      status=rs.next();
      
  } 
  catch (Exception e) {
      e.printStackTrace();
  }
return status;
}
}