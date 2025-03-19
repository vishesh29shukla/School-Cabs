<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
    
    <%
    String email=request.getParameter("loginid");
    String password=request.getParameter("password");
    //out.write(email+password);
    try
    {
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/schoolcab","root","");
    	PreparedStatement ps=conn.prepareStatement("select * from login where email=? and password=?");
    	ps.setString(1, email);
    	ps.setString(2, password);
    	ResultSet rs=ps.executeQuery();
    	int c=0;
    	while(rs.next())
    	{
    		c++;
    	}
    	if(c==1)
    	{
    		//out.write("LOGIN");
    		session.setAttribute("loginid", loginid);
    		response.sendRedirect("Demo.html");
    	}
    	else
    	{
    		//out.write("Wrong Email or Password");
    		response.sendRedirect("login.html");
    	}
    }
    catch(Exception e)
    {
    	out.write("Sorry... Error");
    }
    
    
    
    %>