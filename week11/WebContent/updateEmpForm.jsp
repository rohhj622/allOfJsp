<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>사원정보수정 화면</h3>
<form action="updateEmpProc.jsp">
	<table border="1" style="width:300px; text-align:center;">
			<tr>
				<td>사번</td>
				<td>${empno }
					<input type="hidden" value="${empno }" name="empno">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${name }
					<input type="hidden" value="${name }" name="name">	
				</td>
			</tr>
			<tr>
				<td>부서코드</td>
				<td><input type="text" value="${dept }" name="dept" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>업무</td>
				<td><input type="text" value="${job }" name="job" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>급여</td>
				<td><input type="text" value="${sal }" name="sal" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
</form>
<button onclick="location.href='viewEmpForm.jsp'">돌아가기</button>
</body>
</html>