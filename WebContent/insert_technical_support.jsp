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
	String cname = request.getParameter("cname");
	String cstreet = request.getParameter("cstreet");
	String ccity = request.getParameter("ccity");
	String cstate = request.getParameter("cstate");
	String czipcode = request.getParameter("czipcode");
	String serial_no = request.getParameter("serial_no");
	String tech_sup = request.getParameter("tech_support");


	/*
	* If the user hasn't filled out all the fields. This is very
	* simple checking
	*/
	if (cname.equals("") || cstreet.equals("")||ccity.equals("")||czipcode.equals("")||cstate.equals("")|| serial_no.equals("")||  tech_sup.equals("")) {
		response.sendRedirect("insert_tech_support_form.jsp");
	} else {
		int se_no = Integer.parseInt(serial_no);
		int zip = Integer.parseInt(czipcode);
		
		// Now perform the query with the data from the form.
		boolean success = handler.insertTechSupport(cname, cstreet, ccity,cstate, zip, se_no, tech_sup);
		if (!success) {
	%>
	<h2>There was a problem inserting the Support Note</h2>
	<%
		} else {
	%>
	<h2>The Customer:</h2>
	<ol>
		<li>Customer name: <%=cname%></li>
		<li>Customer Address: <%=cstreet%> <%=ccity%> <%=cstate%> <%=czipcode%></li>
		<li>Serial Number: <%=serial_no%></li>
		<li>Technical Support: <%=tech_sup%></li>

	</ol>
	<h2>Was successfully inserted.</h2>
	<%
		}
	}
	%>
</body>
</html>
