<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("admin_email") == null){
    response.sendRedirect("index.jsp");
}
String err_msg = request.getParameter("err"); 
    if(err_msg == null){
    err_msg = "";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
        <link href="../style.css" rel="stylesheet" type="text/css"/>
        
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
        
             <div class="formDiv">
                
                <form action="registration.jsp" method="POST">
                    <p><b>USER REGISTER HERE</b></p>
                    <!--<span>Name</span>-->
                    <input type="text" name="rname" value="" placeholder="Full Name*"/>
                    <!--<span>Email</span>-->
                    <input type="email" name="remail" value="" placeholder="Email*"/>
                    <!--<span>Password</span>-->
                    <input type="text" name="rmob" value=""  placeholder="Mobile no*"/>
                
                    <input type="password" name="rpass" value=""  placeholder="Password*"/>
                    <!--<span>Re-Enter Password</span>-->
                    <input type="password" name="re_rpass" value=""  placeholder="Re-Enter Password*"/>
                    <input type="submit" value="Register" />
                    <%=err_msg%>
                </form>
             </div>
        
    </body>
</html>
