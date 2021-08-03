<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Laptop Order</title>
</head>
<body>
	<input type="button" value="back" onclick="history.back()"/> 
	<h2>Find Laptop Order</h2>
	<form action="query5.jsp">
		<table border=1>
			<tr>
				<td>Customer Name:</td>
				<td><div style="text-align: center;">
						<input type=text name=cname>
					</div></td>
			</tr>
			<tr>
				<td>Order Year:</td>
				<td><div style="text-align: center;">
						<input type=text name=order_year>
					</div></td>
			</tr>
			
			<tr>
				<td><div style="text-align: center;">
						<input type=reset value=Clear>
					</div></td>
				<td><div style="text-align: center;">
						<input type=submit value=Find>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
