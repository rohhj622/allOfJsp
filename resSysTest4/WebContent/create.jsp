<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - Create</title>
</head>
<body>
	<h1>create</h1>
	<%
		String noUpdate = request.getParameter("number"); //details에서 수정 누른 사람들. 
		System.out.println("created: "+noUpdate);
	%>
		
			<%
			Boolean iAm = false; /* false -> 글쓰기 // true -> 수정 */
			String str = "수정";
			
			/* 수정 */
			if(noUpdate !=null ){
				iAm = true;
				/* DB 연결  */
				Class.forName("com.mysql.cj.jdbc.Driver");	
				String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
				String id = "HJ";
				String pass = "shguswls12";
				
				Connection conn = DriverManager.getConnection(url,id,pass);
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select * from SkyMusic.board where no='"+noUpdate+"'";/* 번호에 맞게 가져오기. */
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					String title = null; /* 글 제목  */
					String content = null; /* 글 내용 */
					
					if(rs.next()){
						title = rs.getString("subject");
						content = rs.getString("content");
					}
					
					if(title != null && content != null){
						%>
						<form action="boardTask.jsp">
							<table>
								<tr>
									<td>
										제목 : <input type="text" name="title" value="<%=title %>">
									</td>
								</tr>
								<tr>
									<td>
										내용 : <textarea rows="10" cols="50" name="content" ><%=content %></textarea>
									</td>
								</tr>
							</table>
							<input type="hidden" name="noUpdate" value="<%=noUpdate %>">
							<input type="submit" value="수정">
						</form>
						<% 		
					}
				}catch(SQLException e){
					System.out.println("create :" + e);
				}
				
			}
			/* 새로 작성 */
			else{
				%>
				<form action="boardTask.jsp">
							<table>
								<tr>
									<td>
										제목 : <input type="text" name="title" >
									</td>
								</tr>
								<tr>
									<td>
										내용 : <textarea rows="10" cols="50" name="content" ></textarea>
									</td>
								</tr>
							</table>
							<input type="hidden" name="noUpdate" value="<%=noUpdate %>">
							<input type="submit" value="글쓰기">
				</form>
				<% 		
				}

			%>

		
</body>
</html>