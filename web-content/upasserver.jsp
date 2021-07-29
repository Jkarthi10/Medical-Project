<%@page import="java.sql.*" %>
<%  
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
				
			     
				%> 
<%
      String contact=request.getParameter("contact");
   int otp=Integer.parseInt(request.getParameter("otp"));
   String password=request.getParameter("password");
   try{  
	           Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
	            PreparedStatement ps=con.prepareStatement(  
	                         "update users set password=? where contact=? and otp=?");  	            
	    
	              ps.setString(1,password);
	            ps.setString(2,contact);
	            ps.setInt(3,otp);
	            int status=ps.executeUpdate();  
	              if(status>0){  
		            out.println("<center><h3>Password changed Successfully</h3></center>");  
		           %>
                    <jsp:include page="userlogin.html" />
                    <%
		        }else{  
		        	
		        	out.println("Sorry! unable to change password");  
                       %>
                    <jsp:include page="userlogin.html" />
                    <%
		        }  
		          
		        out.close();  
	        }
            catch(Exception e){
                out.println(e);}  
	          
%>