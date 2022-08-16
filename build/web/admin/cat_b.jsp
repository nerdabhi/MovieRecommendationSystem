<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    String db = "movie_rs";
    String cate;
    cate = request.getParameter("cate");

    if (cate != null && cate != "") {
        String UpdateNQ = "INSERT INTO `movie_categories`(`category`) VALUES ('" + cate + "')";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, "root", "root");
        Statement st = con.createStatement();
        //ResultSet rs;
        int i = st.executeUpdate(UpdateNQ);
        if (i > 0) {
            //session.setAttribute("userid", user);

//        out.print("Process Successfull!"+"<a href='category.jsp'>Go to Home</a>");
            response.sendRedirect("category.jsp?err=could not submitted ...");
        } else {
            response.sendRedirect("add_cate.jsp?err=could not submitted ...");
        }
    } else {
        response.sendRedirect("add_cate.jsp?err=Please Enter Category ...");
    }


%>