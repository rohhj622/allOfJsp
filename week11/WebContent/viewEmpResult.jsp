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
	<c:if test="${result == 0 }">
		<script type="text/javascript">
					alert("사원번호가 존재하지 않습니다. ");
					history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == 1 }">
		<table border="1" style="width:300px; text-align:center;">
			<tr>
				<td>사번</td>
				<td>${empno }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${name }</td>
			</tr>
			<tr>
				<td>부서코드</td>
				<td>${dept }</td>
			</tr>
			<tr>
				<td>업무</td>
				<td>${job }</td>
			</tr>
			<tr>
				<td>급여</td>
				<td>${sal }</td>
			</tr>
		</table>
		<br><br>
		<button onclick="location.href='updateEmp.jsp?empno='+${empno}">사원정보 수정</button>
		<button onclick="location.href='deleteEmp.jsp?empno='+${empno}">사원정보 삭제</button>
		<button onclick="location.href='viewEmpForm.jsp'">돌아가기</button>
	</c:if>
</body>
</html>