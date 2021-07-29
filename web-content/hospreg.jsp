<%@ page import="java.sql.*" %>

<%
            String hospname =request.getParameter("hospname");
			String address=request.getParameter("address");
            String email =request.getParameter("email");
			String password =request.getParameter("password");
            String pincode=request.getParameter("pincode");
            String contact =request.getParameter("contact");
			String city=request.getParameter("city");
			String speciality=request.getParameter("speciality");
			String state=request.getParameter("state");
   			int otp = Integer.parseInt(request.getParameter("otp"));

			
try{
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
   PreparedStatement ps=con.prepareStatement("update  hospitals set hospname=?, address=?, pincode=?, city=?, state=?,  email=?, password=?, speciality=? where contact=? and otp=?");
            ps.setString(1,hospname);
	        ps.setString(2,address);
	        ps.setString(3,pincode); 
			ps.setString(4,city); 	        
	        ps.setString(5,state); 
            ps.setString(6,email); 
            ps.setString(7,password);
            ps.setString(8,speciality); 
            ps.setString(9,contact);
            ps.setInt(10,otp);
     int x = ps.executeUpdate();
     if(x>0){
          out.println("<h1>Registered successfully!</h1>"); %>
                   <jsp:include page="hosplogin.html" />
                    <%
       }
      else{
         out.println("Registration Failed...");
        }
   }catch(Exception e){
      out.println("Go to login!!!!!!"+e);
     }
%>