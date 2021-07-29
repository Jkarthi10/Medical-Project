<%@ page import="java.sql.*" %>

<script>
	    if(window.history.replaceState){
			window,history.replaceState(null,null, window.location.href);
		}
	</script>
<%
            String pharmname =request.getParameter("pharmname");
			String address=request.getParameter("address");
			String pincode=request.getParameter("pincode");
			String state=request.getParameter("state");
			String contact =request.getParameter("contact");
			String password =request.getParameter("password");
			int otp=Integer.parseInt(request.getParameter("otp"));
try{
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
   PreparedStatement ps=con.prepareStatement("update pharmacy set pharmname=? ,address=? ,pincode=? ,state=? ,password=? where contact=? and otp=?");
            ps.setString(1,pharmname);
			ps.setString(2,address);
			ps.setString(3,pincode);         
	        ps.setString(4,state); 
			ps.setString(5,password);
		    ps.setString(6,contact);
			ps.setInt(7,otp);
    
     int x = ps.executeUpdate();
     if(x>0){
          out.println("<h2>Registered successfully!</h2>"); %>
           <jsp:include page="pharmlogin.html" />                  
            <%
       }
      else{
         out.println("Registration Failed...");
        }
   }catch(Exception e){
      out.println("Go to login!!!!!!"+e);
     }
%>