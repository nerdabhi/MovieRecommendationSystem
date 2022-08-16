<%
session.setAttribute("user_email",null);
session.setAttribute("user_name", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>