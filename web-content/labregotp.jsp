<%@ page import="java.sql.*" %> 
<%@ page import="java.io.BufferedInputStream"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.util.Random"%>
<%@ page import="javax.net.ssl.HttpsURLConnection"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*"%>
<%  
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
				
			   
		
				%> 
<%
String contact = request.getParameter("val");
String admin=request.getParameter("admin");
    Random rand = new Random();
    int otp = rand.nextInt(999999);
    String apikey="nLPgcaJSq3XWFCRyrYKBDeQsIMpU62bk4EHv7hOAZf0zVd51GiVtmgs9Y6bBnipqFcMxHAovGdW2fSkz";
    String message="Medica Zone: Your otp is :"+otp;
if((contact!="")&&(admin!="")){      
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","karthi");
    PreparedStatement st = con.prepareStatement("insert into lab(id,admin,contact,otp) values(null,?,?,?)");
    st.setString(1,admin);
    st.setString(2,contact);
    st.setInt(3,otp);
    int x = st.executeUpdate(); 
    if(x>0){
      String sendId="TXTIND";
           
            String route="v3";
            message=URLEncoder.encode(message,"UTF-8");

            String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization="+apikey+"&sender_id="+sendId+"&message="+message+"&route="+route+"&numbers="+contact;
            URL url=new URL(myUrl);
            HttpsURLConnection conn=(HttpsURLConnection)url.openConnection();

            conn.setRequestMethod("GET");

            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("cache-control", "no-cache");
            
            int responseCode= conn.getResponseCode();
         
            StringBuffer res=new StringBuffer();
            BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
            while(true){
                String line=br.readLine();
                
                if(line==null){
                    break;
                }
                res.append(line);
            }
            out.println("otp sent successfully");
    }
    
}
 catch(Exception e){
        out.println(e);
    }
}
else{
  out.println("Enter contact and email number");
}
   %>