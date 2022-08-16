<%@ page import ="java.sql.*" %>
<%  String db = "movie_rs";
    String err_msg = "";
    String name = request.getParameter("rname");    
    String email = request.getParameter("remail");
    String rmob = request.getParameter("rmob");
    String pass = request.getParameter("rpass");
    String repass = request.getParameter("re_rpass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
    Statement st = con.createStatement();
    Statement stt = con.createStatement();
    ResultSet rs;
    try{
if((name != null && name != "") && (email != null && email != "") && (pass != null && pass != "") && (repass!= null && repass != "")){

    rs = st.executeQuery("SELECT * FROM `users` WHERE `email`='" +email+"'");
    if (rs.next()) {
        String err = "Already Reigistered !!! ";
    response.sendRedirect("reg.jsp?err="+err);
    } else {
    
    if(pass.equalsIgnoreCase(repass)){
    int i = stt.executeUpdate("INSERT INTO `users`(`name`, `email`, `password`,`mobile_number`) VALUES ('"+name+"','"+email+"','"+pass+"','"+ rmob +"')");
    if (i > 0) {
        String err = "Sucessfully Registered ...";
    response.sendRedirect("login.jsp?err="+err);
    } else {
        out.println("Error while register");
    }
}else{
        String err = "Password did not matched ";
    response.sendRedirect("reg.jsp?err="+err);
    
    }
    
    }
    
}else{
        String err = "Please fill every field";
    response.sendRedirect("reg.jsp?err="+err);
    
}}catch(NullPointerException ex){
    ex.printStackTrace();
}
    
%>