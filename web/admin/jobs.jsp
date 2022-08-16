<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String db = "movie_rs";
if(session.getAttribute("admin_email") == null){
//    String err = "Please Login First";
    response.sendRedirect("login.jsp");
    }

//    out.println(request.getAttribute("Message"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
    Statement stm = con.createStatement();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
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
                        <!--<h2 style="text-align:center;color: #2E3949;"><a href='index.jsp'> Admin Home</a></h2>-->
                        <h2 style="text-align:center;color: #2E3949;">Movies Specifications </h2>
                        <div style="width: fit-content;margin: auto;">
                            <a style="text-align: center;width: fit-content;padding: 10px;" href="add_jobs.jsp">Add Movies</a>
                        </div>
         
                        <br><br>
                        
                        
                        <div  style="color: #2E3949;max-width:fit-content;margin: auto; text-align: center;">
                            
                             <%
            String s = "SELECT * FROM `movies` ORDER BY `id` DESC";
            ResultSet r = stm.executeQuery(s);
            while ( r.next() ){ 
                
                String descrption = r.getString("detail");
                        String detail = descrption.substring(0, Math.min(descrption.length(), 25));
                
           //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
             %>
                            
             <div class="d_box_cont" style="cursor:pointer;"  onclick="window.location.href = 'mdetail.jsp?mid=<%=r.getString("id")%>'">
                                <div class="detailbox">
                                    
                                    <span><b><img src="mimg.jsp?id=<%=r.getString("id")%>" alt="" width="200" height="290" /></b></span>
                                    <h2><b><%=r.getString ("name")%></b></h2>
                                    
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

                            String rating = "<b>"+String.format("%.1f", (totalrate/count))+"</b> / 5";
//                            out.println(totalrate/count);
                            rrate.close();

                        %>
                        <p><%=rating%></p>
                                   
                                    <span><b>Description</b></span>
                                    <p><%=detail+" ..."%></p>
                                    
                                    <form class="xform" action="del_job.jsp" method="POST">
                                        <input type="hidden" name="did" value="<%=r.getString ("id")%>" />
                                        <input type="submit" value="Delete" />
                                    </form>
                                </div>
                            </div>
                 
                 
                          <% 
             }
              r.close();

         %>
         
</div>
    </body>
</html>