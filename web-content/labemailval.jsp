<%@ page import="java.sql.*" %> 

<%
String email = request.getParameter("val");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
    PreparedStatement st = con.prepareStatement("select * from lab where email=?");
    st.setString(1,email);
    ResultSet rs = st.executeQuery(); 
    while(rs.next())
    {
    out.println("email already exists");
    }
   
    con.close();
}
catch(Exception e)
{
    out.println(e.getMessage());
}

%>