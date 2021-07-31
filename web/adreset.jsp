<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Forgot Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <!--css-->
     <link href="forget.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h2 class="text-center">RESET PASSWORD</h2>
                  <div class="panel-body">
    
                    <form id="register-form" role="form" action="adresetpass.jsp" autocomplete="off" onsubmit="return matchpass()" class="form" method="post">
    
                      <div class="form-group">
                        <div class="input-group">
                            New Password: <input id="pass1" name="pass1"  class="form-control"  type="password" required>
                        </div><br/>
                    <div class="input-group">
                        Re-enter Password: <input id="pass2"  name="pass2"  class="form-control"  type="password" required>
                        </div><br/>
                          
                      </div>
                      <div class="form-group">
                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                      </div>
                      
                      <input type="hidden" class="hide" name="token" id="token" value=""> 
                    </form>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
        <script>
function matchpass(){
var pass1=document.f1.pass1.value;
var pass2=document.f1.pass2.value;

  if(pass1.length<7){  
    alert("Password must be at least 7 characters long.");  
       f1.reset();
       return false;  
  }  
    else{
     if(pass1===pass2){
     return true;
      }  
    else{
     alert("password must be same!");
     return false;
     }  
    }


  
}
         </script>   
    </body>
</html>
