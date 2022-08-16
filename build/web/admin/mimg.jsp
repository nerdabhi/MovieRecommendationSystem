<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
    String db = "movie_rs";
    String id = request.getParameter("id");
    Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, "root", "root");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM `movies` WHERE `id`='" + id + "'");
        if (rs.next()) {
            image = rs.getBlob("img");
            imgData = image.getBytes(1, (int) image.length());
        } else {
            out.println("Display Blob Example");
            out.println("image not found for given id>");
            return;
        }
// display the image
        response.setContentType("image/jpg");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    }
%>