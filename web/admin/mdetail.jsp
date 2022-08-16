<%@page import="java.util.regex.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String db = "movie_rs";
    String err, mid;
    mid = request.getParameter("mid");
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
        <div>
            <!--            <h1 style="text-align: center;">Welcome -- <b>
            <%
                if (session.getAttribute("user_email") != null) {
                    out.print("" + session.getAttribute("user_name"));
                } else {
                    out.print("Guest");
                }
            %>
        </b></h1>-->
            <h4 style="margin: 0;text-align:center;color: chocolate;"><%=err%></h4>
            <!--        <h2 style="margin: 0;text-align:center;color: #2E3949;">Online Movie Recommendation</h2>
                    <div style="width: fit-content;margin: auto;">
                        <a style="text-align: center;display: block;padding: 10px;" href="view_request.jsp">View Your Application</a>-->
        </div>


        <div style="width: 100%;max-width: 750px;margin: auto;display: table;">    
            <div id="mainCont" style="color: #2E3949;width:100%;margin: auto; text-align: center; float: left;">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "root");
                    Statement stm = con.createStatement();

                    String s = "SELECT * FROM `movies` WHERE `id`=" + mid + " ORDER BY `id` DESC";
                    ResultSet r = stm.executeQuery(s);
                    while (r.next()) {
                        
                            String nwytv;
                            String ytv = r.getString("video");
                            nwytv = ytv.replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/");
                        
                        
                        //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
                %>
                <div class="d_box_cont" style="    border-radius: 5px;background-color: rgba(242, 242, 242, 0.5);padding: 20px;" >
                    <div style="text-align:left;">


                        <span><b><img src="mimg.jsp?id=<%=r.getString("id")%>" style="width:100%" /></b></span>
                        <h2 style="color: chocolate;"><b><%=r.getString("name")%></b></h2>



                        <span><b>Description</b></span>
                        <p><%=r.getString("detail")%></p>

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
                            
                            String rating = "<b>"+String.format("%.1f", (totalrate/count))+"</b> / 5";
//                            out.println(totalrate/count);
                            rrate.close();
                           %>
                        
                        <span><b>Rating - </b> <%=rating%></span>
                        <p></p>
                        <br><br>
                        <iframe style="width:100%;height: 315px;" src="<%=nwytv%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        <br><br><br>


                        <%
                            }
                            r.close();
                        %>

                        <div>
                            <h2 style="margin: 0;"><b>Comments</b></h2>


                            <%
                                if (session.getAttribute("user_email") == null) {
                            %>
                            <!--To Comment please <a href="login.jsp">Login Here ...</a>-->
                            <p></p>
                            <%
                            } else {
                            %>
    <!--                        <span><%=session.getAttribute("user_name")%></span>-->
                            <%
                                }
                            %>



                <%
                    Statement cmtx = con.createStatement();
                    String cmts = "SELECT * FROM `cmts` WHERE `mid`='"+mid+"' ORDER BY `id` DESC";
                    ResultSet cmtr = cmtx.executeQuery(cmts);
                    while (cmtr.next()) {
                        
                        String muid = cmtr.getString("uid");
                        
                        Statement cmtnx = con.createStatement();
                    String cmtns = "SELECT * FROM `users` WHERE `id`='"+muid+"'";
                    ResultSet cmtnr = cmtnx.executeQuery(cmtns);
                    
                        
                        
                        //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
                %>
                            
                            
                            <div style="margin-bottom:20px;">
                                <div><b>
                                        <%
                                        while (cmtnr.next()) {
                        String unmes = cmtnr.getString("name");
                                        %>
                                        
                                        <%=unmes%>
                                    <%
                            }
                            cmtnr.close();
                        %>
                                    
                                    </b></div>
                                <div><%=cmtr.getString("cmt")%></div>
                            </div>
                <%
                            }
                            cmtr.close();
                        %>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </body>
</html>
