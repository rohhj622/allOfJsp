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
	
	/* nowD */
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	
	Date nowD = sf.parse(sf.format(now)); /* 오늘 날 */
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
			//System.out.println(subR);
			if(subR==0||subR==-1){
				/* 페널티 걸린 날짜 지워주기  */
				
				String sql1 = "update SkyMusic.member set mem_pDate=null where mem_id='"+mem_id+"'";
				pstmt = conn.prepareStatement(sql1);
				pstmt.executeUpdate(sql1);
			}else{
				/* 나머지는 그냥 진행 */
				continue;
			}
			
		}
		
		String sql1 = "select mem_id,mem_pw from SkyMusic.member where mem_id='"+mem_id+"'";
		pstmt = conn.prepareStatement(sql1);
		rs = pstmt.executeQuery(sql1);
		
		/* 결과 나온거 있지?  */
		if(rs.next()){
			/* 아이디 비번 같냐?  */
			if(mem_id.equals(rs.getString("mem_id"))&& mem_pw.equals(rs.getString("mem_pw"))){
				/* 비번도 아이디도 다 맞으면 로그인  */
				if(mem_id.equals("admin")){
					session.setAttribute("mem_id", mem_id);
					%>
						<script type="text/javascript">
							location.href="../page/admin01.jsp";
						</script>
					<%
				}else if(mem_id.equals("teacher")||mem_id.equals("box")||mem_id.equals("tea1")){
					session.setAttribute("mem_id", mem_id);
					%>
						<script type="text/javascript">
							location.href="../page/teacher01.jsp";
						</script>
					<%
				}
				else{
					session.setAttribute("mem_id", mem_id);
					%>
						<script type="text/javascript">
							location.href="../page/user01.jsp";
						</script>
					<% 		
				}
				
			}else{
				/* 아디비번다름  */
				%>
				<script type="text/javascript">
					alert("아이디 또는 비밀번호가 틀렸습니다.");
					location.href="../login.jsp";
				</script>
				<% 
			}
		}else{
			/* 아이디 조차 없음   */
			%>
				<script type="text/javascript">
					alert("등록되지않은 아이디입니다.");
					location.href="../login.jsp";
				</script>
			<% 
		}
		
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		
	}
	catch(SQLException e){
		System.err.println(e);
	}

	
%>


</body>
</html>