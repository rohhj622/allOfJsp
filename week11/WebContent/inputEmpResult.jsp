<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${empCheck > 0 }">
			<script type="text/javascript">
					alert("이미 등록된 사원번호 입니다. ");
					history.go(-1);
			</script>
		</c:when>
		<c:when test="${result>0 }">
			<script type="text/javascript">
				alert("사원 등록 성공 ");
				location.href="queryEmp.jsp";
			</script>
		</c:when>
	</c:choose>
</body>
</html>