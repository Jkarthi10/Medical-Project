<%@page import="java.sql.*" %>
<%
            String admin=request.getParameter("admin");
            String labname =request.getParameter("labname");			
			String address=request.getParameter("address");
			String pincode=request.getParameter("pincode");	
			String contact =request.getParameter("contact");
			String email = request.getParameter("email");
			String password =request.getParameter("password");
            String homesample=request.getParameter("homesample");
  try{  
	           Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
	            PreparedStatement ps=con.prepareStatement(  
	                         "update lab set labname=?,email=?,password=?, contact=?,address=? ,pincode=?, homesample=? where admin=?");  	            
	    
	              ps.setString(1,labname) ;
                  ps.setString(2,email);
                ps.setString(3,password);
	            ps.setString(4,contact);
	            ps.setString(5,address);
	            ps.setString(6,pincode); 
                ps.setString(7,homesample);
	            ps.setString(8,admin);
	            int status=ps.executeUpdate();  
	              if(status>0){  
		            out.println("<center><h2>update successfully!</h2></center>");  %>
                    <jsp:include page="labupdate.jsp" />
                    <%
		           
		        }else{  
		        	
		        	out.println("Sorry! unable to update record");  
		        }  
		          
		        out.close();  
	        }
            catch(Exception e){
                out.println(e);}  
	          
%>