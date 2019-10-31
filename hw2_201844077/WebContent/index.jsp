<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<style>
	table{
		width:100%;
	}
	
	/* id */
	#menuPage{
		background-color: #333333;
		height:65px;
	}
	#indexPage{
		text-align:center;
		background-color:#d9d9d9;
		height:450px;
		
	}
	#indexPage2{
		text-align:center;
	}
	#footerPage{
		text-align:center;
	}
	#title{
		font-size:3em;
		font-weight:bold;
	}
	#subTitle{
		font-size:2em;
		font-weight:bold;
	}
	
</style>
</head>

<body>
	<table>
		<tr id="menuPage">
			<td>
				<jsp:include page="menu.jsp"></jsp:include>
			</td>
		</tr>
		<tr id="indexPage">
			<td>
				<p id="title">웹 쇼핑몰에 오신 것을 환영합니다</p>
			</td>
		</tr>
		<tr id="indexPage2">
			<td>
				<p id="subTitle"> Welcome to Web Market!<p>
				<%  Date date = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
					String now;
					
					if(date.getHours()>=12){
						now = sf.format(date) + " PM";
					}else{
						now = sf.format(date) + " AM";
					}
				%>
				<p> 현재 접속 시각 : <%=now%> </p>
				<hr>
			</td>
		</tr>
		
		<tr id="footerPage">
			<td>
				<jsp:include page="footer.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>