<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Diary"%>
<%@page import="java.util.ArrayList"%>
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
<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Courgette|Indie+Flower|Mountains+of+Christmas&display=swap');
/* font-family: 'Mountains of Christmas', cursive;
font-family: 'Indie Flower', cursive;
font-family: 'Courgette', cursive; */


/*Simple reset*/
* {margin: 0; padding: 0;}
input{
	align-self: center;
}

body {
	/*You can use any kind of background here.*/
	/* background-image: url("http://cinnabar.com/wp-content/uploads/2013/03/Santa-2.jpg") ; */
	background-image: url("https://thegrovela.com/wp-content/uploads/2018/11/GAF_SantaHouse_2880x1920.jpg") ;
	background-repeat: no-repeat;
	background-size: cover;
}
canvas {
	display: block;
}
a{
	text-align: center;
	text-decoration: none;
}
a:link { color: white; text-decoration: none;}
a:visited { color: white; text-decoration: none;}
a:hover { color: white; text-decoration: none;}

p{
	text-align:center;
	font-family: 'Indie Flower', cursive, fantasy;
	font-size: 80px;
	color: white;
	background-color: rgba(255,255,255,0.1);
	text-shadow: 2px 2px 2px gray;
}
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
	#di{
		background-color: rgba(255,255,255,0.5);
		width:600px;
		height : 100px;
		align:center ;
		outline:none;
	}
	input[type=submit] { 
		background-color: #ffffff;
		width: 50px;
		height: 30px;
		outline:none;
	}
	input[type=text] { 
		height:30px;
	}
</style>


<title>365CHRISTMAS</title>
</head>
<body>
	<%
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		
		System.out.println(nYear);
		
		String date =  nYear+"-12-25";
	
	%>
	<div style="position:relative;"  >
		<p><a href="main.jsp">️️Merry Christmas️️</a></p>
		<br><br><br><br>
		<div class="row">
			<center>
			<table id="di" >
				<tr>
					<td >
					<center>
						<form action="writeProc.jsp" >
							<input type="hidden" name="cdate" value="<%=date%>">
							<input type="text" name="content" size="50">							
							<input type="submit" value=" 쓰기 " >
						</form>
					</center>
					</td>
				</tr>
			</table>
			</center>
		</div> 
		
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="playMusic.jsp"></jsp:include>
	</div>
</body>
</html>