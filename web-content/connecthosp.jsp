<%@ page import="java.sql.*" %> 
<html>
<head>
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
  background-color: white;
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
       <input type="text" id="myinput" placeholder="Hospital name" name="" onkeyup="searchfun()">
      <table border=1px class='css-serial' id="mytable">
      <tr> <th>id</th><th>Hospital Name</th><th>Address</th><th>Contact</th><th>Email Id</th><th>Speciality</th><th>City</th><th>State</th></tr>
<%
String pincode = request.getParameter("pin");

try{

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
    PreparedStatement st = con.prepareStatement("select * from hospitals where pincode=?");
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
    <%=rs.getString(2)%>
    </td>
     <td>
    <%=rs.getString(3)%>
    </td>
    <td>
    <%=rs.getString(7)%>
    </td>
     <td>
    <%=rs.getString(9)%>
    </td>
     <td>
    <%=rs.getString(11)%>
    </td>     
     <td>
    <%=rs.getString(5)%>
    </td>
     <td>
    <%=rs.getString(6)%>
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