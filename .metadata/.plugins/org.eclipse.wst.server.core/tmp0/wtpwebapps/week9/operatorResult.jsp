<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>El Operator Result</h3>
	x = ${param.num1 }<br> <!-- input은 param붙여야 함  -->
	y = ${param.num2 }<br>
	x+y = ${param.num1 + param.num2 }<br>
	x-y = ${param.num1 - param.num2 }<br>
	x*y = ${param.num1 * param.num2 }<br>
	x/y = ${param.num1 / param.num2 }<br>
	x%y = ${param.num1 % param.num2 }
	<hr><br><br>
	x is bigger than y? ${(param.num1 - param.num2)>0 }<br>
	y is bigger than x? ${(param.num1 - param.num2)<0 }<br>
	<hr><br>
	x,y > 0? ${param.num1 > 0 && param.num2 > 0 }<br>
	x=y? ${param.num1 == param.num2 }<br>
	<hr><br>
	${var = "admin" }<br>
	${strArray=['A','B','C'];'' }
	strArray = ${strArray }<br>
	<hr><br>
	${var =='admin' }<br>
	${strArray[0] += strArray[1] += strArray[2] }<br>
	
</body>
</html>