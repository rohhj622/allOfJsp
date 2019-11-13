<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loging...</title>
</head>
<body>

<%
	/* id */
	String mem_id= request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	
	/* DB Connect */
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	/* nowD */
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	
	Date nowD = sf.parse(sf.format(now)); /* 오늘 날 */
	
	
	/* sql query */
	try{
		/* 현재 페널티 걸린 사람들 정보 가져오기.  */
		String sql  = "select * from SkyMusic.member where mem_pDate is not null";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String str = rs.getString("mem_pDate");
			Date pDate = sf.parse(str); /* 페널티 거두는 날짜  */
			
			/* 페널티거두는 날짜와 오늘이 같다면? */
			int subR = pDate.compareTo(nowD);
			
			if(subR==0){
				/* 페널티 걸린 날짜 지워주기  */
				
				String sql1 = "update SkyMusic.member set mem_pDate=null where mem_id='"+mem_id+"'";
				pstmt = conn.prepareStatement(sql1);
				pstmt.executeUpdate(sql1);
			}else{
				/* 나머지는 그냥 진행 */
				continue;
			}
			
		}
		
	}
	catch(SQLException e){
		System.err.println(e);
	}
	
	
	
	if(mem_id.equals("rohhj622")){
		
		session.setAttribute("mem_id", mem_id);
		response.sendRedirect("user01.jsp");
		
	}else if(mem_id.equals("rohwk129")){
		session.setAttribute("mem_id", mem_id);
		response.sendRedirect("user01.jsp");
	}else if(mem_id.equals("doyoung")){
		session.setAttribute("mem_id", mem_id);
		response.sendRedirect("user01.jsp");
	}else{
		session.setAttribute("mem_id", mem_id);
		response.sendRedirect("admin01.jsp");
	}
	
%>


</body>
</html>