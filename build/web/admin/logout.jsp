<%
session.setAttribute("admin_email",null);
session.setAttribute("admin_name", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>