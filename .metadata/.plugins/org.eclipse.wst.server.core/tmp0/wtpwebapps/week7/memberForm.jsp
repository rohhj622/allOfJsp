<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberJoin.jsp" method="post">
		<table border="1">
			<tr>
				<td>id</td
				><td><input type="text" name="id"></td>
			</tr>
			
			<tr>
				<td>name</td>
				<td><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td>email</td>
				<td><input type="text" name="email"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="join">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>