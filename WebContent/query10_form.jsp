<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Customer</title>
</head>
<body>
	<input type="button" value="back" onclick="history.back()"/> 
	<h2>Delete all customers who have not made any order since a particular year.
</h2>
	<form action="query10.jsp">
		<table border=1>

			<tr>
				<td>Year:</td>
				<td><div style="text-align: center;">
						<input type=text name=year>
					</div></td>
			</tr>
			
			<tr>
				<td><div style="text-align: center;">
						<input type=reset value=Clear>
					</div></td>
				<td><div style="text-align: center;">
						<input type=submit value=Delete>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
