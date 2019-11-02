<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf8");
	
	Class.forName("com./mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:8185/pm?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	//DB - academy attribute
	String acd_no = request.getParameter("acd_no");
	String acd_startTime = request.getParameter("acd_startTime");
	String acd_endTime = request.getParameter("acd_endTime");
	String acd_name = request.getParameter("acd_name");
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO academy(acd_no,acd_startTime,acd_endTime,acd_name) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,acd_no);
		pstmt.setString(2,acd_startTime);
		pstmt.setString(3,acd_endTime);
		pstmt.setString(4,acd_name);
		
		pstmt.execute();
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>

<script>
	self.window.alert("전송 완료");
	location.href="mainPage.jsp";
</script>
