<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mem_id = session.getAttribute("mem_id").toString(); /* 아이디 . 관리자인지 아닌지에 따라 버튼 보여주고 말고, */
		String no = request.getParameter("no"); // 글 번호 
		String title = request.getParameter("sub"); // 글 제목 
		String created = request.getParameter("created"); // 글 생성일 
		
		System.out.println("detail: "+no);
	
		/* DB 연결  */
		Class.forName("com.mysql.cj.jdbc.Driver");	
		String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
		String id = "HJ";
		String pass = "shguswls12";
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
 		try{
 			if(mem_id.equals("admin")){
 		%>
 				<form action="bCreate.jsp">
					<input type="hidden" name="number" value="<%=no %>">
					<input type="submit" value="수정"><br>
				</form>
 		
 		<% 
 			}
 	
 			String sql = "Select * from SkyMusic.board where no ='"+no+"'"; //번호에 맞는 결과 가져와라 
			pstmt  = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			String content = null;
			if(rs.next()){
				content = rs.getString("content"); //내용만 content에 넣기 
				
			}
			
			if(content.isEmpty()==false){ //content가 빈게 아니라면
				%>
				<table>
					<!-- 제목 & 작성 -->
					<tr>
						<td>
							 <%=title %>
						</td>
						<td>
							<%=created %>
						</td>
					</tr>
					
					<!-- 내용 -->
					<tr>
						
						<td colspan="2">
							<hr>
							<%=content %>
						</td>
					</tr>
					
				</table>
				
	<% 
			}
			
		}catch(SQLException e){
			System.out.println("detail: " +e);
		}
		 
		
	%>
	
	
</body>
</html>