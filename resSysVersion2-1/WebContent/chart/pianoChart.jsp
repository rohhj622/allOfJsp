<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - timeChart(Guitar)</title>
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
				<button onclick="location.href='dayChart.jsp'">요일별차트</button>
				<button onclick="location.href='timeChart.jsp'">시간별차트</button>
				<button onclick="location.href='numCan.jsp'">누적페널티순위</button>
				<br>
				<button onclick="location.href='drumChart.jsp'">드럼</button>
				<button onclick="location.href='guitarChart.jsp'">기타&베이스</button>
				<button onclick="location.href='pianoChart.jsp'">피아노</button>
				<jsp:include page="chart05.jsp"></jsp:include>
			</td>  
		</tr>
	</table>
</body>
</html>