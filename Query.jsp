<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="java.io.InputStream"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String message=request.getParameter("message_input");
out.write(name+phone+message);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/schoolcab","root","");
	PreparedStatement ps=conn.prepareStatement("insert into enquiry value(?,?,?)");
	ps.setString(1, name);
	ps.setString(2, phone);
	ps.setString(3, message);
	int x=ps.executeUpdate();
	response.sendRedirect("index.html");
}
catch(Exception e)
{
	out.write("Sorry...");
}
%>
</body>
</html>