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

	String username = request.getParameter("user_id");
	String password = request.getParameter("pass_word");
	
	/*
	* If the user hasn't filled out all the fields. This is very
	* simple checking
	*/
	
	if (username.equals("") || password.equals("")) {
		response.sendRedirect("login_form.jsp");
	} 
	else {
		
		// Now perform the query with the data from the form.
		

		// Now perform the query with the data from the form.
		// check for right Oracle login
		if (username.equals("vu0027") && password.equals("KQls9Uw8")) {
			response.sendRedirect("menu_form.jsp");
		}
		else {
			%>
			<h2>There was a problem inserting the UUUU</h2>
			<%
		}
		
		
		
		 
		
	
	}
	%>
</body>
</html>
