<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int penalty;
%>
<%
	String mem_id = session.getAttribute("mem_id").toString();

	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	try{
		/* 1 */
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "select mem_penalty from SkyMusic.member where mem_id = '"+mem_id+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();	
		
		
		if(rs.next()){
			penalty = rs.getInt(1);
		}
		
	}
	catch(SQLException e){
		System.out.println(e);
	}

	String date = request.getParameter("date");
	String acd_no = request.getParameter("acd_no");
	String acd_startTime = request.getParameter("acd_startTime");
	
	System.out.println(acd_no);
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf2 = new SimpleDateFormat("HH:mm:ss");
	
	Date a = sf2.parse(acd_startTime); // 예약한 시간 
	Date b = sf2.parse(sf2.format(now)); // 현재 시간 

	
	/* 
		취소하기
		1. 이미 지나간 시간인지 확인. // 지나간건 삭제 x
		2. 오늘날짜가 취소하려는 날짜 인지 확인하기. // 맞으면 패널티 +1 , 아니면 그대로 
		3. 취소 유무 물어보고 한다하면 내역에서 지우기 & 패널티 처리하기.
		
	*/
	
	/* 이미 지나간 시간대 선택  */
	if(a.getTime()-b.getTime()<0){	
%>
		<script>
			alert("이미 지나간 시간입니다.");
			location.href="test02.jsp";
		</script>
<% 		
	}
	
	boolean okP = false; // true -> penalty-1
	
	if(date.equals(sf.format(now))){
		okP = true;
%>
		<script>
			String msg = "지금 취소하시면 페널티 1점이 추가됩니다.\n 진행하시겠습니까? (현재 패널티 : "+<%=penalty%>+" 점)"
			
			var con = confirm("msg");
			
			if(con==false){
				location.href="test02.jsp";				
			}
		</script>
<% } 
	
%>
	

</body>
</html>