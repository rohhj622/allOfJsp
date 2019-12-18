<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo|Noto+Serif+KR&display=swap');
	#btn {
		width:15em;
		font-family: 'Nanum Myeongjo', serif;
		font-style: italic;
		/* font-family: 'Noto Serif KR', serif; */
		
	}
	
</style>
</head>
<body>
<div class="col-lg-10 col-md-offset-1">
	<div class="btn-group ">
		<button onclick="location.href='main.jsp'" class="btn btn-default" id="btn">365 Christmas</button> 
		<button onclick="location.href='movie.do'" class="btn btn-default" id="btn">크리스마스 영화</button>
		<button onclick="location.href='music.do'" class="btn btn-default" id="btn">크리스마스 노래</button>
		<button onclick="location.href='place.do'" class="btn btn-default" id="btn">크리스마스 장소</button>
	</div>
</div>
	
</body>
</html>