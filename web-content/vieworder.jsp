<%@ page import="java.sql.*" %>
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

  .css-serial {
  font-family:Verdana, Geneva, Tahoma, sans-serif;
  border-radius: 10px;
   border-collapse: collapse;
   margin: 25px 0;
   font-size: 0.9em;
   min-width: 400px;
   border-radius: 5px 5px 0 0;
   overflow: hidden;
   box-shadow: 0 0 20px rgba(0,0,0,0.15);
  
}
.css-serial th{
  background-color: #009879;
  color: #ffffff;
  text-align: left;
  font-weight: bold;
  padding: 12px 15px;
}

.css-serial td{
  padding: 12px 15px;
  
}
.css-serial tr{
  border-bottom: 1px solid #dddddd;
}
.css-serial tr:nth-of-type(odd){
  background-color: rgba(128, 128, 128, 0.123);
}
.css-serial tr:last-of-type{
  border-bottom: 2px solid #009079;
}


.css-serial tr.active-row{
  font-weight: bold;
  color: #009879;
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
        <a href="pharmhome.jsp">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Dashboard</span>
        </a>
         <span class="tooltip">User Details</span>
      </li>
      <li>
       <a href="pharmupdate.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">User</span>
       </a>
       <span class="tooltip">UpdateUser</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-folder' ></i>
         <span class="links_name">File Manager</span>
       </a>
       <span class="tooltip">Files</span>
     </li>
     <li>
       <a href="./vieworder.jsp">
         <i class='bx bx-cart-alt' ></i>
         <span class="links_name">Order</span>
       </a>
       <span class="tooltip">View Orders</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-cog' ></i>
         <span class="links_name">Setting</span>
       </a>
       <span class="tooltip">Setting</span>
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
 					response.sendRedirect("pharmlogin.html");
 					}
 			       else if(session!=null)	{
 					String email=(String) session.getAttribute("email"); 
 					out.println("Hello ,  "+email); 	
           Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
                PreparedStatement pst=con.prepareStatement("select id, email from pharmacy where email=?");
                pst.setString(1,email); 
	            ResultSet rst=pst.executeQuery();
              String id=null;
              while(rst.next()){
                     id = rst.getString("id");
                 }
               session.setAttribute("id",id);
              }
		
				%>  </marquee></li> 
	</ul>
	<div class="container">
	<center>
		<h1>Medicine Ordered</h1>
		<hr>
		
<%
try{
     %>
     <html>
     <body>    
     <table border=1px cellspacing="2px" class='css-serial'>
    <tr><th>Pharmacy Id</th><th>Pharmacy Name</th><th>User Name</th><th>Email</th><th>Contact</th><th>Address</th><th>Drug</th><th>View Prescription</th><th>Cancel Medicine</th></tr>
<%
     String pharmid =  (String) session.getAttribute("id");
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
     PreparedStatement ps=con.prepareStatement("select * from ordermed where pharmid=?");
     ps.setString(1,pharmid);    
     ResultSet rs = ps.executeQuery();     
     while(rs.next()) {
    %>
    <tr>
    <td>
     <%=rs.getString(2)%>
   </td>
    <td>
     <%=rs.getString(3)%>
   </td>
   <td>
     <%=rs.getString(4)%>
    </td>
   <td>
     <%=rs.getString(5)%>
   </td>
    <td>
    <%=rs.getString(6)%>
   </td>
     <td>
    <%=rs.getString(7)%>
   </td>
      <td>
    <%=rs.getString(8)%>
   </td>
     <td>
    <a href="pharmprescription.jsp?id=<%=rs.getString(1)%>&email=<%=rs.getString(5)%>">View Prescription</a>
    </td>
    <td>
    <a href="deletemed.jsp?id=<%=rs.getString(1)%>">Cancel Medicine</a>
    </td>
    </tr>
   <%
    }
   
   out.println("</table>");
      out.println("</body>");
      out.println("</form>");
    con.close();
}
catch(Exception e)
{
    out.println(e.getMessage());
}

%>