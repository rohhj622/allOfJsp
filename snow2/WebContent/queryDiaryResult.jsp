<%@page import="java.util.ArrayList"%>
<%@page import="model.Diary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width initial-scale=1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

<!-- 부트스트랩 JS  -->
<script src="js/bootstrap.js"></script>
<title>queryEmpResult</title>

<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo|Noto+Serif+KR&display=swap');
	div{
		text-align: center;
		align-content: center;
	}
	#menu{
		margin-top:20px;
		margin-bottom:20px; 
	}
	#trth{
		/* background-color: rgba(230, 230, 255,0.5) ; */
		font-family: 'Noto Serif KR', serif; 
		font-weight:bold;
		font-size: 20px;
	}
	table{
		width: 500px;
	}

</style>
<title>365CHRISTMAS</title>
</head>
<body>
	<%
			response.setContentType("text/html;charset=utf8");
			request.setCharacterEncoding("utf-8");
			
			ArrayList<Diary> list = (ArrayList<Diary>)request.getAttribute("list"); 
			
			
			/* int lSize = list.size();
			int no = list.get(lSize-1).getNo(); */

			
				
	%>
	<div class="container">
		<div class="row" id="menu">
			<jsp:include page="./basic/menu_place.jsp"></jsp:include>
		</div>
		<%-- <div class="row">
			<table class="table">
				<tr id="trth">
					<th style="text-align:center;">
						오늘의 추천 장소
					</th>
				</tr>
				<tr>
					<td>
						<c:set var="no" value="<%=ranNo2 %>"/>
						<c:if test="${no==2}">
							<a href="snow2.jsp"><img src="<%=placesrc %>" width="800px" height="550px"/></a>
						</c:if>
						<c:if test="${no!=2 }">
							<img src="<%=placesrc %>" width="800px" height="550px"/>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
					<a href="<%=mlink%>"><%=mcountry+" - "+mname%></a>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<%=minformation%>
					</td>
				</tr>
			</table>
				
		</div> --%>
		<div class="row">
			<div class ="foot">
				<jsp:include page="./basic/footer.jsp"></jsp:include>
			</div>	
		</div>
	</div>
	<%-- <table border="1" style="text-align:center;">
		
		<tr bgcolor="orange">
			<th>no</th>
			<th>name</th>
			<th>Information</th>
			<th>map</th>
			<th>country</th>
			
		</tr>
		<c:forEach var="place" items="${list }">
		<tr>
				<td>${place.getNo() }</td>
				<td>${place.getName() }</td>
				<td>${place.getInformation() }</td>
				<td>${place.getMap() }</td>
				<td>${place.getCountry() }</td>

		</tr>			
		</c:forEach>
	</table> --%>
<br><br>
</body>
</html>