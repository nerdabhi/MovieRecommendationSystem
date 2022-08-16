<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin_email") == null) {
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
        <title>Add Category</title>
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
            <form action="cat_b.jsp" method="POST" >
                <p><b>Add Category</b></p>
                
                <input type="text" name="cate" value="" placeholder="Enter Category*" />
                <input type="submit" value="Add Category" />
                <%=err_msg%>
            </form>
        </div>

    </body>
</html>
