<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" class="tb">
		<tr>
			<td>
				<jsp:include page="adminMenu.jsp"/>
			</td>
		</tr>
		<tr>
			<td>
				<button onclick="location.href='dayChart.jsp'">일별차트</button>
				<button onclick="location.href='timeChart.jsp'">시간별차트</button>
				<button onclick="location.href='numCan.jsp'">누적페널티순위</button>
				<br>
				<jsp:include page="chart02.jsp"></jsp:include>
			</td>  
		</tr>
	</table>
</body>
</html>