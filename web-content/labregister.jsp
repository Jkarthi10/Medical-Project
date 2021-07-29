<!DOCTYPE html>
<!-- Designined by CodingLab - youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Lab Registration Form </title>
    <link rel="stylesheet" href="style8.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script>
      history.forward();
  </script>
  <script>
    function sendotp(){
         var admin=document.getElementById("admin").value;
         var text= document.getElementById("contact").value;
       if((admin!="")&&(text!="")){
         var url = "labregotp.jsp?val="+text+"&admin="+admin;  
         if(window.XMLHttpRequest)
         request = new XMLHttpRequest();
         try{
               request.onreadystatechange=getIn;
               request.open("POST",url,true);
               request.send();
           }catch(e){
                 alert("Unable to connect to server");
           }
           }
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
   <script>
    
    function checkcontact(){
          
          var text= document.getElementById("contact").value;
          var url = "checklabcon.jsp?val="+text;
          
          if(window.XMLHttpRequest)
           request = new XMLHttpRequest();
          try{
              request.onreadystatechange=get;
              request.open("POST",url,true);
              request.send();
          }catch(e){
              alert("Unable to connect to server");
          }
      }
      function get()
          {               
              if(request.readyState>0){
                  var text = request.responseText;                                               
                  document.getElementById('con').innerHTML=text;
                  compare(text);
              }
              
          }
   </script>
   
 <script>
	 
    function findadmin(){
          
          var textt= document.getElementById("admin").value;
          var url = "labadminval.jsp?val="+textt;
          
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
                  var textadmin = request.responseText;                                               
                  document.getElementById('erradmin').innerHTML=textadmin;
                  comparestradmin(textadmin);
              }
              
          }
   </script>
      <script>
       function find(){
           
           var text= document.getElementById("email").value;
           var url = "labemailval.jsp?val="+text;
           
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
      <br>
      <script>
      function submitForm(){
        var frm = document.getElementsByName('contact-form')[0];
        frm.submit();
        frm.reset();
        return false;
      }
      function comparestradmin(textadmin){
        var z = "admin already exists";
		 var w = document.getElementById("erradmin").innerText;
         
         if( w==z ){
			 var btn = document.getElementById("validate");
		   btn.disabled= true;
		  var btn1=document.getElementById("val");
			  btn1.disabled=true;
            
        }
		else{
			var btn = document.getElementById("validate");
		   btn.disabled= false;
           var btn1=document.getElementById("val");
			  btn1.disabled=false;
		   
		}
    }
       function comparestr(text){
             var x = "email already exists";
             var y = document.getElementById("err").innerText;
             
            if(y==x){
           var btn = document.getElementById("validate");
           btn.disabled= true;
           var btn1=document.getElementById("val");
			  btn1.disabled=true;
                
            }
        else{
          var btn = document.getElementById("validate");
           btn.disabled= false;
           var btn1=document.getElementById("val");
			  btn1.disabled=false;
           
        }
        }
         function compare(text){
        var z = "contact already exists";
		 var w = document.getElementById("con").innerText;
         
         if( w==z ){
			 var btn = document.getElementById("validate");
		   btn.disabled= true;
		  var btn1=document.getElementById("val");
			  btn1.disabled=true;
            
        }
		else{
			var btn = document.getElementById("validate");
		   btn.disabled= false;
		    var btn1=document.getElementById("val");
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
    <div class="title">Lab Centers Registration</div>
    <div class="content">
      <form action="labreg.jsp" method="post" >
        <div class="user-details">
          <div class="input-box">
            <span class="details">Admin</span>
            <input type="text" placeholder="Use this Admin ID for Login" name="admin" id="admin" onkeyup="findadmin();comparestradmin()" required>
            <p id="erradmin" style="font-size:16px;color:red"></p>
          </div>
          <div class="input-box">
            <span class="details">Lab Name</span>
            <input type="type" name="labname" id="labname" placeholder="Enter your Lab Name" required>
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
            <span class="details">Phone Number</span>
            <input type="text" placeholder="Enter your number"  name="contact"  onkeyup="checkcontact();compare()" id="contact"  pattern="^\d{10}$" required>
            <p id="con" style="font-size:16px;color:red"></p>
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
          <div class="gender-details"><span>Home Blood Sample Collection:  &nbsp; &nbsp; &nbsp;</span>
            <input type="radio" value="Available" name="homesample" id="dot-1" required> Avaiable &nbsp;&nbsp;&nbsp;
            <input type="radio" value="Not Available" name="homesample" id="dot-2" required> Not Avaiable&nbsp;&nbsp;&nbsp;                
          </div><br><br>
          <div class="input-box">
            <span class="details">OTP </span>
            <input type="text" placeholder=" OTP" name="otp" id="op" required>
          </div> 
        </div>
         <br>
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
