<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    String db = "movie_rs";
    String uid = request.getParameter("uid");
    
    try {
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection ncon = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
        String UpdateNQ = "DELETE FROM `users` WHERE `id`='"+uid+"'";
        Statement nstt;
        nstt = ncon.createStatement();
        nstt.executeUpdate(UpdateNQ);
    response.sendRedirect("user_detail.jsp"); 
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    %>