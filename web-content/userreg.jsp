<%@ page import="java.sql.*" %>

<%
            String name =request.getParameter("name");
			String dob=request.getParameter("dob");
			String address=request.getParameter("address");
			String pincode=request.getParameter("pincode");
			String state=request.getParameter("state");
			String gender=request.getParameter("gender");
			String contact =request.getParameter("contact");
			String password =request.getParameter("password");
			int otp = Integer.parseInt(request.getParameter("otp"));
try{
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
   PreparedStatement ps=con.prepareStatement("update users set name=?, dob=?, address=?, pincode=?, state=?, gender=?, password=? where  contact=? and otp=?");
            ps.setString(1,name);
	        ps.setString(2,dob);
	        ps.setString(3,address); 
			ps.setString(4,pincode);
			ps.setString(5,state);         
	        ps.setString(6,gender); 
	        ps.setString(7,password);  
            ps.setString(8,contact);
			ps.setInt(9,otp);
     int x = ps.executeUpdate();
     if(x>0){
          out.println("<h1>Registered successfully!</h1>"); %>
           <jsp:include page="userlogin.html" />                   
            <%
       }
      else{
         out.println("Registration Failed...");
        }
   }catch(Exception e){
      out.println("Go to login!!!!!!"+e);
     }
%>