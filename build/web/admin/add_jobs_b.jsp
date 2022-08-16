<%@ page import ="java.sql.*" %>
<%  String db = "movie_rs";
    String err_msg = "";
    String jname = request.getParameter("jname");    
    String jdetail = request.getParameter("jdetail");
    String quali = request.getParameter("quali");
    String salary = request.getParameter("salary");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "root");
//    Statement st = con.createStatement();
    Statement stt = con.createStatement();
//    ResultSet rs;
    try{
if((jname != null && jname != "") && (jdetail != null && jdetail != "") && (quali != null && quali != "") && (salary!= null && salary != "")){
    int i = stt.executeUpdate("INSERT INTO `jobs`( `job_name`, `job_detail`, `qualification`, `salary`) VALUES ('"+jname+"','"+jdetail+"','"+quali+"','"+salary+"')");
    if (i > 0) {
    response.sendRedirect("jobs.jsp");
    } else {
        out.println("Error while register");
    }
    }
else{
        String err = "Please fill every field";
    response.sendRedirect("add_jobs.jsp?err="+err);
    
}}catch(NullPointerException ex){
    ex.printStackTrace();
}
    
%>