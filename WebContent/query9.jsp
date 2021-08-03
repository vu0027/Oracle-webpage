<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query 9 result</title>
</head>
<body>
	<%@page import="Jsp_HW2.DataHandler"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Array"%>
	<%
		// The handler is the one in charge of establishing theconnection.
		DataHandler handler = new DataHandler();
	// Get the parameters from the form.
	String se_no = request.getParameter("serial_no");
		ResultSet customer =  handler.findQuery9(Integer.parseInt(se_no));
	
	%>
	<table cellspacing="2" cellpadding="2" border="1">
		<tr>
			<td align="center">
				<h4>Serial Number:</h4>
			</td>
			<td align="center">
				<h4>Software(OS):</h4>
			</td>


		</tr>
		<%

			while (customer.next()) {
			int sn = customer.getInt("sn");
			Object t = customer.getObject(2);


			// Print each attribute
		
			out.println("<td align=\"center\">" + String.valueOf(sn) + "<td align=\"center\">" + String.valueOf(t));
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>
