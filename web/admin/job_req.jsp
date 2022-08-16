<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
if(session.getAttribute("admin_email") == null){
//    String err = "Please Login First";
    response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Recommendation System</title>
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
                        <h2 style="text-align:center;color: #2E3949;">Job Requests</h2>
                        
                        <br><br>                        
                        <div  style="color: #2E3949;max-width:fit-content;margin: auto;">
                        
         <table>
             <thead>
                 <tr>
                     <th>Job ID</th>
                     <th>Job Name</th>
                     <th>User Name</th>
                     <th>User Email</th>
                     <th>Application Date</th>
                     <!--<th>Appointment Date</th>-->
                     <th>Status</th>
                     <th>Action</th>
                 </tr>
             </thead>
             <tbody>
                 
                 
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs","root", "root");
            Statement stm = con.createStatement();
            String s = "SELECT * FROM `job_request` ORDER BY `id` DESC";
            ResultSet r = stm.executeQuery(s);
            while ( r.next() )
             { 
           //      out.print("<span id=" +  r.getString ("id") + " class='schoolName'>" +  r.getString ("name") + "</span>");
             %>
             
             <tr>   
                     <td><%=r.getString ("job_id")%></td>
                     <td><%=r.getString ("job_name")%></td>
                     <td><%=r.getString ("user_name")%></td>
                     <td><%=r.getString ("user_email")%></td>
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
                     <td>
                         <form class="form_action_btn" action="job_action.jsp" method="POST">
                             <input type="hidden" name="sts_id" value="<%=r.getString ("id")%>"/>
                             <input type="hidden" name="action" value="approve" />
                             <input class="green" type="submit" value="&#10004;" />
                         </form>
                         <form class="form_action_btn" action="job_action.jsp" method="POST">
                             <input type="hidden" name="sts_id" value="<%=r.getString ("id")%>" />
                             <input type="hidden" name="action" value="reject" />
                             <input class="red" type="submit" value="&chi;" />
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