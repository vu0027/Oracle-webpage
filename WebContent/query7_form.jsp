<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Customer</title>
</head>
<body>
	<input type="button" value="back" onclick="history.back()"/> 
	<h2>Find Customer who ordered a laptop running a particular operating system </h2>
	<form action="query7.jsp">
		<table border=1>
			<tr>
				<td>Software (OS):</td>
				<td><div style="text-align: center;">
						<input type=text name=software>
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
