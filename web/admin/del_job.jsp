<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    String db = "movie_rs";
    String did = request.getParameter("did");
    
    try {
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection ncon = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
        String UpdateNQ = "DELETE FROM `movies` WHERE `id`='"+did+"'";
        Statement nstt;
        nstt = ncon.createStatement();
        nstt.executeUpdate(UpdateNQ);
    response.sendRedirect("jobs.jsp"); 
    } catch (Exception e) {
        e.printStackTrace();
    }
    
%>