<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Example Lamda</h3>
	1. x is bigger than y?<br>
		<%-- ${max = (x,y)-> x > y ? x : y }<br> --%>
		${max = (x,y)-> x > y ? x : y ;''}
	(3 is bigger than 5?) --> ${max(3,5) }<br><hr>
	2. two string are equal?<br>
		${strEQ = (str1,str2) -> str1 == str2 ? true: false ;'' }
		("admin","hyunJin") are equal? --> ${strEQ("admin","hyunjin") }<br><hr>
	3. Pythagoras theorem<br>
		${Func = (a,b) -> Math.sqrt(a*a+b*b);'' }
		pythagoras theorm (3,4)--> ${Func(3,4) }<br><hr>
		
</body>
</html>