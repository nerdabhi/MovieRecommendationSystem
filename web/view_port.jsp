<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    
    if(session.getAttribute("user_email") == null){
    String err = "Please Login First";
    response.sendRedirect("login.jsp?err="+err);
}
    if(session.getAttribute("web") == null){
        String err = "You had not searched for web address !";
        response.sendRedirect("index.jsp?err="+err); 
    }
    
    String err = "";
    String err_msg = request.getParameter("err"); 
    if(err_msg == null){
    err = "";}
%><!DOCTYPE html>
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
                        
        <div style="margin: auto;max-width: 600px;padding: 50px 0;text-align: center">
            <h1>Open Ports for -- '<%=session.getAttribute("web")%>'</h1>
            <p style="display: inline;">Open port are: </p>
            <span style="display: inline;">
        <%
        String web = ""+session.getAttribute("web");
        for (int port = 1024; port <= 2024; port++) {
         try {
            Socket socket = new Socket();
            socket.connect(new InetSocketAddress(web, port), 1000);
            socket.close();
    %>
    <%=port%>
    <%
           // System.out.println("Port " + port + " is open");
        } catch (Exception ex) {
            
        }
      }
    %>                    
            </span>      
        </div>
    </body>
</html>
