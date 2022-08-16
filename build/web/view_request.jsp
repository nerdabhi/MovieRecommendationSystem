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
                    <div class="refbox">
                        <span><%=session.getAttribute("user_name")%></span>
                        <a href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>


        <h1 style="text-align: center;">Welcome -- <b><%   if (session.getAttribute("user_email") != null) {
                out.print("" + session.getAttribute("user_name"));
            } else {
                out.print("Guest");
            }%></b></h1>
        <h4 style="margin: 0;text-align:center;color: chocolate;"><%=err%></h4>
        <h2 style="text-align:center;color: #2E3949;">Your Application Details</h2>
        <p style="text-align:center;"><b>Note: </b>After Selection Appointment time will be Between 10am to 4pm, 2 days after the date of application.</p>
        <div  style="color: #2E3949;max-width:fit-content;margin: auto; text-align: center;">
            <table>
             <thead>
                 <tr>
                     <th>Job ID</th>
                     <th>Job Name</th>
                     <th>Application Date</th>
                     <!--<th>Appointment Date</th>-->
                     <th>Status</th>
                 </tr>
             </thead>
             <tbody>
                 
                 
                  <%
    String user_email = ""+session.getAttribute("user_email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs","root", "root");
    Statement stm = con.createStatement();

            String s = "SELECT * FROM `job_request` WHERE `user_email`='"+user_email+"' ORDER BY `id` DESC";
            ResultSet r = stm.executeQuery(s);
            while ( r.next() )
             { 
           //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
             %>
             
             <tr>   
                     <td><%=r.getString ("job_id")%></td>
                     <td><%=r.getString ("job_name")%></td>
                     <td><%=r.getString ("date")%></td>
                     <!--<td><%=r.getString ("appoint_date")%></td>-->
                     <%
                     String sts="";
                     String cls="";
                     if(r.getString ("status").equalsIgnoreCase("0")){ sts = "Requested !!!";cls="orange";}
                     else if(r.getString ("status").equalsIgnoreCase("1")){ sts = "Approved !!!";cls="green";}
                     else if(r.getString ("status").equalsIgnoreCase("2")){ sts = "Rejected !!!";cls="red";}
                     %>
                     <td class=" <%=cls%>"><%=sts%></td>
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