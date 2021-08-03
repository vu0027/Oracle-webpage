<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert New Laptop</title>
</head>
<body>
	<input type="button" value="back" onclick="history.back()"/> 
	<h2>Insert New Desktop Laptop</h2>
	<form action="insert_laptop.jsp">
		<table border=1>
			<tr>
				<td>Serial Number:</td>
				<td><div style="text-align: center;">
						<input type=text name=l_serial_no>
					</div></td>
			</tr>
			<tr>
				<td>Speed:</td>
				<td><div style="text-align: center;">
						<input type=text name=l_speed>
					</div></td>
			</tr>
			<tr>
				<td>Price:</td>
				<td><div style="text-align: center;">
						<input type=text name=l_price>
					</div></td>
			</tr>
			<tr>
				<td>Memory:</td>
				<td><div style="text-align: center;">
						<input type=text name=l_memory>
					</div></td>
			</tr>
			<tr>
				<td>Software (separated by comma if more than 1):</td>
				<td><div style="text-align: center;">
						<input type=text name=l_software>
					</div></td>
			</tr>
			<tr>
				<td>Microchip Manufactured Name:</td>
				<td><div style="text-align: center;">
						<input type=text name=l_mname>
					</div></td>
			</tr>
			<tr>
				<td>Weight:</td>
				<td><div style="text-align: center;">
						<input type=text name=l_weight>
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
