<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user_email") != null) {
        response.sendRedirect("index.jsp");
    }
    String err_msg = request.getParameter("err");
    if (err_msg == null) {
        err_msg = "";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <div id="nav">
            <div>
                <div id="websitename"><h1><a href="index.jsp">Movie Recommendation System</a></h1></div>
                <div id="navRef">
                    <div class="refbox">
                        <a href="login.jsp">Login</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="formDiv">

            <form action="registration.jsp" method="POST">
                <p><b>REGISTER HERE</b></p>
                <!--<span>Name</span>-->
                <input type="text" name="rname" value="" placeholder="Full Name*"/>
                <!--<span>Email</span>-->
                <input type="email" name="remail" value="" placeholder="Email*"/>

                <input type="text" name="rmob" value=""  placeholder="Mobile no*"/>
                <!--<span>Password</span>-->
                <input type="password" name="rpass" value=""  placeholder="Password*"/>
                <!--<span>Re-Enter Password</span>-->
                <input type="password" name="re_rpass" value=""  placeholder="Re-Enter Password*"/>

                <div style="margin-top: 15px;">
                    <span>Captcha Code: </span>
                    <span style="position: relative;border: 1px solid #ccc;background: #ccc;width: fit-content;padding: 2px;font-weight: bold;">
                        <span id="captcha"></span>
                        <span style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;"></span>
                    </span>
                    <img id="captref" src="img/refresh.png" alt="" style="cursor: pointer;width: 16px;display: inline;padding-left: 15px;">
                </div>
                <input type="text" name="captcha" placeholder="Enter Captcha Code" />
                <input id="submitform" type="submit" value="Register" />
                <%=err_msg%>
            </form>
        </div>
        <script>


            var captcha;
            captchaSession();
            document.getElementById('captref').onclick = function () {
                captchaSession();
            };

            document.getElementById('submitform').onclick = function () {
                var captchaTxt = document.getElementsByName('captcha')[0].value;
                if (captchaTxt !== '') {
                    if (captchaTxt == captcha) {
                        return true;
                    } else {
                        alert('Wrong Captcha');
                        return false;
                    }
                } else {
                    alert('Please Enter Captch Code');
                    return false;
                }

                
            };

            function captchaSession() {
                captcha = captchaCode();
                document.getElementById('captcha').innerHTML = captcha;
            }

            function captchaCode() {
                var text = "";
                var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

                for (var i = 0; i < 5; i++)
                    text += possible.charAt(Math.floor(Math.random() * possible.length));

                return text;
            }
        </script>
    </body>
</html>
