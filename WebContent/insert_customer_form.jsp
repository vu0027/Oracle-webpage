<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert New Customer</title>
</head>
<body>
	<input type="button" value="back" onclick="history.back()"/> 
	<h2>Insert New Customer Information</h2>
	<form action="insert_customer.jsp">
		<table border=1>
			<tr>
				<td>Order Number:</td>
				<td><div style="text-align: center;">
						<input type=text name=order_number>
					</div></td>
			</tr>
			<tr>
				<td>Order Month:</td>
				<td><div style="text-align: center;">
						<input type=text name=order_month>
					</div></td>
			</tr>
			<tr>
				<td>Order Year:</td>
				<td><div style="text-align: center;">
						<input type=text name=order_year>
					</div></td>
			</tr>
			<tr>
				<td>Customer Name:</td>
				<td><div style="text-align: center;">
						<input type=text name=cname>
					</div></td>
			</tr>
			<tr>
				<td>Serial Number:</td>
				<td><div style="text-align: center;">
						<input type=text name=serial_no>
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
