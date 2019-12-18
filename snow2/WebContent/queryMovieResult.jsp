<%@page import="java.util.ArrayList"%>
<%@page import="model.Movie"%>
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
<title>365CHRISTMAS</title>

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

</style>

</head>
<body>
	<%
			response.setContentType("text/html;charset=utf8");
			request.setCharacterEncoding("utf-8");
			
			ArrayList<Movie> list = (ArrayList<Movie>)request.getAttribute("list"); 
			int lSize = list.size();
			
			double dranNo = Math.random();
			double lranNo = Math.random();
			
			int ranNo = (int)(dranNo*lSize)+1;
			int ranNo2 = (int)(lranNo*4)+1;
			
			System.out.println("random"+ranNo);	
			
			String moviesrc = "./pictures/movie"+ranNo+".jpeg"; //랜덤으로 띄우는 영화 사진
			
			
			int i=0;
			
			if(ranNo-1>=0) 
				i=ranNo-1;
			else 
				i=ranNo;
			
			String mtitle = (String)list.get(i).getTitle();
			String mdirector=(String)list.get(i).getDirector();
			String mcreated = (String)list.get(i).getCreated();
			String minformation = (String)list.get(i).getInformation();
			
			

			System.out.println(mtitle);
			System.out.println("i값:"+i);
				
	%>
	<div class="container">
		<div class="row" id="menu">
			<jsp:include page="./basic/menu_movie.jsp"></jsp:include>
		</div>
		<div class="row">		
			<table class="table">
				<tr id="trth">
					<th style="text-align:center;">
						오늘의 추천 영화 
					</th>
				</tr>
				<tr>
					<td>
						<c:set var="no" value="<%=ranNo2 %>"/>
						<c:if test="${no==2}">
							<a href="snow2.jsp"><img src="<%=moviesrc %>" width="400px" height="550px"/></a>
						</c:if>
						<c:if test="${no!=2 }">
							<img src="<%=moviesrc %>" width="400px" height="550px"/>
						</c:if>
						
					</td>
				</tr>
				<tr>
					<td>	
						<%=mtitle %>		
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<%=mdirector+" // "+mcreated%>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<%=minformation%>
					</td>
				</tr>

			</table>

<%-- 			<table class="table table-striped">
				<tr><td colspan="5">크리스마스 영화</td></tr>
				<tr>
					<th>no</th>
					<th>title</th>
					<th>director</th>
				<!-- 	<th>created</th>
					<th>information</th> -->
				</tr>
		
				<c:forEach var="movie" items="${list }">
					<tr>
						<td>${movie.getNo() }</td>
						<td>${movie.getTitle() }</td>
						<td>${movie.getDirector() }</td>
						<td>${movie.getCreated() }</td>
						<td>${movie.getInformation() }</td>
					</tr>			
				</c:forEach>
			</table>
		 --%>
		</div>
		<div class="row">
			<div class ="foot">
				<jsp:include page="./basic/footer.jsp"></jsp:include>
			</div>	
		</div>
	</div>
	
<br><br>
</body>
</html>