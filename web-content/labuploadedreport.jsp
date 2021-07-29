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
<title>Uploaded report</title>
<style type="text/css">
.css-serial {
  counter-reset: serial-number;  /* Set the serial number counter to 0 */
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
   counter-reset: serial-number;  /* Set the serial number counter to 0 */
}
.css-serial th{
  background-color: #009879;
  color: #ffffff;
  text-align: left;
  font-weight: bold;
  padding: 12px 15px;
}
.css-serial td:first-child:before {
  counter-increment: serial-number;  /* Increment the serial number counter */
  content: counter(serial-number);  /* Display the counter */
}

.css-serial td{
  padding: 12px 15px;
  
}
.css-serial tr{
  border-bottom: 1px solid#dddddd;
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
        <a href="labhome.jsp">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Dashboard</span>
        </a>
         <span class="tooltip">User Details</span>
      </li>
      <li>
       <a href="labupdate.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">User</span>
       </a>
       <span class="tooltip">UpdateUser</span>
     </li>
     <li>
       <a href="labuploadedreport.jsp">
         <i class='bx bx-folder' ></i>
         <span class="links_name">File Manager</span>
       </a>
       <span class="tooltip">View report</span>
     </li>
	  <li>
       <a href="labresultupload.jsp">
         <i class='bx bx-pie-chart-alt-2' ></i>
         <span class="links_name">Analytics</span>
       </a>
       <span class="tooltip">Upload Report</span>
     </li>
	 <li>
       <a href="viewappointment.jsp">
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
				
			       if(session.getAttribute("admin")==null){
 					response.sendRedirect("lablogin.html");
 					}
 			       else if(session!=null)	{
 					String admin=(String) session.getAttribute("admin");
 					out.println("Hello ,  "+admin); 					
 			       }
		
				%>  </marquee></li> 
	</ul>
  <div class="container">
	<center>
		<h1>Uploaded record</h1>
		<hr>
		
<%
try{
     %>
     <html>
     <body>    
     <input type="text" id="myinput" placeholder="patient name" name="" onkeyup="searchfun()">
     <table border=1px  class="css-serial" id="mytable">
    <tr><th>S.no</th><th>Patient Name</th><th>email id</th><th>contact</th><th>type of test</th><th>View Result</th><th>Update Result</th></tr>
<%
     String admin =  (String) session.getAttribute("admin");
   
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
     PreparedStatement ps=con.prepareStatement("select * from labreport where admin=?");
     ps.setString(1,admin);    
     ResultSet rs = ps.executeQuery();     
     while(rs.next()) {
    %>
    <tr>
    <td>
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
     <%=rs.getString(8)%>
   </td>
   
     <td>
    <a href="result.jsp?id=<%=rs.getString(1)%>">View Result</a>
    </td>
    <td>
    <a href="updateresult.jsp?id=<%=rs.getString(1)%>">Update Result</a>
    </td>
    </tr>
      <%
    }
   %>
  </table>
    <script>
      function searchfun(){

      let filter = document.getElementById('myinput').value.toUpperCase();

      let mytable = document.getElementById('mytable');

      let tr = mytable.getElementsByTagName('tr');

      for(var i=0; i<tr.length; i++){
        let td = tr[i].getElementsByTagName('td')[1];
     
        if(td){
          let textvalue = td.textContent || td.innerHTML;

          if(textvalue.toUpperCase().indexOf(filter) > -1){
            tr[i].style.display = "";
          }else{
            tr[i].style.display = "none";
          }
        }
      }
    }
    </script>
    </center>
    </body>
    </html>
    <%
   
    con.close();
}
catch(Exception e)
{
    out.println(e.getMessage());
}

%>