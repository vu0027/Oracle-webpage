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
	String mname = request.getParameter("m_name");
	String maddress = request.getParameter("m_address");
	/*
	* If the user hasn't filled out all the fields. This is very
	* simple checking
	*/
	if (mname.equals("") || maddress.equals("")) {
		response.sendRedirect("insert_microchip_form.jsp");
	} else {

		// Now perform the query with the data from the form.
		boolean success = handler.insertManufacturer(mname, maddress);
		if (!success) {
	%>
	<h2>There was a problem inserting the Manufacturer</h2>
	<%
		} else {
	%>
	<h2>The Microchip Manufacturer:</h2>
	<ol>
		<li>Manufacturer Name: <%=mname%></li>
		<li>Address: <%=maddress%></li>
	</ol>
	<h2>Was successfully inserted.</h2>
	<%
		}
	}
	%>
</body>
</html>
