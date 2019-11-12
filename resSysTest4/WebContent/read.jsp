<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - Read</title>
</head>
<body>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		
		
		<%
			String mem_id = session.getAttribute("mem_id").toString();
			String iAm = "read"; /*  create에서 수정인지 글쓰기인지 판별해줄 변수  */

			
	
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
								<input type="submit" value="글쓰기"><br>
							</form>
			 		
			 		<% 
			 			}
				
				String sql = "Select * from SkyMusic.board order by no desc";
				pstmt  = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				int i = 1;
				
				while(rs.next()){
					String subject = rs.getString("subject"); //제목
					String created = rs.getString("created").substring(0, 10); //생성일 
					String no = rs.getString("no");
					
%>
					<tr>
						<td>
							<a href="bDetail.jsp?sub=<%=subject %>&no=<%=no %>&created=<%=created%> "> <%=i %> </a>
						</td>
						<td>
							<a href="bDetail.jsp?sub=<%=subject %>&no=<%=no %>&created=<%=created%>  "> <%=subject %> </a> 
						</td>
						<td>
							<a href="bDetail.jsp?sub=<%=subject %>&no=<%=no %>&created=<%=created%>  "><%=created %></a>
						</td>
					</tr>

<%					
					i++;

				}
				
				
			}catch(SQLException e){
				System.out.println("read: " + e);
			}
		%>
	
	</table>
</body>
</html>