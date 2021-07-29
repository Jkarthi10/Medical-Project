<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="style3.css">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>
</head>
<body bgcolor="#ADD8E6">

	
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
		<hr>
		 <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img class="backImg" src="lo.jpg" alt="">
        <div class="text">
          <span class="text-1">Welcome Back!!! <br> Login</span>
          <span class="text-2">Let's get connected</span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="lo.jpg" alt="">
        <div class="text">
          <span class="text-1">Complete miles of journey <br> with one step</span>
          <span class="text-2">Let's get started</span>
        </div>
      </div>
    </div>
    <form action="pharmlog" method="post">
      <div class="form-content">
        <div class="login-form">
          <div class="title">Login</div>
          <div class="input-boxes">
            <div class="input-box">
              <i class="fas fa-envelope"></i>
              <input type="text" placeholder="Enter your email" required name="email">
            </div>
            <div class="input-box">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Enter your password" required name="password" id="mypassword">
            </div>
            <div class="text"><a href="#">Forgot password?</a></div><input type="checkbox" onclick="myFunction()">Show
            Password
            <div class="button input-box">
              <input type="submit" value="Sumbit">
            </div>
            <div class="text sign-up-text">Don't have an account? <label for="flip">Sigup now</label></div>
          </div>
        </div>
        <div class="signup-form">
          <div class="title">Signup</div>
          <div class="input-boxes">
            <div class="button input-box">
              <a href="pharm.jsp"><div class="in"><input type="button" class="in" value="Get Registered"></div></a>
            </div>
            <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
          </div>
        </div>
      </div>
    </form>
  </div>
</body>
</html>