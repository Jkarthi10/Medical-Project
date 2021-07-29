<%@page import="java.sql.*" %>
<%
            String name =request.getParameter("name");			
			String address=request.getParameter("address");
			String pincode=request.getParameter("pincode");
			String state=request.getParameter("state");			
			String contact =request.getParameter("contact");
			String email = request.getParameter("email");
			String password =request.getParameter("password");
  try{  
	           Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
	            PreparedStatement ps=con.prepareStatement(  
	                         "update users set name=?,address=?,pincode=?,state=?, contact=?,password=? where email=?");  	            
	    
	              ps.setString(1,name) ;
	            ps.setString(2,address);
	            ps.setString(3,pincode); 
	            ps.setString(4,state); 
	            ps.setString(5,contact);
                ps.setString(6,password);
	            ps.setString(7,email);
	            int status=ps.executeUpdate();  
	              if(status>0){  
		            out.println("<center><h2>update successfully!</h2></center>");  %>
                    <jsp:include page="userupdate.jsp" />
                    <%
		           
		        }else{  
		        	
		        	out.println("Sorry! unable to update record");  
		        }  
		          
		        out.close();  
	        }
            catch(Exception e){
                out.println(e);}  
	          
%>