<%@ page import ="java.sql.*" %>
<%@page import="java.util.*" %>
<%  String db = "movie_rs";
    String err_msg = "";
    String rate;
    String uid = request.getParameter("uid");
    String cmt = request.getParameter("cmt");
    String mid = request.getParameter("mid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
    Statement stt = con.createStatement();
    
    String Str = cmt;
    
    if (Str.matches("(.*)poor(.*)") || Str.matches("(.*)Poor(.*)")) {
        rate = "1";
    } else if (Str.matches("(.*)nice(.*)") || Str.matches("(.*)Nice(.*)")){
        rate = "2";
    } else if (Str.matches("(.*)very good(.*)") || Str.matches("(.*)Very Good(.*)")){
        rate = "4";
    } else if (Str.matches("(.*)good(.*)") || Str.matches("(.*)Good(.*)")){
        rate = "3";
    } else if (Str.matches("(.*)Excellent(.*)") || Str.matches("(.*)excellent(.*)") ){
        rate = "5";
    } else{
        rate = "3";
    }
    
    try{
if((cmt != null && cmt != "") && (uid != null && uid != "") && (mid != null && mid != "")){

    int i = stt.executeUpdate("INSERT INTO `cmts`(`uid`, `mid`, `cmt`, `rate`) VALUES ('"+uid+"','"+mid+"','"+cmt+"','"+rate+"')");
    if (i > 0) {
        String err = "Comment Submitted";
    response.sendRedirect("mdetail.jsp?mid="+mid+"&err="+err);
    } else {
        out.println("Error while register");
    }
    
}else{
        String err = "Should not be blank";
    response.sendRedirect("mdetail.jsp?mid="+mid+"&err="+err);
    
}}catch(NullPointerException ex){
    ex.printStackTrace();
}
    
%>