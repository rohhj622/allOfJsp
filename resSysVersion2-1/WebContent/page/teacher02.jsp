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
			<td colspan="3">
				<jsp:include page="../header/teacherMenu.jsp"/>
			</td>
		</tr>
		<tr>
			<td>
				내역
				<jsp:include page="../calendar6.jsp"/>
			</td>
			<td>
				<p>00빌딩</p>
				<hr>
				<jsp:include page="../process/teacherRes.jsp"/>
			</td>
			<td>
				<p>서련빌딩</p>
				<hr>
				<jsp:include page="../process/teacherRes2.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>