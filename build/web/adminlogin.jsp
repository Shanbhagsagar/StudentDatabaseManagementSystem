<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin Login</title>
        <!-- Custom fonts for this template-->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Custom styles for this template-->
        <link href="adminlogin.css" rel="stylesheet">
    </head>
    <body>

        <div class="wrapper">
            <div id="formContent">
                <!-- Tabs Titles --> 
                <br/><br/>

                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="pic\logo1.png" id="icon" alt="User Icon" /><br/><br/>
                    <div class="font1"><center>ADMIN LOGIN</center></div>
                </div>

                <!-- Login Form -->
                <form method="post" action="adminpass.jsp" name="myform" onsubmit="return validateform()" >
                    <div class="form-group"> 
                        <input type="text" id="inputName" class="fadeIn second" name="adminid" placeholder="LOGIN" required>
                    </div>
                    <div class="form-group">
                        <input type="password"  id="inputPassword" class=" fadeIn third" name="password" placeholder="PASSWORD" required>
                    </div>
                    <input type="submit"  class="fadeIn fourth" value="Log In">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="adforget.jsp">Forgot Password?</a>
                </div>
            </div>
        </div>
        <!-- Validation -->
        <script>
            function validateform() {
                var password = document.myform.password.value;
                if (password.length < 7) {
                    alert("Password must be at least 7 characters long.");
                    myform.reset();
                    return false;
                }
            }
        </script>    
    </body>
</html>