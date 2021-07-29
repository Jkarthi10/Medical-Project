<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<%
String id = request.getParameter("id");

try{
    	String e=(String)session.getAttribute("admin");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/medical", "root", "karthi");    
    PreparedStatement ps = con.prepareStatement("select result from labreport where id=? and admin='"+e+"'");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery(); 
    if(rs.next()){
        
        Blob blob = rs.getBlob("result");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
        response.setContentType("image/png");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }
    else{
        out.println("no image found with this id ");
    }
}
catch(Exception e){
    e.printStackTrace();
}  

%>