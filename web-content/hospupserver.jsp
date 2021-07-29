<%@page import="java.sql.*" %>
<%
            String hospname =request.getParameter("hospname");			
			String address=request.getParameter("address");
			String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
			String state=request.getParameter("state");			
			String contact =request.getParameter("contact");
			String email = request.getParameter("email");
			String password =request.getParameter("password");
            String speciality=request.getParameter("speciality");
  try{  
	           Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
	            PreparedStatement ps=con.prepareStatement(  
	                         "update hospitals set hospname=?,address=?,pincode=?,city=?, state=?, contact=?,password=?, speciality=? where email=?");  	            
	    
	              ps.setString(1,hospname) ;
	            ps.setString(2,address);
	            ps.setString(3,pincode); 
                ps.setString(4,city);
	            ps.setString(5,state); 
	            ps.setString(6,contact);
                ps.setString(7,password);
                ps.setString(8,speciality);
	            ps.setString(9,email);
	            int status=ps.executeUpdate();  
	              if(status>0){  
		            out.println("<center><h2>update successfully!</h2></center>");  %>
                    <jsp:include page="hospitalupdate.jsp" />
                    <%
		           
		        }else{  
		        	
		        	out.println("Sorry! unable to update record");  
		        }  
		          
		        out.close();  
	        }
            catch(Exception e){
                out.println(e);}  
	          
%>