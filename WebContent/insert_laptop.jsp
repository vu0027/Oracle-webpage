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
	String serial_no = request.getParameter("l_serial_no");
	String speed = request.getParameter("l_speed");
	String price = request.getParameter("l_price");
	String memory = request.getParameter("l_memory");
	String []software = request.getParameter("l_software").split(",");
	String mname = request.getParameter("l_mname");
	String weight = request.getParameter("l_weight");

	/*
	* If the user hasn't filled out all the fields. This is very
	* simple checking
	*/
	if (serial_no.equals("") || price.equals("")|| memory.equals("")|| weight.equals("")|| speed.equals("") || mname.equals("")) {
		response.sendRedirect("insert_laptop_form.jsp");
	} else {
		int s_no = Integer.parseInt(serial_no);
		int spd = Integer.parseInt(speed);
		int prce = Integer.parseInt(price);
		int memo = Integer.parseInt(memory);
		int wei = Integer.parseInt(weight);

		// Now perform the query with the data from the form.
		boolean success = handler.insertLaptop(s_no, spd, prce, memo, software, mname, wei);
		if (!success) {
	%>
	<h2>There was a problem inserting the Laptop Information</h2>
	<%
		} else {
	%>
	<h2>The Computer:</h2>
	<ol>
		<li>Serial Number: <%=serial_no%></li>
		<li>Speed: <%=speed%></li>
		<li>Price: <%=price%></li>
		<li>Memory: <%=memory%></li>
		<li>Microchip Manufacture: <%=mname%></li>
		<li>Weight: <%=weight%></li>
	</ol>
	<h2>Was successfully inserted.</h2>
	<%
		}
	}
	%>
</body>
</html>
