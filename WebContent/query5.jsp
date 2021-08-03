<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query result</title>
</head>
<body>
	<%@page import="Jsp_HW2.DataHandler"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Array"%>
	<%
		// The handler is the one in charge of establishing theconnection.
		DataHandler handler = new DataHandler();
	// Get the parameters from the form.
	String cu_name = request.getParameter("cname");
	String o_year = request.getParameter("order_year");

	ResultSet customer =  handler.findQuery5(Integer.parseInt(o_year), cu_name);

%>
	<table cellspacing="2" cellpadding="2" border="1">
		<tr>
			<td align="center">
				<h4>Serial Number:</h4>
			</td>
			<td align="center">
				<h4>Speed:</h4>
			</td>
			<td align="center">
				<h4>Price:</h4>
			</td>
			<td align="center">
				<h4>Memory:</h4>
			</td>
			<td align="center">
				<h4>Weight:</h4>
			</td>

		</tr>
		<%
			while (customer.next()) {
			int sn = customer.getInt("serial_no");
			int sp = customer.getInt("speed");
			int pr = customer.getInt("price");
			int memo = customer.getInt("memory");
			int weight = customer.getInt("weight");

		}
		%>
	</table>
</body>
</html>
