<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.tb:{
		width: 20px;
		height: 40px;
	}
</style>
<title>SkyMusic</title>
</head>
<body>
	<table border="1" class="tb">
		<tr>
			<td colspan="2">
				<jsp:include page="../header/teacherMenu.jsp"/>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="../calendar4.jsp"/>
			</td>
			<td>
				<p> 연속 예약 하기 </p>
				<p> 비어있는 시간을 확인해서 예약 해주세요. </p>
				<hr>
				<jsp:include page="../process/adminResAll.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>