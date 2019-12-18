<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 


<title>SkyMusic</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Mansalva|Ranga|Shadows+Into+Light&display=swap');
    
    p{
        color:#000080;
        font-weight: 700;
       
        font-size: 10em;
        text-align: center;
        font-family: 'Shadows Into Light', cursive;
    }
    div{
        margin:auto; 
        text-align: center;
    }
    
    #id01{ 
        font-size:1rem;
        text-align:left;
        margin-top: 1em;
        align:center;
    }
    #id02{
        background:#1AAB8A;
        color:#fff;
        border:none;
        position:relative;
        height:50px;
        font-size:1.6em;
        padding:0 2em;
        cursor:pointer;
        transition:800ms ease all;
        outline:none;
        margin-top: 1em;
        align:center;
        
    }
    #id02:hover{
        background:#fff;
        color:#1AAB8A;
    }
    #id02:before,#id02:after{
        content:'';
        position:absolute;
        top:0;
        right:0;
        height:2px;
        width:0;
        background: #1AAB8A;
        transition:400ms ease all;
    }
    #id02:after{
        right:inherit;
        top:inherit;
        left:0;
        bottom:0;
    }
    #id02:hover:before,#id02:hover:after{
        width:100%;
        transition:800ms ease all;
    }
</style>
</head>


<body>
<div class="container">
	<div class="row">
		<p>"Sky Music" </p>
	</div>
	<div class ="row">
		<form action="loginOk.jsp" method="post">
		id : <input type="text" name="mem_id" id="id01"  ><br>
		pw :<input type="password" name="mem_pw" id="id01"><br>
		<input type="submit" value="login" id="id02">
	</form>
	</div>
</div>


	

</body>
</html>