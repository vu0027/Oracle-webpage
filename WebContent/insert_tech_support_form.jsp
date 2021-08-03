<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Support</title>
</head>
<body>
	<input type="button" value="back" onclick="history.back()"/> 
	<h2>Find a Technical Support Information</h2>
	<form action="insert_technical_support.jsp">
		<table border=1>
			<tr>
				<td>Customer Name:</td>
				<td><div style="text-align: center;">
						<input type=text name=cname>
					</div></td>
			</tr>
			<tr>
				<td>Street:</td>
				<td><div style="text-align: center;">
						<input type=text name=cstreet>
					</div></td>
			</tr>
			<tr>
				<td>City:</td>
				<td><div style="text-align: center;">
						<input type=text name=ccity>
					</div></td>
			</tr>
			<tr>
				<td>State:</td>
				<td><div style="text-align: center;">
						<input type=text name=cstate>
					</div></td>
			</tr>
			<tr>
				<td>Zipcode:</td>
				<td><div style="text-align: center;">
						<input type=text name=czipcode>
					</div></td>
			</tr>
			<tr>
				<td>Computer Serial Number Purchased:</td>
				<td><div style="text-align: center;">
						<input type=text name=serial_no>
					</div></td>
			</tr>
			<tr>
				<td>Technical Support Note:</td>
				<td><div style="text-align: center;">
						<input type=text name=tech_support>
					</div></td>
			</tr>
			<tr>
				<td><div style="text-align: center;">
						<input type=reset value=Clear>
					</div></td>
				<td><div style="text-align: center;">
						<input type=submit value=Insert>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
