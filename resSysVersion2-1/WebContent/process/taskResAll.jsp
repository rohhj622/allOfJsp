<%@page import="java.util.ArrayList"%>
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
	request.setCharacterEncoding("utf8"); 
	//System.out.println(month);
	
	String inst = null;
	int chkID=0; // admin ==> 0
	String mem_id = session.getAttribute("mem_id").toString();

	String date = request.getParameter("date"); // 날짜
	
	String placeNo=request.getParameter("placeNo"); // 몇 호 점
	String instrumentT = request.getParameter("instrumentT"); // 악기
	String startT = request.getParameter("startT"); //시작 시간
	String endT = request.getParameter("endT"); //끝나는 시간
	
/* 	int dfl = Integer.parseInt(endT)-1;
	endT = Integer.toString(dfl);
	 */
	//System.out.println("taskRes var = "+mem_id+","+date+","+instrumentT+","+startT);
	//System.out.println(endT);
	
	startT=startT+":00:00";
	endT=endT+":00:00";
	
	int acdCnt=0; // 연습실 개수
	

	if (placeNo.equals("1")){
		switch (instrumentT){
			case "Drum":
				acdCnt=2;
				break;
			case "Guitar&Bass":
				acdCnt=1;
				break;
			case "Piano&Vocal":
				acdCnt=3;
				break;
		}
	}else{
		switch (instrumentT){
			case "Drum":
				acdCnt=3;
				break;
			case "Guitar&Bass":
				acdCnt=1;
				break;
			case "Piano&Vocal":
				acdCnt=4;
				break;
		}
	}
	
	System.out.println(instrumentT);
	System.out.println("연습실 수"+acdCnt);
	
	/*  
		0. 시작 시간, 끝나는 시간 이용해서 예약
		1. academy table에서 일단 그 악기에 마즌 ㄴ거 
	*/
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	String sql1=null;

	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql0 = "select mem_instrument from SkyMusic.member where mem_id='"+mem_id+"'";
		//System.out.println(mem_id);
		
		PreparedStatement pstmt = conn.prepareStatement(sql0);
		ResultSet rs = pstmt.executeQuery(sql0);
		
		if(rs.next()){
			inst=rs.getString("mem_instrument");
		}
		
		if(inst.equals("drum")){
			chkID=1;
		}
		if(inst.equals("bass")||inst.equals("guitar")){
			inst="guitar&bass";
			chkID=1;
		}
		
		if(inst.equals("piano")||inst.equals("vocal")){
			inst="piano&vocal";
			chkID=1;
		}	
		
		
		if(placeNo.equals("1")){
			sql1 = "select * from SkyMusic.academy where acd_no like '%_a%' and acd_name='"+instrumentT
					+"' and acd_startTime between '"+startT+"' and (select acd_startTime from SkyMusic.academy where acd_endTime='"+endT+"' limit 1)";
		}else if(placeNo.equals("2")){
			sql1 = "select * from SkyMusic.academy where acd_no like '%_b%' and acd_name='"+instrumentT
					+"' and acd_startTime between '"+startT+"' and (select acd_startTime from SkyMusic.academy where acd_endTime='"+endT+"' limit 1)";
		}
		
		System.out.println(sql1);
		/* 1 */ 
		
		pstmt = conn.prepareStatement(sql1);
		rs = pstmt.executeQuery(sql1);	

		ArrayList<String> al = new ArrayList<String>();
		ArrayList<String> al2 = new ArrayList<String>(); /* 겹치는거 걸러짐 */
		
		
		/* 해당하는 acd_no arrayList에 add */
		while(rs.next()){
		        al.add(rs.getString("acd_no"));
		}
		System.out.println("1");
		/* 연습실 다 차서 겹치는거 있는지 확인. */
		for(int i =0; i<al.size(); i++) {
			String acd_no1 = al.get(i);
			
			String sql2="select count(*) as countAcd from SkyMusic.reservation where acd_no='"+acd_no1+"' and res_date='"+date+"'";
			rs = pstmt.executeQuery(sql2);
			System.out.println(sql2+"// "+acd_no1);
			
			if(rs.next()){
				if(rs.getInt("countAcd")==acdCnt){
					System.out.println("겹쳐.");
				}else{
					al2.add(acd_no1);
				}
			}
		}
		/* 관리자가 예약한 것 있는지 */
		al.clear();
		
		for(int i =0; i<al2.size(); i++) {
			String acd_no1 = al2.get(i);
			
			String sql2="select count(*) as countId from SkyMusic.reservation where acd_no='"+acd_no1+"' and res_date='"+date+"' and mem_id='"+mem_id+"'";
			rs = pstmt.executeQuery(sql2);
			System.out.println(sql2+"// "+acd_no1);
			
			if(rs.next()){
				if(rs.getInt("countId")==1){
					System.out.println("겹쳐."+al2.get(i));
				}else{
					al.add(acd_no1);
				}
			}
		}
		System.out.println("2");
		
		for(int j=0; j<al.size(); j++){
			System.out.println("3");
			String acd_no2 = al.get(j);
			System.out.println(acd_no2);
			
			String sql3 = "insert into SkyMusic.reservation value('"+mem_id+"','"+acd_no2+"','"+date+"','using','"+placeNo+"')";
			pstmt = conn.prepareStatement(sql3);
			pstmt.executeUpdate(sql3);	
			
		}
		
		System.out.println("4");
		
		rs.close();
		pstmt.close();
		conn.close();
			
			
	%>
			<script>
				alert("예약되었습니다.");
				if(<%=chkID%>==0){
					location.href="../page/admin00.jsp";				
				}else{
					location.href="../page/teacher01.jsp";
				}
			</script>
	<% 
			

	
	}catch(SQLException e){
		System.out.println("여기"+e);
	}
	
	%>
	

</body>
</html>