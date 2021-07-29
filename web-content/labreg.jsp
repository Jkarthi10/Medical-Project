<%@ page import="java.sql.*" %>

<%
            String admin =request.getParameter("admin");
			String labname=request.getParameter("labname");
            String email =request.getParameter("email");
			String password =request.getParameter("password");
            String contact =request.getParameter("contact");
			String address=request.getParameter("address");
			String pincode=request.getParameter("pincode");
			String homesample=request.getParameter("homesample");
   			int otp = Integer.parseInt(request.getParameter("otp"));

			
try{
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
   PreparedStatement ps=con.prepareStatement("update  lab set  labname=?, email=?, password=?, address=?, pincode=?, homesample=? where contact=? and otp=?");
            
	        ps.setString(1,labname);
	        ps.setString(2,email); 
			ps.setString(3,password); 	        
	        ps.setString(4,address);
	        ps.setString(5,pincode);  
            ps.setString(6,homesample); 
            ps.setString(7,contact);
            ps.setInt(8,otp);
     int x = ps.executeUpdate();
     if(x>0){
          out.println("<h1>Registered successfully!</h1>"); %>
                  <jsp:include page="lablogin.html" />
                    <%
       }
      else{
         out.println("Registration Failed...");
        }
   }catch(Exception e){
      out.println("Go to login!!!!!!"+e);
     }
%>