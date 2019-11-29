<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<table border="1">
			<caption>업로드 화면</caption>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>작성</td>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td>파일</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>
			
		</table>
	</form>

</body>
</html>