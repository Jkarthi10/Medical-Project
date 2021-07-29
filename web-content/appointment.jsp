<%@ page import="java.sql.*" %>
<script>
	    if(window.history.replaceState){
			window,history.replaceState(null,null, window.location.href);
		}
	</script>
<%
            String labid =request.getParameter("labid");
			String labname=request.getParameter("labname");
            String pname =request.getParameter("pname");
			String paddress =request.getParameter("paddress");
            String pcontact =request.getParameter("pcontact");
			String pemail=request.getParameter("pemail");
			String timeslot=request.getParameter("timeslot");
			String typeoftest=request.getParameter("typeoftest");
            String admin=request.getParameter("admin");
			
try{
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
   PreparedStatement ps=con.prepareStatement("insert into labappointment(id,labid,labname,pname,paddress,pcontact,pemail,timeslot,typeoftest,admin) values(null,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,labid);
	        ps.setString(2,labname);
	        ps.setString(3,pname); 
			ps.setString(4,paddress); 
	        ps.setString(5,pcontact);
	        ps.setString(6,pemail);
	        ps.setString(7,timeslot);  
            ps.setString(8,typeoftest); 
            ps.setString(9,admin);
     int x = ps.executeUpdate();
     if(x>0){
          out.println("<center><h1 style='color:darkgreen'>Appointment successfully Registered</h1></center>");
          %>
		  <jsp:include page="labappoinment.jsp" />
          <%
       }
      else{
         out.println("Appointment Failed...");
        }
   }catch(Exception e){
      out.println("Go to login!!!!!!"+e);
     }
%>