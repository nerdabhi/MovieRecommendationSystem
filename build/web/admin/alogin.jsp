<%@ page import ="java.sql.*" %>
<%  
      
    String db = "movie_rs";
    String email = request.getParameter("aemail"); 
    String pass = request.getParameter("apass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT * FROM `admin` WHERE `email`='"+email+"' AND `pass`='"+pass+"'");
    if (rs.next()) {
        //out.println("ok");
        session.setAttribute("admin_email", email);
        String a_name = rs.getString ("name");
        session.setAttribute("admin_name", a_name);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.jsp");
    } else {
        String err = "Invalid Email/Password";
    response.sendRedirect("login.jsp?err="+err);
    
        //out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>