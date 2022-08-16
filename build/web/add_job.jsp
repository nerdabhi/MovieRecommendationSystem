<%@ page import ="java.sql.*" %>
<%  String db = "movie_rs";
    String err_msg = "";
    
        if (session.getAttribute("user_email") == null) {
        String err = "Please Login First";
        response.sendRedirect("login.jsp?err=" + err);
    }else{
    
    String jid = request.getParameter("jid"); 
    String jname = request.getParameter("jname");
    String user_name = ""+session.getAttribute("user_name");
    String user_email = ""+session.getAttribute("user_email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
    Statement st = con.createStatement();
    Statement stt = con.createStatement();
    ResultSet rs;
    try{
    
    rs = st.executeQuery("SELECT * FROM `job_request` WHERE `job_id`='"+jid+"' AND `user_email`='"+user_email+"'");
    if (rs.next()) {
    response.sendRedirect("index.jsp?a=exist");
    } else {
        
    int i = stt.executeUpdate("INSERT INTO `job_request`(`job_id`, `job_name`, `user_name`, `user_email`, `appoint_date`, `status`) VALUES ('"+jid+"','"+jname+"','"+user_name+"','"+user_email+"', '--' , '0')");
    if (i > 0) {
        
    response.sendRedirect("index.jsp?a=done");
    } else {
        out.println("Error while register");
    }
    }
    
}catch(NullPointerException ex){
    ex.printStackTrace();
}}
%>