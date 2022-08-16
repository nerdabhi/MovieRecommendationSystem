<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    if (session.getAttribute("admin_email") == null) {
//    String err = "Please Login First";
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Detail</title>
        <link href="../style.css" rel="stylesheet" type="text/css"/>
        <style>
            .box{text-align: center;width:250px;display: inline-block; background:#ddd;}
            .box>a{text-decoration: none;color: black;background: lightgreen;padding: 15px 35px;border: 1px solid gray;border-radius: 5px;}
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
        <!--<h2 style="text-align:center;color: #2E3949;"><a href='index.jsp'> Admin Home</a></h2>-->
        <h2 style="text-align:center;color: #2E3949;">Users</h2>
        <div style="width: fit-content;margin: auto;">
            <a style="text-align: center;display: block;padding: 10px;" href="add_user.jsp">Add User</a>
        </div>

        <br><br>                        
        <div  style="color: #2E3949;max-width:fit-content;margin: auto;">



            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>


                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
                        Statement stm = con.createStatement();

                        String s = "SELECT * FROM `users`";
                        ResultSet r = stm.executeQuery(s);
                        while (r.next()) {
                            //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
%>

                    <tr>   
                        <td><%=r.getString("id")%></td>
                        <td><%=r.getString("name")%></td>
                        <td><%=r.getString("email")%></td>
                        <td><%=r.getString("password")%></td>
                        <td>

                            <form class="del" action="del_user.jsp" method="POST">
                                <input type="hidden" name="uid" value="<%=r.getString("id")%>" />
                                <input type="submit" value="Delete" />
                            </form>

                        </td>
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