<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserving...</title>
</head>
<body>

<%

	String mem_id = session.getAttribute("mem_id").toString();

	String date = request.getParameter("date");
	String instrument = request.getParameter("instrument");
	String isWeek = request.getParameter("isWeek");
	String acd_no = request.getParameter("text"); 
	//String acd_startTime = request.getParameter("acd_starTime");
	
	System.out.println("taskRes var = "+mem_id+","+date+","+instrument+","+isWeek+","+acd_no);
	
	
	request.setCharacterEncoding("utf8"); 
	
	/*  
		1. 페널티가 == 5 인가?
		2. 하루 2회 예약을 다 하였는가?
		3. 이미 예약한 시간인가?
		4. 예약할건데, 이미 하나정도는 예약이 되어있나? 있으면 그냥 ,없으면 추가하고  ㄱ 
	*/
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";

	try{
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		
	
		/* 0 */


		
		/* 1 */
		String sql = "select mem_penalty from SkyMusic.member where mem_id = '"+mem_id+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);	
		int penalty=0;
		
		if(rs.next()){
			penalty = rs.getInt(1);
		}	
		System.out.println(penalty);
		if(penalty == 5){
%>
			<script>
				alert("페널티 5회로 예약 불가합니다.");
				location.href="test01.jsp";
			</script>
<% 
			/* response.sendRedirect("test01.jsp"); */
		}
		
		/* 2 */
		String sql2 = "select count(*) from SkyMusic.reservation where mem_id='"+mem_id+"' and res_date='"+date+"'";
		pstmt = conn.prepareStatement(sql2);
		
		rs = pstmt.executeQuery(sql2);
		
		int t=0;
		
		if(rs.next()){
			t = rs.getInt(1);
		}
		
		if(t==2){
%>
			<script>
				alert("예약 가능 횟수를 초과하였습니다.");
				location.href="test01.jsp";
			</script>
<% 
		}
		
		/* 3 */
		String sql3 = "select count(*) from SkyMusic.reservation where mem_id = '"+mem_id+"' and res_date='"+date+"' and acd_no='"+acd_no+"'";
		pstmt = conn.prepareStatement(sql3);
		
		rs = pstmt.executeQuery(sql3);
		int k=0;
		
		if(rs.next()){
			k = rs.getInt(1);
		}
		if(k == 1){
%>
			<script>
				alert("이미 예약한 시간입니다.");
				location.href="test01.jsp";
			</script>
<% 
							
		}
		
		/* 4 */
		/* 이미 찬 연습실은 앞에 reserve에서 처리하고 보여준 것. */
		String sql4 = "insert into SkyMusic.reservation value('"+mem_id+"','"+acd_no+"','"+date+"','using')";
		pstmt = conn.prepareStatement(sql4);
		
		pstmt.executeUpdate(sql4);
%>
		<script>
			alert("예약되었습니다.");
			location.href="test01.jsp";
		</script>
<% 
		rs.close();
		pstmt.close();
		conn.close();
		
	
	}catch(SQLException e){
		
	}
	
	
%>
	

</body>
</html>