<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>res Processing...</title>
</head>
<body>
<%
	String mem_id = session.getAttribute("mem_id").toString();
	
	String instrument = request.getParameter("instrument");
	String date = request.getParameter("date");
	String isWeek = request.getParameter("isWeek");
	String text = request.getParameter("text").substring(0, 4);
	
	String state = "using";
	
	System.out.println(text);

	
	int i = 0;
		

	request.setCharacterEncoding("utf8"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "SELECT * from SkyMusic.reservation where mem_id='"+mem_id+"' and res_date='"+date+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()){
			i++;
		}
		
		if(i>=2){
			System.out.println("여기 1");
%>		
			<script>
				alert('하루 이용횟수를 초과하셨습니다. ');
				history.go(-1);
			</script>

<% 		
			System.out.println("여기 2");
		}else{
			System.out.println("여기 3");
			String sql2 = "select count(*) from SkyMusic.reservation where res_date='"+date+"' and acd_no='"+text+"'";
			
			//String sql2 = "insert into SkyMusic.reservation values('"+mem_id+"','"+text+"','"+date+"','"+state+"',(select a.res_count-1 from SkyMusic.reservation a where a.res_date='"+date+"' and a.acd_no='"+text+"'))";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			rs = pstmt2.executeQuery(sql2);	
			
			int count = -1;
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			if(count != -1 && count == 0){
				String sql3 = "insert into SkyMusic.reservation values('"+mem_id+"','"+text+"','"+date+"','"+state+"',2)";
				PreparedStatement pstmt3 = conn.prepareStatement(sql3);
				pstmt2.executeUpdate(sql3);
				
				System.out.println("없어서 만듦 ");
				
				String sql301 = "update SkyMusic.reservation set res_count = res_count-1 where res_date='"+date+"' and acd_no='"+text+"'";
				PreparedStatement pstmt301 = conn.prepareStatement(sql301);
				pstmt2.executeUpdate(sql301);
				
				System.out.println("추가도 함 ");
				
			}else if(count ==1)
			{
				String sql4 = "insert into SkyMusic.reservation values('"+mem_id+"','"+text+"','"+date+"','"+state+"',(select a.res_count-1 from SkyMusic.reservation a where a.res_date='"+date+"' and a.acd_no='"+text+"'));";
				PreparedStatement pstmt4 = conn.prepareStatement(sql4);
				pstmt2.executeUpdate(sql4);
				
				System.out.println(" 있길래 추가만 함  ");
			}
			
%>
			<script>
				alert('예약되셨습니다.');
			</script>
<% 
		}

	/* 	while(rs.next()){
			String res_id = rs.getString("res_id");
			String res_acdNo = rs.getString("res_acdNo");
			String res_date = rs.getString("res_date");
			String res_state = rs.getString("res_state"); 
		}*/

		pstmt.close();
		pstmt.close();
		conn.close();

		
	}catch(SQLException e){
		out.println(e.toString());
	}

%>
	
	
</body>
</html>