<%@page import="java.sql.*,java.util.*"%>
<%

String n_sts = null,sts_id;
String action = request.getParameter("action");
sts_id = request.getParameter("sts_id");
if(action.equalsIgnoreCase("approve")){n_sts = "1";}
if(action.equalsIgnoreCase("reject")){n_sts = "2";}

if( action != null ){

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("UPDATE `job_request` SET `status`='"+ n_sts +"' WHERE `id`='" + sts_id + "'");
String redirectURL = "job_req.jsp";
response.sendRedirect(redirectURL);
}
else{
    out.print("There is an error while adding Doctor");
}


%>
