<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query 6 result</title>
</head>
<body>
	<%@page import="Jsp_HW2.DataHandler"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Array"%>
	<%
		// The handler is the one in charge of establishing theconnection.
		DataHandler handler = new DataHandler();
	// Get the parameters from the form.
	String m_name = request.getParameter("mname");
	ResultSet customer = handler.findQuery6(m_name);
	%>
	<table cellspacing="2" cellpadding="2" border="1">
		<tr>
			<td align="center">
				<h4>Customer Name: </h4>
			</td>
			<td align="center">
				<h4>Support Note: </h4>
			</td>
			<td align="center">
				<h4>Manufacture: </h4>
			</td>

		</tr>
		<%
			while (customer.next()) {
			String cname = customer.getString("Cname");
			String s_note = customer.getString("Support");
			String mname = customer.getString("Mname");

			// Print each attribute
			out.println("<tr>");
			out.println("<td align=\"center\">" + cname 
			+ "</td><td align=\"center\"> " + s_note + "</td><td align=\"center\"> " + mname);
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>
