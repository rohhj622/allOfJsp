<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border ="1">
	<tr >
		<td colspan="2">
			<jsp:include page="menu.jsp"/>
		</td>
	</tr>
	<tr>
		<td>
			<jsp:include page="calendar.jsp"/>
		</td>
		<td>
			<jsp:include page="reserve.jsp"/>
		</td>
	</tr>
</table>

</body>
</html>