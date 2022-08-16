<%@page import="java.sql.*"%>
<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String db = "movie_rs";
//    if (session.getAttribute("user_email") == null) {
//        String err = "Please Login First";
//        response.sendRedirect("login.jsp?err=" + err);
//    }

    String err;
    err = request.getParameter("a");

    if (err == null) {
        err = "";
    }
    if (err.equalsIgnoreCase("done")) {
        err = "Request Successfully Submitted !!!";
    }
    if (err.equalsIgnoreCase("exist")) {
        err = "Request Already Submitted !!!";
    }
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


                    <div class="refbox" >

                        <a href="index.jsp">Home</a>
                        <a href="predict.jsp">Movies For You</a>
                        <a href="contact.jsp">Contact Us</a>

                        <%
                            if (session.getAttribute("user_email") == null) {
                        %>
                        <a href="login.jsp">Login</a>
                        <%
                        } else {
                        %>

                        <span><%=session.getAttribute("user_name")%></span>
                        <a href="logout.jsp">Logout</a>

                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>

        <div>
            <h1 style="text-align: center;">Movies Recommended For You -- <b><%   if (session.getAttribute("user_email") != null) {
                    out.print("" + session.getAttribute("user_name"));
                } else {
                    out.print("Guest");
                }%></b></h1>
            <h4 style="margin: 0;text-align:center;color: chocolate;"><%=err%></h4>
            <!--        <h2 style="margin: 0;text-align:center;color: #2E3949;">Online Movie Recommendation</h2>
                    <div style="width: fit-content;margin: auto;">
                        <a style="text-align: center;display: block;padding: 10px;" href="view_request.jsp">View Your Application</a>-->
        </div>
        <div  style="color: #2E3949;max-width:fit-content;margin: auto; text-align: center;">

            <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
                    Statement stm = con.createStatement();

                    String s = "SELECT * FROM `movies` ORDER BY rand()";
                    ResultSet r = stm.executeQuery(s);
                    while (r.next()) {
                        String descrption = r.getString("detail");
                        String detail = descrption.substring(0, Math.min(descrption.length(), 25));
                %>
                <div style="cursor:pointer;" class="d_box_cont" onclick="window.location.href = 'mdetail.jsp?mid=<%=r.getString("id")%>'">
                    <div class="detailbox">

                        <span><b><img src="mimg.jsp?id=<%=r.getString("id")%>" alt="" width="200" height="290" /></b></span>
                        <h2><b><%=r.getString("name")%></b></h2>

                        <span><b>Rating</b></span>

                        <%
                            Statement stmrate = con.createStatement();
                            Statement stmcnt = con.createStatement();

                            String scnt = "SELECT count(*) as total FROM `cmts` WHERE `mid`='" + r.getString("id") + "'";
                            String srate = "SELECT * FROM `cmts` WHERE `mid`='" + r.getString("id") + "'";
                            ResultSet rcnt = stmcnt.executeQuery(scnt);
                            ResultSet rrate = stmrate.executeQuery(srate);
                            int count = 0;
                            while (rcnt.next()) {
                                count = Integer.parseInt(rcnt.getString("total"));
                            }
                            rcnt.close();

                            float totalrate = 0;
                            while (rrate.next()) {
                                totalrate += Integer.parseInt(rrate.getString("rate"));


                        %>

                        <!--<p><%=rrate.getString("rate")%></p>-->

                        <%
                            }

                            String rating = "<b>" + String.format("%.1f", (totalrate / count)) + "</b> / 5";
//                            out.println(totalrate/count);
                            rrate.close();

                        %>
                        <p><%=rating%></p>
                        <span><b>Description</b></span>
                        <p><%=detail + " ..."%></p>
                    </div>
                </div>

                <%
                    }
                    r.close();
                %>

        </div>
    </body>
</html>
