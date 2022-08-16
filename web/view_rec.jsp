<%@page import="java.sql.*"%>
<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String db = "movie_rs";
    
    if (session.getAttribute("user_email") == null) {
        String err = "Please Login First";
        response.sendRedirect("login.jsp?err=" + err);
    }

    String err;
    err = request.getParameter("err");
    if (err == null) {err = "";}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Recommendation System</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div id="nav">
            <div> 
                <div id="websitename"><h1><a href="index.jsp">Movie Recommendation System</a></h1></div>
                <div id="navRef">
                    <div class="refbox">
                        <span><%=session.getAttribute("user_name")%></span>
                        <a href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>


        <h1 style="text-align: center;">Welcome -- <b><%=session.getAttribute("user_name")%></b></h1>
        <div style="margin: auto;max-width: 600px;padding: 50px 0;">
            <div style="margin: 0px 0 0 0;text-align: center;">
                <h2>All Recent Search</h2>

                <table style="min-width: 300px; width: 350px;margin: auto;">
                    <thead>
                        <tr>
                            <th style="text-align: center;">Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "root");
                            Statement stm = con.createStatement();

                            String s = "SELECT * FROM `srch` WHERE `user_email`='"+session.getAttribute("user_email")+"' ORDER BY `id` DESC";
                            ResultSet r = stm.executeQuery(s);
                            while (r.next()) {
%>

                        <tr>
                            <td style="text-align: center;"><%=r.getString("web_addr")%></td>
                        </tr>

                        <%
                            }
                            r.close();

                        %>

                    </tbody>
                </table>
                
            </div>
        </div>
    </body>
</html>
