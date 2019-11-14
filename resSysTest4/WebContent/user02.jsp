<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.tb:{
		width: 20cm;
		height: 40cm;
	}
</style>
<title>SkyMusic - Reservation</title>
</head>
<body>
	<table border ="1" class="tb">
	<tr >
		<td colspan="2">
			<jsp:include page="menu.jsp"/>
		</td>
	</tr>
	<tr>
		<td>
			<jsp:include page="calendar2.jsp"/>
		</td>
		<td>
			<jsp:include page="reservation.jsp"/>
		</td>
	</tr>
</table>
</body>
</html>