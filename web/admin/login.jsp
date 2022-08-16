<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    
    String  err = request.getParameter("err");
    
    if(err == null){
        err = "";
    }
    
if(session.getAttribute("admin_email") != null){
//    String err = "Please Login First";
    response.sendRedirect("index.jsp");
    
}


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Recommendation System</title>
        <link href="../style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="nav">
            <div>
                <div id="websitename"><h1><a href="../index.jsp">Movie Recommendation System</a></h1></div>
            </div>
        </div>
        <br><br>              
        <div  style="color: #2E3949;max-width:350px;margin: auto;">
            <h1 style="text-align:center;">Admin Login Here</h1>
            <form id="adminLogin" action="alogin.jsp" method="POST">
                <input type="email" name="aemail" placeholder="Enter admin Email" />
                <input type="password" name="apass" placeholder="Enter Password"/>
                <input type="submit" value="Login" />
                <br>
                <p style="text-align: center"><%=err%></p>
            </form>
        </div>
        <script>
            var userProItem = document.getElementById('userProItem');
            var userName = document.getElementById('userName');
            userName.onclick = function(){
                if(userProItem.style.display === 'block'){
                    userProItem.style.display = 'none';
                }else{
                    userProItem.style.display = 'block';
                }

            };
        </script>
    </body>
</html>