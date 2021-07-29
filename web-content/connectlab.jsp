<%@ page import="java.sql.*" %> 

<%
String pincode = request.getParameter("pin");

try{
%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
   body{
   
    background: url(./bg.jpg);
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
  background-color:white;
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
 input[type="text"]{
    padding: 10px 15px;
    border-radius: 10px;
    outline: none;
    font-size:18px;   
  }
  input[type="text"]:hover{
    border-color: greenyellow;
  }
  </style>
  </head>
  <body>    
  <center>
  <input type="text" id="myinput" placeholder="Lab name" name="" onkeyup="searchfun()">
  <table border=1px class="css-serial" id="mytable">
    <tr><th>Id</th><th>Lab Center Name</th><th>Email id</th><th>Contact</th><th>Address</th><th>Collect blood from home option</th><th>Book Appointment</th></tr> 
    
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
    PreparedStatement st = con.prepareStatement("select * from lab where pincode=?");
    st.setString(1,pincode);
    ResultSet rs = st.executeQuery(); 
    while(rs.next())
    {
     %>
     
    <tr>
    <td>
     <%=rs.getString(1)%>
   </td>
    <td>
     <%=rs.getString(3)%>
   </td>
    <td>
     <%=rs.getString(4)%>
   </td>
   <td>
     <%=rs.getString(6)%>
    </td>
   <td>
     <%=rs.getString(7)%>
   </td>   
     
    </td>   
    <td>
     <%=rs.getString(9)%>
   </td> 
    <%
    String text=rs.getString(9);
    if(text.length()==13){
        %>
         <td>
    
    </td>
    <%
    }
    else{
        %>
        <td>
        <a href="labappoinment.jsp?id=<%=rs.getString(1)%>&labname=<%=rs.getString(3)%>">Book Appoinment</a>
        </td>
    <%
    }
    %>
    
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
    out.println(e);
}

%>