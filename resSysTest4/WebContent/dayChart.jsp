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
				<button onclick="location.href='memChart.jsp'">취소차트</button>
				<jsp:include page="chart01.jsp"/><!-- 요일별 차트 -->
			</td>
		</tr>
	</table>
</body>
</html>