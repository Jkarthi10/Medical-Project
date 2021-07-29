<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result Update</title>
<style type="text/css">
.container {
		border-radius: 20px;
		background-color: #f2f2f2;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
		padding: 2px;
}
.roundbox 	{
		display: inline-block;
		color:yellow;
    	height: 40px;
    	background-color: #9C9E9E;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
}
.reg td	{
		text-align: center;
   		font-size:20px ;
}
.welcome	{
		display: inline-block;
    	float: right;
       	width: 370px;
  		line-height: 40px;
       	border-radius:30px;
      	cursor: pointer;
}
.reg table{
		width: 500px; 
		height: 425px; 
		border-style:50px;
		background-color:floralwhite;
		border-radius:20px;
}    
.reg input[type="tel"],input[readonly="readonly"],input[type="number"],input[type="text"],input[type="password"],input[type="date"],select {	
		width: 300px; height: 35px; 
}
.reg input[readonly="readonly"]	{
      	background-color: #E2EAEA;
      } 
.reg textarea   {
		width: 300px;
    	height: 50px;
    	resize: vertical;
}
.reg input[type="submit"]{
		width: 300px; height: 35px;  border-bottom: 2px solid black;
      	border-radius:30px;
}
option	{
		font-size:20px;
      	font-family: cursive;
}
</style>
<script>

	function submitForm(){
		var frm = document.getElementsByName('contact-form')[0];
		frm.submit();
		frm.reset();
		return false;
	}
		function myFunction() {
    	var x = document.getElementById("mypassword");
    	if (x.type === "password") {
        x.type = "text";
    	} else {
        x.type = "password";
    }
}
</script>
</head>
    <body bgcolor="#ADD8E6">
	<div class="container">
		<ul>
		<a href="labhome.jsp"> <li class="roundbox">User Details</li></a>
			<a href="labupdate.jsp"> <li class="roundbox">Update Profile</li></a>
			<a href="viewappointment.jsp"> <li class="roundbox">View Appointment</li></a>			
			<a href="labuploadedreport.jsp"><li class="roundbox">View Uploaded Report</li></a>
			<a href="Logout"><li class="roundbox">Logout</li></a>
 			<li class="welcome"><marquee> 
		<%  
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("admin")==null){
 					response.sendRedirect("lablogin.html");
 					}
 			       else if(session!=null)	{
 					String admin=(String) session.getAttribute("admin");
 					out.println("Hello ,  "+admin);
 					
 			       }
		
		%>
				
			  </marquee></li> 
	</ul>
	<center>
		<h1>Update result</h1>
		<hr>
	<%@page import="java.sql.*" %>
 	<% 		
	  String id = request.getParameter("id");	    
            try
			{ 			
			Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
 			PreparedStatement ps=con.prepareStatement("select * from labreport where id=?");
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
 			while(rs.next())
			 {
	%> 	
		
 	<form action="updateresult" method="POST" name="contact-form" enctype="multipart/form-data"> 
	<div class="reg">
	
	<table>
    <tr><td></td></tr>
        <tr><td style="display:none">id</td><td style="display:none"><input  type="text" readonly value="<%=rs.getString("id")%>" name="id" required></td></tr>
		<tr>
        <td>Lab Id:</td>
        <td><input  readonly="readonly" value="<%=rs.getString("labid")%>" name="labid"  required="required"></td>
        </tr>
		<tr>
        <td>Admin:</td><td>
        <input  readonly="readonly" value="<%=rs.getString("admin")%>" name="admin"  required="required"></td>
        </tr>
		<tr>
        <td>Lab Name:</td>
        <td><input readonly="readonly" value="<%=rs.getString("labname")%>" name="labname" required="required"></td>
        </tr>
		<tr><td>Address:</td>
        <td><input readonly="readonly" value="<%=rs.getString("address")%>" name="address" required="required"></td>
        </tr>
        <tr><td>Patient Name:</td><td><input type="text"  name="name" placeholder="enter patient name" required="required"></td></tr>
		<tr><td>Email: </td><td><input type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" name="email" placeholder="Enter User email"></td></tr>
        <tr><td>Contact: </td><td><input type="text" pattern="^\d{10}$" name="contact" placeholder="contact number" required></td></tr>
        <tr><td>type of test:</td><td><input type="text"  name="typeoftest" placeholder="test name" required="required"></td></tr>
        <tr><td>Upload result: </td><td><input type="file" name="image" required></td></tr>
        <tr><td></td><td><input type="submit" value="update" id="validate"></td></tr>
		
	</table>
	</div>
	</form>
	</center>
		<%
		}
        	con.close();
			}
 				catch(Exception e){
 				e.printStackTrace();			
 			}
 		%>
	<br>
	</div>
	
</body>
</html>