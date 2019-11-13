<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creating...</title>
</head>
<body>
	<h1>HiCreate</h1>
	<%
		String no = request.getParameter("noUpdate");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		if(title ==null || content == null){
	%>
			<script type="text/javascript">
				alert("빈칸이 없어야합니다.");
				location.href="board.jsp";
			</script>
	<% 
		}
		
		/* DB */
		Class.forName("com.mysql.cj.jdbc.Driver");	
		String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
		String id = "HJ";
		String pass = "shguswls12";
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		System.out.println("boardTask:" + no);
		
		/* 새로운 글 작성 한다면  */
		if(no == null || no.length()==0){		
			try{
				String sql1 = "insert into SkyMusic.board(subject,content,created) values('"+title+"','"+content+"',date(now()))";
				pstmt = conn.prepareStatement(sql1);
				pstmt.executeUpdate(sql1);

				pstmt.close();
				conn.close();
				
				
			}catch(SQLException e){
				System.out.println("BoardTask1 : " + e);
			}
		%>
			<script type="text/javascript">
			 alert("작성되었습니다.");
			 location.href="board.jsp";
			</script>
			
		<% 
		}
		/* 글 수정하는거라면  */
		else{
			
			try{
				String sql2 = "update SkyMusic.board set subject='"+title+"' where no='"+no+"'";
				pstmt = conn.prepareStatement(sql2);
				pstmt.executeUpdate(sql2);
				
				sql2 = "update SkyMusic.board set content='"+content+"' where no='"+no+"'";
				pstmt = conn.prepareStatement(sql2);
				pstmt.executeUpdate(sql2);

				sql2 = "update SkyMusic.board set created=date(now()) where no='"+no+"'";
				pstmt = conn.prepareStatement(sql2);
				pstmt.executeUpdate(sql2);
				
			}catch(SQLException e){
				System.out.println("BoardTask : " + e);
			}
		%>
			<script type="text/javascript">
			 alert("수정되었습니다.");
			 location.href="board.jsp";
			</script>
			
		<% 
			
		}
	
	
	%>
	
</body>
</html>