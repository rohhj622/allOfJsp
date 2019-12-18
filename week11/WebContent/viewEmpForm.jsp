<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(!frm.empno.value){
			alert("사원번호를 입력하시오");
			frm.empno.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form action="viewEmpQuery.jsp" onsubmit="return check()">
		조회할 사원번호를 입력하세요 : <input type="text" name="empno" autofocus="autofocus">
		<br><br>
		<input type="submit" value="조회">
		<input type="reset" value="취소">
		
	</form>
	<br>
	<button onclick="location.href='menu.jsp'">메뉴화면 </button>
	
</body>
</html>