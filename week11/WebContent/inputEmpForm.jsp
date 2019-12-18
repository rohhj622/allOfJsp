<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function check(){
		if(!frm.empno.value){
			alert("사원번호를 입력하시오");
			frm.empno.focus();
			return false;
		}else if(!frm.name.value){
			alert("이름을 입력하시오");
			frm.name.focus();
			return false;
		}else if(!frm.dept.value){
			alert("부서번호를 입력하시오");
			frm.dept.focus();
			return false;
		}else if (!frm.job.value){
			alert("업무를 입력하시오");
			frm.job.focus();
			return false;
		}else if(!frm.sal.value){
			alert("급여를 입력하시오");
			frm.sal.focus();
			return false;
		}
	}
</script>
<title>inputEmpForm.jsp</title>
</head>
<body>
	<form action="inputEmpProc.jsp" onsubmit="return check()">
		<table border="1" style="text-align:center;">
			<tr><td colspan="2">사원등록</td></tr>
			<tr>
				<td>사번</td>
				<td><input type="text" name="empno" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>부서코드</td>
				<td><input type="text" name="dept"></td>
			</tr>
			<tr>
				<td>업무</td>
				<td><input type="text" name="job"></td>
			</tr>
			<tr>
				<td>급여</td>
				<td><input type="num" name="sal"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	<br><br>
	<form action="menu.jsp">
		<input type="submit" value="메뉴화면">
	</form>
</body>
</html>
