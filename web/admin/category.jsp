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
        <title>Movie Category</title>
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
                        
                        <h2 style="text-align:center;color: #2E3949;">Category</h2>
        <div style="width: fit-content;margin: auto;">
            <a style="text-align: center;display: block;padding: 10px;" href="add_cate.jsp">Add Category</a>
        </div>

                        
                        
<div  style="color: #2E3949;max-width:300px;;margin: auto;">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>

                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
                    Statement stm = con.createStatement();

                    String s = "SELECT * FROM `movie_categories`";
                    ResultSet r = stm.executeQuery(s);
                    while (r.next()) {
                        //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
                %>

                <tr>   
                    <td><%=r.getString("id")%></td>
                    <td><%=r.getString("category")%></td>
                </tr>

                <%
                    }
                    r.close();

                %>
            </tbody>
        </table>
</div>

    </body>
</html>
