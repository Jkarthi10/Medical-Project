<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="./style2.css" rel="stylesheet">
 <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile Update</title>
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
    	resize:none;
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
			 <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus icon'></i>
        <div class="logo_name">CodingLab</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
      <li>
        <a href="userhome.jsp">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Dashboard</span>
        </a>
         <span class="tooltip">User Details</span>
      </li>
      <li>
       <a href="userupdate.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">User</span>
       </a>
       <span class="tooltip">UpdateUser</span>
     </li>
     <li>
       <a href="labtestreport.jsp">
         <i class='bx bx-folder' ></i>
         <span class="links_name">File Manager</span>
       </a>
       <span class="tooltip">Lab test Report</span>
     </li>
	  <li>
       <a href="SearchPharm.html">
         <i class='bx bx-pie-chart-alt-2' ></i>
         <span class="links_name">Analytics</span>
       </a>
       <span class="tooltip">Buy Medicines</span>
     </li>
     <li>
       <a href="./orderedmedicine.jsp">
         <i class='bx bx-cart-alt' ></i>
         <span class="links_name">Order</span>
       </a>
       <span class="tooltip">View Orders</span>
     </li>
     <li>
       <a href="SearchLab.html">
        <i class='bx bx-pie-chart-alt-2' ></i>
         <span class="links_name">Analytics</span>
       </a>
       <span class="tooltip">Book Appointment</span>
     </li>
	 <li>
       <a href="bookedapp.jsp">
         <i class='bx bx-grid-alt' ></i>
         <span class="links_name">View Appointment</span>
       </a>
       <span class="tooltip">View Appointment</span>
     </li>
     <li class="profile">
         <a href="Logout"><i class='bx bx-log-out' id="log_out" ></i></a>
     </li>
    </ul>
  </div>
  <section class="home-section">
      <div class="text">Dashboard</div>
			 <marquee> 
		<%  
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("email")==null){
 					response.sendRedirect("userlogin.html");
 					}
 			       else if(session!=null)	{
 					String email=(String) session.getAttribute("email");
 					out.println("Hello ,  "+email);
 					
 			       }
		
				%> </marquee></li> 
	</ul>
	<div class="container">
	<center>
		<h1>Update Profile</h1>
		<hr>
		
	<%@page import="java.sql.*" %>
 		<% 
			try{
                String e=(String)session.getAttribute("email");
			Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
            PreparedStatement ps=con.prepareStatement("select * from users where email='"+e+"'");
 			
 			ResultSet rs=ps.executeQuery();
 			while(rs.next()){
 		%> 
 	<form action="userupserver.jsp " method="get">		
	<div class="reg">
	
	<table>
		<tr><td></td></tr>
		<tr><td>Name</td><td><input  type="text" value="<%=rs.getString("name")%>" name="name" placeholder="Full Name" required="required"></td></tr>
		<tr><td>D.O.B:</td><td><input readonly="readonly" value="<%=rs.getString("dob")%>" name="dob" required="required"></td></tr>
		<tr><td>Address:</td><td><textarea rows="4" cols="40" name="address" placeholder="Enter your full address ............" required="required"><%=rs.getString("address")%></textarea></td></tr>
        <tr><td>Pincode:</td><td><input type="text"  value="<%=rs.getString("pincode")%>" name="pincode" required="required" placeholder="xxxxxx"></td></tr>
        <tr><td>State:</td><td><input type="text" value="<%=rs.getString("state")%>" name="state" required="required" placeholder="state"></td></tr>
		<tr><td>Gender:</td><td><input readonly="readonly" value="<%=rs.getString("gender")%>" required="required" >
		<tr><td>Contact No:</td><td><input type="tel" value="<%=rs.getString("contact")%>" pattern="^\d{10}$" name="contact" placeholder="xxxxxxxxx"  required="required"></td></tr>
		<tr><td>Email Id:</td><td><input readonly="readonly" value="<%=rs.getString("email")%>" name="email"  ></td></tr>
		<tr><td>Password :</td><td><input type="password" value="<%=rs.getString("password")%>" name="password" placeholder="****" required="required" id="mypassword"></td></tr>
		<tr><td></td><td><input type="checkbox" onclick="myFunction()">Show Password</td></tr>
		
		<tr><td><td><input type="submit" name="submit" value="Update"></tr>

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
	
	<br>
	
 	</section>
</body>
</html>