<%@ page import="java.sql.*" %> 

<%
String contact = request.getParameter("val");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
    PreparedStatement st = con.prepareStatement("select * from users where contact=?");
    st.setString(1,contact);
    ResultSet rs = st.executeQuery(); 
    while(rs.next())
    {
    out.println("contact already exists");
    }
   
    con.close();
}
catch(Exception e)
{
    out.println(e.getMessage());
}

%>