<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query 10 result</title>
</head>
<body>
	<%@page import="Jsp_HW2.DataHandler"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Array"%>
	<%
		// The handler is the one in charge of establishing theconnection.
		DataHandler handler = new DataHandler();
	// Get the parameters from the form.
	String year = request.getParameter("year");

		ResultSet customer =  handler.findQuery8(Integer.parseInt(year));
	
	%>
	<table cellspacing="2" cellpadding="2" border="1">
		<h2>Data deleted.</h2>
		<%

			while (customer.next()) {
			int pr = customer.getInt("year");



		}
		%>
	</table>
</body>
</html>
