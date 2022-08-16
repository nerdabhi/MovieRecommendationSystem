<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
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
        <title>Add Movies</title>
        <link href="../style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>

        <div id="nav">
            <div>
                <div id="websitename"><h1><a href="index.jsp">Online Movie Recommendation</a></h1></div>
                <div id="navRef">
                    <div class="refbox">
                        <span><%=session.getAttribute("admin_name")%></span>
                        <a href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="formDiv">
            <form action="uploadServlet" method="POST" enctype="multipart/form-data">

                <p><b>Add Movies</b></p>
                <!--<span>Name</span>-->
                <input type="text" name="mname" value="" placeholder="Movie Name*"/>
                <!--<span>Email</span>-->
                <textarea name="mdetail" placeholder="Movies Deatils*"></textarea>
                <!--<span>Password</span>-->
                
                <input type="text" name="video" value="" placeholder="Video Link*"/>
                
                <select name="cate">
                    
                    <option value="" disabled selected>Select Category</option>
                    
                    <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
                    Statement stm = con.createStatement();

                    String s = "SELECT * FROM `movie_categories`";
                    ResultSet r = stm.executeQuery(s);
                    while (r.next()) {
                        //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
                %>

                <option value="<%=r.getString("id")%>"><%=r.getString("category")%></option>
                
                <%
                    }
                    r.close();

                %>
                </select>

                Select a image to upload: <br />
                <input style="background: #fff;" type = "file" name="mimg" size="100" />
                <br />
                
                <input type="submit" value="Register" />
                <%=err_msg%>
            </form>
        </div>

    </body>
</html>
