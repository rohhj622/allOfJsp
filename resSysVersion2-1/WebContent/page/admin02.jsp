<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - Chart</title>
</head>
<body>
	<table border="1" class="tb">
		<tr>
			<td>
				<jsp:include page="../header/adminMenu.jsp"/>
			</td>
		</tr>
		<tr>
			<td>
				<button onclick="location.href='../chart/dayChart.jsp'">요일별차트</button>
				<button onclick="location.href='../chart/timeChart.jsp'">시간별차트</button>
				<button onclick="location.href='../chart/numCan.jsp'">누적페널티순위</button>
			</td>
		</tr>
	</table>
</body>
</html>