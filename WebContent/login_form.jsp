<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h2>Login with Oracle</h2>
	<form action="login.jsp" method="post">
		<table border=1>

			<tr>
				<td>Username:</td>
				<td><div style="text-align: center;">
						<input type=text name=user_id>
					</div></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><div style="text-align: center;">
						<input type=text name=pass_word>
					</div></td>
			</tr>
			
			<tr>
				<td><div style="text-align: center;">
						<input type=reset value=Clear>
					</div></td>
				<td><div style="text-align: center;">
						<input type=submit value=Login>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
