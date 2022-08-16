<%@ page import ="java.sql.*" %>
<%@page import ="java.util.*" %>
<%
    String err_msg = "",err;
    String web = request.getParameter("web");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_rs","root", "root");
    Statement st = con.createStatement();
    
    try{
        if((web != null && web != "")){
        int i = st.executeUpdate("INSERT INTO `srch` (`user_name`, `user_email`, `web_addr`) VALUES ('"+session.getAttribute("user_name")+"','"+session.getAttribute("user_email")+"','"+web+"')");
            if (i > 0) {
                session.setAttribute("web", web);
                response.sendRedirect("view_port.jsp");
            }else {err = "Error! Could not updated!!! ";response.sendRedirect("index.jsp?err="+err);}    
        }else{err = "Please fill every field";response.sendRedirect("index.jsp?err="+err);}
    }catch(NullPointerException ex){
    ex.printStackTrace();
}
    
%>