<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deleting...</title>
</head>
<body>
	<%
		String no = request.getParameter("noUpdate");
		
	
		Class.forName("com.mysql.cj.jdbc.Driver");	
		String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
		String id = "HJ";
		String pass = "shguswls12";
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			if(no != null){
				String sql = "delete from SkyMusic.board where no = '"+no+"'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
				String sql1 = "select * from SkyMusic.board";
				pstmt = conn.prepareStatement(sql1);
				rs = pstmt.executeQuery(sql1);

				if(rs!=null){
					rs.close();
					pstmt.close();
					conn.close();
				}
				
				
			%>
				<script type="text/javascript">
				 alert("삭제되었습니다.");
				 location.href="board.jsp";
				</script>
				
			<% 
			}
		}
		catch(SQLException e){
			System.out.println("deleteBoard: " + e);
		}
		
	%>
</body>
</html>