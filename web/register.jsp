<%-- 
    Document   : register
    Created on : Oct 30, 2019, 2:32:02 PM
    Author     : Rezaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!--Bootstrap register II-->
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js"></script>
        <link type="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <link type="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">-->

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>

  <body class="bg-dark">  
    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header"><h3>Register an Account</h3></div>
        <div class="card-body">
          <form name="RegisterForm" action="registerservlet" method="POST">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" onkeypress="validate(event)" maxlength="3" id="employeeId" name="employeeId" class="form-control" placeholder="Employee ID" required="required" autofocus="autofocus">
                    <label for="employeeId">Employee ID</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required="required">
                <label for="email">Email address</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="password" name="password" class="form-control" placeholder="Password" title="Password must contain at least 8 characters, including UPPER/lowercase and numbers" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" minlength="8" maxlength="32" required="required">
                    <label for="password">Password</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="repassword" name="repassword" title="Please enter the same Password as above" class="form-control" placeholder="Confirm password" required="required">
                    <label for="repassword">Confirm password</label>
                  </div>
                </div>
              </div>
            </div>
            <!--<button type="submit" onclick="return validatePassword()" class="col-md-6 align-content-lg-center btn btn-primary border-dark" id="savealert">Register</button>-->
            <button type="submit" class="col-md-6 align-content-lg-center btn btn-primary border-dark" id="savealert">Register</button>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="login.jsp">Login Page</a>
            <a class="d-block small" href="forgot_password.jsp">Forgot Password?</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <script type="text/javascript">
              function validatePassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("repassword").value;
                if (password != confirmPassword) {
                  alert("Passwords do not match.");
                  return false;
                }
                return true;
              }
    </script>

    <script>
      function validate(evt) {
        var theEvent = evt || window.event;

        // Handle paste
        if (theEvent.type === 'paste') {
          key = event.clipboardData.getData('text/plain');
        } else {
          // Handle key press
          var key = theEvent.keyCode || theEvent.which;
          key = String.fromCharCode(key);
        }
        var regex = /[0-9]|\./;
        if (!regex.test(key)) {
          theEvent.returnValue = false;
          if (theEvent.preventDefault)
            theEvent.preventDefault();
        }
      }
    </script>
  </body>
</html>
