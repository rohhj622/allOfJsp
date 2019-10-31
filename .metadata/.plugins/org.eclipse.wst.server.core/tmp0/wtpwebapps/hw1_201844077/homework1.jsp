<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 201844077 Homework#1 </title>
	<style>
		table{
			width: 30%;
			text-align:center;
		}
	</style>


</head>
<body>
	<h1> &lt;개인정보 입력 결과&gt;  </h1>
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
		String gender = request.getParameter("gender");
		
		/* 이름,주소,나이,성별 불러오기  */
		
	%>
	<table border = "1" >
		<!-- 각각의칸에 값 넣기  -->
		<tr bgcolor="darkblue">
			<td style="color:white">구분</td>
			<td style="color:white">내용</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%= name %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%= age %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%= addr %></td>
		</tr>
		<tr>
			<td>좋아하는 운동</td>
			<td><% 
				String[] sports = request.getParameterValues("sport");
				/* 좋아하는 운동 값 불러오기. 여러개 일 수 있으므로, 배열로 받음.  */
				if(sports != null){
					for(int i = 0 ; i< sports.length; i++){
						out.println(sports[i]);
						
						/* 마지막 값 이면 ',' 찍히지 않게 하기  */
						if( i != (sports.length - 1)){
							out.println(","); 
						}
					}
				}
			%></td>
		</tr>
		
	</table>

</body>
</html>