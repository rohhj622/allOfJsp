<%@page import="java.util.ArrayList"%>
<%@page import="model.Music"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<!-- <meta name="viewport" content="width=device-width initial-scale=1"> -->

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

<!-- 부트스트랩 JS  -->
<script src="js/bootstrap.js"></script>

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

<title>365CHRISTMAS</title>
</head>
<body>
<!-- menu -> queryEmp -> queryEmpResult -> menu -->
	
	<%
			response.setContentType("text/html;charset=utf8");
			request.setCharacterEncoding("utf-8");
			
			ArrayList<Music> list = (ArrayList<Music>)request.getAttribute("list"); 
			int lSize = list.size();
			
			double dranNo = Math.random();
			
			int ranNo = (int)(dranNo*lSize)+1;
			
			System.out.println("random"+ranNo);	
			
			
			int i=0;
			
			if(ranNo-1>=0) 
				i=ranNo-1;
			else 
				i=ranNo;
			
			String mtitle = (String)list.get(i).getTitle();
			String mSinger = (String)list.get(i).getSinger();
			String mlink = list.get(i).getLink();
			
			

			System.out.println(mlink);
			System.out.println("i값:"+i);
				
	%>
	<%-- <object type="text/html" width="100%" height="500" data="<%=mlink%>">
	</object> --%>
	
	 
	 <div class="container">
		<div class="row" id="menu">
			<jsp:include page="./basic/menu_music.jsp"></jsp:include>
		</div>
		<div class="row">	
	 		
	 		<table class="table">
	 			<tr id="trth">
					<th style="text-align:center;">
						오늘의 추천 노래 
					</th>
				</tr>
	 			<tr>
	 				<td>
	 					<iframe width="560" height="315" src="https://www.youtube.com/embed/<%=mlink%>" 
						frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
	 					allowfullscreen></iframe>
	 				</td>
	 			</tr>
		 		<tr>
		 			<td><%=mtitle %> - <%=mSinger %>  </td>
		 		</tr>
	 		</table>
	 	</div>
	 	<div class="row">
			<div class ="foot">
				<jsp:include page="./basic/footer.jsp"></jsp:include>
			</div>	
		</div>
	 </div>
	 
<%-- 	<table border="1" style="text-align:center;">
		<tr bgcolor="orange">
			<th>no</th>
			<th>title</th>
			<th>singer</th>
			<th>link</th>
		</tr>
		
		<c:forEach var="music" items="${list }">
			<tr>
				<td>${music.getNo() }</td>
				<td>${music.getTitle() }</td>
				<td>${music.getSinger() }</td>
				<td>${music.getLink() }</td>
				
				
			</tr>			
		</c:forEach>
	</table> --%>
<br><br>
</body>
</html>