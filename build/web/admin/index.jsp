<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
if(session.getAttribute("admin_email") == null){
//    String err = "Please Login First";
    response.sendRedirect("login.jsp");
    
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Dashboard</title>
        <link href="../style.css" rel="stylesheet" type="text/css"/>
        <style>
            .box{text-align: center;width:250px;display: inline-block; background:#ddd;}
            .box>a{text-decoration: none;color: black;background: #ff9944;padding: 15px 35px;border: 1px solid gray;border-radius: 5px;}
        
        </style>
    </head>
    <body>
        
        <div id="nav">
            <div>
                <div id="websitename"><h1><a href="index.jsp">Movie Recommendation System</a></h1></div>
                <div id="navRef">
                    <div class="refbox">
                        <span><%=session.getAttribute("admin_name")%></span>
                        <a href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>
                        <h2 style="text-align:center;color: #2E3949;">Admin Dashboard </h2>
                        
                        <br><br>
                        
                        
                        <div style="color: #2E3949;max-width:fit-content;margin: auto;">
                            
                                                        
                            <div class="box">
                                <h2>User Details</h2><br><br>
                                <a href="user_detail.jsp">Continue </a>
                            </div>
                                
                            <div class="box">
                                <h2>Movie Details</h2><br><br>
                                <a href="jobs.jsp">Continue </a>
                            </div>
                            
                            <div class="box">
                                <h2>Movie Categories</h2><br><br>
                                <a href="category.jsp">Continue </a>
                            </div>
                                                        
                        
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