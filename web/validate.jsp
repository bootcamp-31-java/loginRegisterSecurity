<%-- 
    Document   : validate
    Created on : Oct 31, 2019, 1:46:06 PM
    Author     : Faisal Dwi Rahmanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%@page import="net.tanesha.recaptcha.ReCaptchaResponse"%>
<!DOCTYPE html>

<html>
    <body>
        <%
            String remoteAddr = request.getRemoteAddr();
            ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
            reCaptcha.setPrivateKey("6LdYYcAUAAAAANfCK1QhXLFeL-JDGEIthltjmqwV");

            String challenge = request.getParameter("recaptcha_challenge_field");
            String uresponse = request.getParameter("recaptcha_response_field");
            ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

            if (reCaptchaResponse.isValid()) {
                out.print("Answer was entered correctly!");
            } else {
                out.print("Answer is wrong");
            }
        %>
    </body>
</html>
