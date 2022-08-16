<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%  String db = "movie_rs";
    String email,pass;
    email = request.getParameter("lemail"); 
    pass = request.getParameter("lpass");
    try {
    if((email != null) && (email != "") && (pass != null) && (pass !="")){
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT * FROM `users` WHERE `email`='"+email+"' AND `password`='"+pass+"'");
    if (rs.next()) {
        //out.println("ok");
        String uid = rs.getString ("id");
        session.setAttribute("uid", uid);
        session.setAttribute("user_email", email);
        String u_name = rs.getString ("name");
        session.setAttribute("user_name", u_name);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.jsp");
    } else {
        String err = "Invalid Email/Password";
    response.sendRedirect("login.jsp?err="+err);
    }
    
    
    
}else{String err = "Please fill the input box";
    response.sendRedirect("login.jsp?err="+err);}
}catch (NullPointerException ex){
    ex.printStackTrace();
}
%>