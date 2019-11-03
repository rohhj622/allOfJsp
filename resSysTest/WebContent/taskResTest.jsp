<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String mem_id = "rohhj622";
	
	String instrument = request.getParameter("instrument");
	String date = request.getParameter("date");
	String isWeek = request.getParameter("isWeek");
	String text = request.getParameter("text").substring(0, 4);
	
	boolean isdone = false;
	
	String state = "using";
	
	System.out.println(date+instrument+text);
	
	
	int i = 0;
		
	
	request.setCharacterEncoding("utf8"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql0 = "select mem_penalty from SkyMusic.member where mem_id='"+mem_id+"'";
		PreparedStatement pstmt0 =  conn.prepareStatement(sql0);
		ResultSet rs = pstmt0.executeQuery(sql0);
		
		if(rs.next()){}
		if(rs.getInt(1) == 5){
%>
			<script type="text/javascript">
				alert("페널티 5점으로 예약이 불가합니다. ");
			</script>	
<%	
		response.sendRedirect("reserve.jsp");
			
		}else{
			String sql = "SELECT * from SkyMusic.reservation where mem_id='"+mem_id+"' and res_date='"+date+"'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				i++;
			}
			
			if(i>=2){ //이용횟수 확인 
				System.out.println("여기 1");
	%>		
				<script>
					alert('하루 이용횟수를 초과하셨습니다. ');
				</script>
	<%
				response.sendRedirect("reserve.jsp");
				System.out.println("여기 2");
			}else{
				String sql1 = "SELECT * from SkyMusic.reservation where res_date='"+date+"' and acd_no='"+text+"' and mem_id='"+mem_id+"'";
				PreparedStatement pstmt1 = conn.prepareStatement(sql1);
				rs = pstmt1.executeQuery(sql1);
				
				
				if(rs.next()){ 
					
				}
				
				if( rs.getString(1) == null){ //이미 예약한건지 확인 
					
					String sql2 = "select count(*) from SkyMusic.reservation where res_date='"+date+"' and acd_no='"+text+"'"; // 연습실 다찼는가? 
					
					//String sql2 = "insert into SkyMusic.reservation values('"+mem_id+"','"+text+"','"+date+"','"+state+"',(select a.res_count-1 from SkyMusic.reservation a where a.res_date='"+date+"' and a.acd_no='"+text+"'))";
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					rs = pstmt2.executeQuery(sql2);	
					
					int count = -1;
					
					if(rs.next()){
						count = rs.getInt(1);
					}
					System.out.println("여기 3");
					if(count != -1 && count == 0){ // 예약 하나도 안됨 
						String sql3 = "insert into SkyMusic.reservation values('"+mem_id+"','"+text+"','"+date+"','"+state+"',2)";
						PreparedStatement pstmt3 = conn.prepareStatement(sql3);
						pstmt2.executeUpdate(sql3);
						
						System.out.println("없어서 만듦 ");
						
						String sql301 = "update SkyMusic.reservation set res_count = res_count-1 where res_date='"+date+"' and acd_no='"+text+"'";
						PreparedStatement pstmt301 = conn.prepareStatement(sql301);
						pstmt2.executeUpdate(sql301);
						
						System.out.println("추가도 함 ");
						
					}else if(count ==1) //예약 한개는 되있더라.
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
					response.sendRedirect("reserve.jsp");
					
				}else{
		%>		
					<script>
						alert('이미 예약한 시간입니다. ');
					</script>

	    <% 	
	    			response.sendRedirect("reserve.jsp");
				}
				
			}
		}

	}catch(SQLException e){
		System.out.println("1-"+e);
	}
	
	
	

%>
	
</body>
</html>