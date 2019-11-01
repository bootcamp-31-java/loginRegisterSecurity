<%-- 
    Document   : login
    Created on : Oct 31, 2019, 10:07:58 PM
    Author     : Rezaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!--        Im not robot-->
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://www.google.com/recaptcha/api.js?render=reCAPTHA_site_key"></script>
    <script src='https://www.google.com/recaptcha/api.js?onload=onloadCaptchaCallback&render=explicit' async defer></script>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
  </head>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
          <form name="LoginForm" action="loginservlet" method="POST">
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
                <label for="inputEmail">Email address</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required="required">
                <label for="inputPassword">Password</label>
              </div>
            </div>
            <div class="form-group">
              <div class="checkbox">
                <label>
                  <input type="checkbox" value="remember-me">
                  Remember Password
                </label>
              </div>
            </div>
<!--            <form action="validate.jsp" method="POST">
              <div class="form-group">

                <div class="g-recaptcha" data-sitekey="6LdYYcAUAAAAAB_PaWzdcWpptoFNFvN1zFLnU-iV"></div>
                <%
                  ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LdYYcAUAAAAAB_PaWzdcWpptoFNFvN1zFLnU-iV", "6LdYYcAUAAAAANfCK1QhXLFeL-JDGEIthltjmqwV", false);
                  out.print(c.createRecaptchaHtml(null, null));
                %>

                                  c.createRecaptchaHtml(null, null);
              </div>
            </form>-->

            <button type="submit" class="btn btn-primary" id="savealert">Login</button>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="register.jsp">Register an Account</a>
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

  </body>
</html>
