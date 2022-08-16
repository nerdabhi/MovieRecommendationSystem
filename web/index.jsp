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
        <style>
            .slideContainer{max-height: 385px;
                            margin: 5px;
                            background: rgba(255,255,255,.5);
                            display: inline-block;
                            padding: 5px;
                            width: calc(100% - 20px);
                            border-radius: 5px;
            }
            .Slides>img {
                max-height: 400px;
                max-width: 100%;
                height: 100%;
            }
        </style>
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

        
        <div style="width: 100%;max-width: 1280px;margin: auto;display: table;">
            
            <div style="color: #2E3949;width:20%;margin: auto; text-align: left; float: left;">
                <div style="width: calc(100% - 30px);padding: 10px;margin: 5px;display: inline-table;border-radius: 5px;background: rgba(255,255,255,.5);">
                <h2 style="margin-top: 0;">Category</h2>
                <ul class="cat-ul">
                    
                    <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection catcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
                    Statement catstm = catcon.createStatement();

                    String cats = "SELECT * FROM `movie_categories`";
                    ResultSet catr = catstm.executeQuery(cats);
                    while (catr.next()) {
                        //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
                %>
                    <li onclick="window.location.href = 'view_cate.jsp?cid=<%=catr.getString("id")%>'" ><%=catr.getString("category")%></li>

                <%
                    }
                    catr.close();

                %>
                    
                    
                </ul>
                </div>
            </div>
            
            <div style="color: #2E3949;width:55%;margin: auto; text-align: center; float: left;">
                <div class="slideContainer">
                    <div class="Slides fade">
                        <img src="img/s1.jpg" style="width:100%"/>
                    </div>

                    <div class="Slides fade">
                        <img src="img/s3.jpg" style="width:100%">
                    </div>
                    <div class="Slides fade">
                        <img src="img/s2.jpg" style="width:100%">
                    </div>
                    
                    <div class="Slides fade">
                        <img src="img/s3.jpg" style="width:100%">
                    </div>
                </div>




                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
                    Statement stm = con.createStatement();

                    String s = "SELECT * FROM `movies` ORDER BY `id` DESC";
                    ResultSet r = stm.executeQuery(s);
                    if (r.next()) {
                        do {
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
                    } while (r.next());
                } else {
                %>
                <div class="d_box_cont" >
                    <div class="detailbox">
                        <h2 style="margin-top: 0;">No Movies</h2>
                    </div>
                </div>
                <%
                    }
                    r.close();
                %>
                <br/>
                <hr/><a href="admin/login.jsp">Admin Login</a><hr/>
            </div>
                
            <div id="sidebarCont" style="width: 25%;float: left;">
                <div class="" style="width: calc(100% - 10px);margin: 5px;display: inline-table;">
                    <div id="sidebar" style="margin: 10px 0px;">
                        <h2 style="margin-top: 0;">Recommended Movies</h2>
                        <div>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
                                Statement stmm = conn.createStatement();

                                String ss = "SELECT * FROM `movies` ORDER BY rand() LIMIT 3";
                                ResultSet rr = stmm.executeQuery(ss);
                                while (rr.next()) {
                                    String descrption = rr.getString("detail");
                                    String detail = descrption.substring(0, Math.min(descrption.length(), 25));
                            %>

                            <div style="margin-bottom: 10px;cursor: pointer;display: inline-block;width: 100%;" onclick="window.location.href = 'mdetail.jsp?mid=<%=rr.getString("id")%>'">
                                <img style="width:40px;height: 40px;float: left;padding: 5px;" src="mimg.jsp?id=<%=rr.getString("id")%>" alt=""/>
                                <div style="width: calc(100% - 50px);float: left;">
                                    <div style="color: chocolate;"><b><%=rr.getString("name")%></b></div>
                                    <div><%=detail%></div>
                                </div>
                            </div>
    
                            <%
                                }
                                r.close();
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var slideIndex = 0;
            showSlides();

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("Slides");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                slides[slideIndex - 1].style.display = "block";
                setTimeout(showSlides, 2500); // Change image every 2 seconds
            }
        </script>
    </body>
</html>
