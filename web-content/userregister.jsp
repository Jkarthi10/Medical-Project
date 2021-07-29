<!DOCTYPE html>
<!-- Designined by CodingLab - youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> User Registration Form </title>
    <link rel="stylesheet" href="style8.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script>
      history.forward();
  </script>
  <script>
    function findd(){
               
               var textt= document.getElementById("contact").value;
               var url = "usercontacteon.jsp?val="+textt;
               
               if(window.XMLHttpRequest)
                request = new XMLHttpRequest();
               try{
                   request.onreadystatechange=getInf;
                   request.open("POST",url,true);
                   request.send();
               }catch(e){
                   alert("Unable to connect to server");
               }
           }
           function getInf()
               {               
                   if(request.readyState>0){
                       var textt = request.responseText;                                               
                       document.getElementById('errr').innerHTML=textt;
                       comparestrr(textt);
                   }
                   
               }
      </script>
      <script>
       
        function sendotp(){			  
          var email=document.getElementById("email").value;
          var text= document.getElementById("contact").value;
          var btn=document.getElementById("validate");
          if((email!="")&&(text!="")){
          var url = "userregotp.jsp?val="+text+"&email="+email;  
            
            if(window.XMLHttpRequest)
             request = new XMLHttpRequest();
            try{
              request.onreadystatechange=getIn;
              request.open("POST",url,true);
              request.send();
            }catch(e){
              alert("Unable to connect to server");
            } }
          else{           
            alert("Enter Email and Contact");
            
          }
          }
          function getIn()
            {               
              if(request.readyState>0){
                var text = request.responseText;                                               
                document.getElementById('msg').innerHTML=text;                
              }
              
            }
         </script>
      <br><script>
       
       function find(){
               
               var text= document.getElementById("email").value;
               var url = "emaileon.jsp?val="+text;
               
               if(window.XMLHttpRequest)
                request = new XMLHttpRequest();
               try{
                   request.onreadystatechange=getInfo;
                   request.open("POST",url,true);
                   request.send();
               }catch(e){
                   alert("Unable to connect to server");
               }
           }
           function getInfo()
               {               
                   if(request.readyState>0){
                       var text = request.responseText;                                               
                       document.getElementById('err').innerHTML=text;
                       comparestr(text);
                   }
                   
               }
      </script>
      <script>
      function submitForm(){
        var frm = document.getElementsByName('contact-form')[0];
        frm.submit();
        frm.reset();
        return false;
      }
      function comparestrr(textt){
            var z = "contact already exists";
         var w = document.getElementById("errr").innerText;
             
             if( w==z ){
           var btn = document.getElementById("validate");
           btn.disabled= true;
              var btn1 = document.getElementById("val");
           btn1.disabled=true;               
            }
        else{
          var btn = document.getElementById("validate");
           btn.disabled= false; 
           var btn1 = document.getElementById("val");
           btn1.disabled=false;          
        }
        }
       function comparestr(text){
             var x = "email already exists";
             var y = document.getElementById("err").innerText;
             
            if(y==x){
           var btn = document.getElementById("validate");
           btn.disabled= true;
            var btn1 = document.getElementById("val");
           btn1.disabled=true;
                
            }
        else{
          var btn = document.getElementById("validate");
           btn.disabled= false;
          var btn1 = document.getElementById("val");
           btn1.disabled=false;          
        }
        }
        function checkpass(){
          var x=document.getElementById("mypassword").value;
          var y=document.getElementById("mypassword1").value;
          var btn=document.getElementById("val");
          if(x!=y){
              btn.disabled=true;
          }
          else{
            btn.disabled=false;
          }
        }
      function dis(){
            var btn = document.getElementById("validate");
            btn.disabled=true;
        }
       function display(){
        
         var x=document.getElementById("val");
         if(x.disabled==true){
             x.disabled = false;
         }
       }
      
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
<body>
  <div class="container" >
    <div class="title">User Registration</div>
    <div class="content">
      <form action="userreg.jsp"  method="post" name="contact-form">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" placeholder="Enter your name" name="name" id="name" required>
          </div>
          <div class="input-box">
            <span class="details">Date of Birth</span>
            <input type="date" name="dob" id="dob" placeholder="Enter your username" required>
          </div>
          <div class="input-box">
            <span class="details">Address</span>
            <textarea type="text" cols="38" name="address" id="address" rows="5" placeholder="Enter your address" required></textarea>
            </div>
          <div class="input-box">
            <span class="details">Pincode</span>
            <input type="text" placeholder="Enter your picode" id="pincode" name="pincode" pattern="^\d{6}$" required>

          </div>
          <div class="input-box">
            <span class="details">State</span>
            <input type="text" name="state" id="state" placeholder="Enter your number" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" placeholder="Enter your number"  name="contact"  onkeyup="findd();comparestrr()" id="contact"  pattern="^\d{10}$" required>
            <p id="errr" style="font-size:16px;color:red"></p>
          </div><div class="input-box">
            <span class="details">Email</span>
            <input type="text" onkeyup="find();comparestr()"   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" id="email" name="email" id="email" placeholder="Enter your username" required>
            <p id="err" style="font-size:16px;color:red"></p>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" id="mypassword" onkeyup="cps()" placeholder="Enter your password" required>
            <p class="flex1"><input type="checkbox"  onclick="myFunction()">Show Password</p>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" placeholder="Confirm your password" id="mypassword1" onkeyup="checkpass()" required>
          </div>
          <div class="input-box">
            <span class="details">OTP </span>
            <input type="text" placeholder=" OTP" name="otp" id="op" required>
          </div> 
        </div>
        <div class="gender-details"><span>Gender:  &nbsp; &nbsp; &nbsp;</span>
          <input type="radio" value="male" name="gender" id="dot-1" required> Male &nbsp;&nbsp;&nbsp;
          <input type="radio" value="female" name="gender" id="dot-2" required> Female&nbsp;&nbsp;&nbsp;
          <input type="radio" value="prefer not to say" name="gender" id="dot-3" required> Prefer not to say&nbsp;&nbsp;&nbsp;&nbsp;
          
        </div> <br>
        <div class="flex">          
        <div class="button">
          <input type="button" value="Get OTP" id="validate" onclick="sendotp();dis();">
          <p id="msg"></p>
        </div>
        <div class="button1">
            <input type="submit" value="Register" id="val" >
        </div>
        </div>        
      </form>
    </div>
  </div>
</body>
</html>
