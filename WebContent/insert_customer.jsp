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
	String o_number = request.getParameter("order_number");
	String o_month = request.getParameter("order_month");
	String o_year = request.getParameter("order_year");
	String cname = request.getParameter("cname");
	String serial_number = request.getParameter("serial_no");


	/*
	* If the user hasn't filled out all the fields. This is very
	* simple checking
	*/
	if (o_number.equals("") || o_month.equals("")|| o_year.equals("")|| cname.equals("")|| serial_number.equals("")) {
		response.sendRedirect("insert_customer_form.jsp");
	} else {
		int ord_number = Integer.parseInt(o_number);
		int ord_month = Integer.parseInt(o_month);
		int ord_year = Integer.parseInt(o_year);
		int serial_no = Integer.parseInt(serial_number);

		// Now perform the query with the data from the form.
		boolean success = handler.insertCustomer(ord_number, ord_month, ord_year, cname, serial_no);
		if (!success) {
	%>
	<h2>There was a problem inserting the Customer</h2>
	<%
		} else {
	%>
	<h2>The Customer:</h2>
	<ol>
		<li>Customer name: <%=cname%></li>
		<li>Order Number: <%=o_number%></li>
		<li>Order Date: <%=o_month%>-<%=o_year%></li>
		<li>Serial Number: <%=serial_number%></li>

	</ol>
	<h2>Was successfully inserted.</h2>
	<%
		}
	}
	%>
</body>
</html>
