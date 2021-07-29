<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>reset password</title>
	<script>
    history.forward();
</script>
<style>
 *{
	 outline:0;
	 padding:0;
	 margin:0;
 }
 body{
	 background-image: url("./bg.jpg")
 }
 .container{
		  width:500px;
		  height: 400px;
		  background-color: rgba(231, 214, 214, 0.801);			text-align: center;
		  text-align: center;
		  border-radius: 20px;
		  font-family: sans-serif;
		  box-shadow: 0 5px 10px rgb(0 0 0 / 20%);
		  margin-top:10%;
	  }
	  .box{
		  padding:10% 0 0 0;
	  }
.box input[type="text"],input[type="password"]{
		  padding:10px;
		  border-radius: 10px;
		  margin-bottom: 5%;
		  margin-left: 10px;
		  outline: none;
		  border-color:transparent;
	  }
	  .box input[type="text"],input[type="password"]:hover{
		  border-color: rgba(47, 0, 255, 0.452);
	  }
	  .box input[type="text"],input[type="password"]:focus{
		  border-color: rgba(47, 0, 255, 0.452);
	  }
	  #validate{
		  padding:7px 10px;
		  background-color: rgba(18, 221, 187, 0.979);
		  border-color: transparent;
		  border-radius: 10px;
		  cursor: pointer;
		  outline:none;
	  } 
</style>
</head>
<body>
<%  
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
				
			     
		
				%> 
<% 
   String contact=request.getParameter("number");
   int otp=Integer.parseInt(request.getParameter("otp"));
%>
<center>
     <div class="container">
		<form action="pharmpasserver.jsp" method="POST" name="contact-form">
			<div>
                <label for="number">Mobile Number: </label>
				<input type="text" readonly name="contact" value="<%=contact%>" id="contact" >
				<br>
                <label for="otp" style="display:none">otp: </label>
				<input type="text" name="otp" id="otp" style="display:none" value="<%=otp%>">
				<br>
				<label for="password">Enter Password: </label>
				<input type="password" name="password" id="password" required>
				<br>
                <label for="password1">confirm Password: </label>
				<input type="password" name="password1" onkeyup="cp()" id="password1" required>
				<br>
				<button  id="validate"  onclick="submitForm()">Change Password</button>
				<p id="msg"></p>
			</div>
		
		</form>
	</div>
	</center>
    <script>
		function cp(){
			var password = document.getElementById("password").value;
            var password1 = document.getElementById("password1").value;
			if(password!=password1){
				var btn = document.getElementById("validate");
		   btn.disabled= true;
			}
            else{
                var btn = document.getElementById("validate");
		   btn.disabled= false;
            }
		}
			//function submitForm(){
		//var frm = document.getElementsByName('contact-form')[0];
	//	frm.submit();
		//frm.reset();
		//return false;
	//}
	</script>
</body>
</html>