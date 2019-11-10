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
	<h3>jstl tag result 2</h3>
	id:${mem.getId() }<br>
	name:${mem.getName() }<br>
	
	<c:if test="${mem.getId() == mem.getPassword() }">
		<script type="text/javascript">
			alert("login success")
		</script>
		Mainpage
	</c:if>
	<c:if test="${mem.getId() != mem.getPassword() }">
		<script type="text/javascript">
			alert("login failed")
		</script>
	
	</c:if>
	
</body>
</html>