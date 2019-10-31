<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>

<style type="text/css">
	table{
		margin-top:70px;
		margin-left:40px;
		margin-right:40px;
		width:35%;
		border-spacing: 0px 0px;
	}
	td{
		border-bottom: 1px solid #444444;
		border-spacing: 0px 0px;
	}
	tr{
		margin-top:10px;
		margin-bottom:10px;
		border-spacing: 0px 0px;
		height:30px;
	}
	form{
		display: inline;
	}
	
	/* class */
	.textStyle{
		text-align: center;
		background-color:#b3d1ff;
		width:170px;
		height:40px;
		
	}
	.inputStyle{
		align:center;
		margin-left: 25%;
		width:50%;
	}
	/* id */
	#titleLogin{
		text-align:center;
		font-weight:bold;
		font-size:1.5em;
	}
	
</style>

</head>
<body>
	<form action="./login.jsp" method="post">
		<table>
			
			<tr>
				<td colspan="2" id="titleLogin"> 로그인 </td>
			</tr>
			
			<tr>
				<td class="textStyle">아이디</td>
				<td >
					<input type="text" name="id" class="inputStyle">
				</td>
			</tr>
			
			<tr>
				<td class="textStyle">비밀번호</td>
				<td >
					<input type="password" name="passwd" class="inputStyle">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" class="textStyle">
					<input type="submit" value="로그인">
					<input type="submit" value="취소하기">
				</td>
			</tr>	
		</table>
	</form>	

</body>
</html>