<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>365CHRISTMAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

<style type="text/css">

	@import url('https://fonts.googleapis.com/css?family=Gloria+Hallelujah|Griffy|Just+Me+Again+Down+Here|Walter+Turncoat&display=swap');

	div{
		text-align: center;
		align-content: center;
	}
	.row #title{
	/* 	margin-left:11.5em;
	 	width:50em;
		height:30em; 
		background-image:url('./image/mainback3.png');
		background-repeat: no-repeat;
		background-position:center;
		background-size: 80em 60m; 
		 */
		
		background: url('./image/mainback3.png') no-repeat center center fixed ; 
		
		/* background-size:100%; */
		height: 46em;
		display:block;
		padding:0 !important;
		
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
	p{
		text-align:center;	
		font-size:5em;	
		font-family: 'Walter Turncoat', cursive;
		color:white;
		text-shadow: 2px 2px 2px black;
	}
	.container .foot{
	
	}
</style>

</head>
<body>
<br>
	<div class="container">
		<div class="row">
			<jsp:include page="./basic/menu_bootstrap.jsp"></jsp:include>
		</div>
			<br>
			
		<div class="row">
			<div id="title" class="col-lg-10 col-lg-offset-1">
				<br><br><br><br><br><br><br><br><br>
				<p>IT'S A CHRISTMAS!</p>
			</div>
		</div>
		
			<br>
		<div class="row">
			<div class ="foot">
				<jsp:include page="./basic/footer.jsp"></jsp:include>
			</div>	
		</div>
		
	</div>
	
	<br>
</body>
</html>