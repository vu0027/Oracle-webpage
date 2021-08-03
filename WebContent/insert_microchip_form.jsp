<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert New Microchip Manufacturer</title>
</head>
<body>
	<input type="button" value="back" onclick="history.back()"/> 
	<h2>Insert New Microchip Manufacturer</h2>
	<form action="insert_microchip.jsp">
		<table border=1>
			<tr>
				<th colspan="2">Enter the Microchip Manufacturer data:</th>
			</tr>
			<tr>
				<td>Manufacturer Name:</td>
				<td><div style="text-align: center;">
						<input type=text name=m_name>
					</div></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><div style="text-align: center;">
						<input type=text name=m_address>
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
