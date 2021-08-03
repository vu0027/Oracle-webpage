<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query 7 result</title>
</head>
<body>
	<%@page import="Jsp_HW2.DataHandler"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Array"%>
	<%
		// The handler is the one in charge of establishing theconnection.
		DataHandler handler = new DataHandler();
	// Get the parameters from the form.
	String software = request.getParameter("software");
	ResultSet customer = handler.findQuery7(software);
	%>
	<table cellspacing="2" cellpadding="2" border="1">
		<tr>
			<td align="center">
				<h4>Customer Name: </h4>
			</td>


		</tr>
		<%
			while (customer.next()) {
			String cname = customer.getString("cname");
		


			// Print each attribute
			out.println("<tr>");
			out.println("<td align=\"center\">" + cname);
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>
