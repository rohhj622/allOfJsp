<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calcelling...</title>
</head>
<body>
<%!
	int penalty =0;
%>
<%
	String mem_id = session.getAttribute("mem_id").toString();

	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		/* 1 */
		/* 현재 페널티 가져오기.  */
		String sql = "select mem_penalty from SkyMusic.member where mem_id = '"+mem_id+"'";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();	
		
		
		if(rs.next()){
			penalty = rs.getInt(1);
		}
		
	}
	catch(SQLException e){
		System.out.println(e);
	}

	String date = request.getParameter("date"); //선택한 날짜 
	String acd_no = request.getParameter("acd_no"); // 선택한 날짜 시간에 연습실 번호 
	String acd_startTime = request.getParameter("acd_startTime"); // 그 시작 시간 
	
	//System.out.println(acd_no);
	Calendar cal = Calendar.getInstance();
	Date now = new Date();

	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf2 = new SimpleDateFormat("HH:mm:ss");

	/* 페널티 처리를 위한 날짜 설정  */
	cal.setTime(new Date());
	cal.add(Calendar.DATE, 7);	
 
	String pDate = sf.format(cal.getTime()); //혹시나 페널티받을 차례라면 이때 까지 예약못하게 할 날짜 
    
    cal.add(Calendar.DATE, -7); //다시 되돌리기.
    Date mem_pDate  = sf.parse(pDate);
    
    java.sql.Date sqlDate = new java.sql.Date(mem_pDate.getTime() );

	
	/* 
		취소하기
		1. 오늘날짜가 취소하려는 날짜 인지 확인하기. // 맞으면 패널티 +1 , 아니면 그대로 
		2. 취소 유무 물어보고 한다하면 내역에서 지우기 & 패널티 처리하기.
		
	*/
	
	
	
	/* 1 */
	/* 이미 지나간 시간대 선택  */
	Date a = sf2.parse(acd_startTime); // 예약한 시간 
	Date b = sf2.parse(sf2.format(now)); // 현재 시간 
	
	if(a.getTime()-b.getTime()<0 && date.equals(sf.format(now))){	
%>
		<script>
			alert("이미 지나간 시간입니다.");
			location.href="user02.jsp";
		</script>
<% 		
	}
	
	boolean okP = false; // true -> penalty-1
	
	if(date.equals(sf.format(now))){
		okP = true; //페널티 받지만 취소할거.
%>
		<script>
			var con = confirm("지금 취소하시면 페널티 1점이 추가됩니다.\n 진행하시겠습니까? (현재 패널티 : "+<%=penalty%>+" 점)");
			
			if(con==false){
				location.href="user02.jsp";				
			}
		</script>
		
<% }
	else{
%>	
		<script>				
				var con = confirm("취소하시겠습니까?");
				
				if(con==false){
					location.href="user02.jsp";				
				}
				
		</script>
<%	
	}
	
	/* 2 */
	//본격 지우기 시작.
	boolean pStart = false; // 페널티 받기 시작하는지 알려줌. false면 안받아.
	try{
		/* 일단 지움. */
		String sql1 = "delete from SkyMusic.reservation where mem_id = '"+mem_id+"' and res_date='"+date+"' and acd_no='"+acd_no+"'";
		pstmt = conn.prepareStatement(sql1);	
		pstmt.executeUpdate(sql1);	
		
		/* 당일 취소로, 페널티 점수 1점 추가. */		
		if(true == okP){
			String sql2 = "update SkyMusic.member set mem_penalty = mem_penalty+1 where mem_id= '"+mem_id+"' ";
			pstmt = conn.prepareStatement(sql2);			
			pstmt.executeUpdate(sql2);	
			
			/* 업뎃 된 페널티 가져오기  */
			String sql3 = "select mem_penalty from SkyMusic.member where mem_id= '"+mem_id+"' ";
			pstmt = conn.prepareStatement(sql3);	
			rs = pstmt.executeQuery(sql3);	
			if(rs.next()){
				penalty = rs.getInt(1);
			}
			System.out.println("업뎃 . "+penalty);
			
			if( penalty == 5 ){
				/* 업뎃된 페널티가 5점이면, 현재날짜 +7 한 date를 mem_pDate에 넣기. mem_accP에 페널티값 넣고, 현재 페널티는 0으로 변경. */
				
				System.out.println("들으어옴. "+penalty);
				 
				String sql4 = "update SkyMusic.member set mem_pDate = '"+pDate+"' where mem_id= '"+ mem_id +"' ";				
				pstmt = conn.prepareStatement(sql4);			
				pstmt.executeUpdate(sql4);	
				
				sql4 = "update SkyMusic.member set mem_accP = mem_accP + 5 where mem_id= '"+ mem_id +"' ";				
				pstmt = conn.prepareStatement(sql4);				
				pstmt.executeUpdate(sql4);			

				sql4 = "update SkyMusic.member set mem_penalty = 0 where mem_id= '"+ mem_id +"' ";				
				pstmt = conn.prepareStatement(sql4);	
				pstmt.executeUpdate(sql4);	
				
				pStart = true;
				
			}
			
		}

		rs.close();
		pstmt.close();
		conn.close();
		
		/* pStart가 true 라면 이제부터 페널티를 받기 시작한 사람. */
		System.out.println("과염 " +pStart);
		if(pStart == false){
%>
			<script>
				alert("취소되었습니다.(현재 패널티 : "+<%=penalty%>+" 점)");
				location.href="user02.jsp";
			</script>    
<% 				
		}
		else{
%>
			<script>
				alert("취소되었습니다.\n 현재 패널티 : "+<%=penalty%>+"점 으로"+<%=pDate%>+" 까지 예약하실 수 없습니다.");
				location.href="user02.jsp";
			</script>    
<% 				
		}
		
	}
	catch(SQLException e){
		System.out.println("chkRes:"+e);
	}
	
	
%>


	
	

</body>
</html>