<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>var bound</h1>
	<%!
		//선언문 
		//String strVar = "전역변수임 ";
		String strVar; // 초기화 해도 ㄱㅊ 
	%>
	<%! // method선언 
		String getStr(){
		return strVar;
	}
	%>
	<%	//scriptlet
		String strVar2 = "지역변수"; 
		//String strVar2; //스크립틀릿에선 반드시 선언 해야함 
	%>
	<%-- <%!
		String getStr2(){
		return strVar2;
	}
	%> --%>
	
	<br>
	 선언문에서 선언한 변수 strVar = <%=getStr() %><br>
	 스크립틀릿에스 선언한 변수 strVar2 = <%=strVar2 %> <br>
</body>
</html>