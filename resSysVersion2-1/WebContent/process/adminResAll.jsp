<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function chk() {
		var r = confirm("예약 하시겠습니까?");
		
		return r;
	}
</script>
</head>
<body>
<%!
	
	Boolean isPast = false; // 과거인가?
	String instrument; //사람악기 
	String mem_id;// 그사람 아이디 
	String year;//선택한 년 
	String month;// 선택한 월 
	String day;//선택한 
%>
<%
	//String placeNo="1"; // 건물 번호
	/* 
		0. 지난 날짜인지 확인하기.
		1. 선택한 날짜가 주말인지 평일인지 알아내기.  sql
		2. 그 사람의 악기가 무엇인지 알아내기.  sql2
		3. 그 악기와 날짜에 맞춰서 연습실 보여주기. sql3
	*/
	
	mem_id = session.getAttribute("mem_id").toString();
	year = request.getParameter("y");
	month = request.getParameter("m");
	
	if(month!=null && Integer.parseInt(month)<10){
		month = "0" +month;
	}
	
	//System.out.println(month);
	
	day = request.getParameter("day");
	
	if(day ==null){
		return;
	}else if(day!=null && Integer.parseInt(day)<10){
		day = "0" +day;
	}
	
	String date = year+"-"+ month+"-"+day;

%>
	<p ><%=year %>년 <%=month %>월 <%=day %>일</p>

	<form action="../process/taskResAll.jsp" method="post" onSubmit="return chk()">
		<select name="placeNo">
			<option value="1">1호점</option>
			<option value="2">2호점</option>
		</select>
		<select name="instrumentT">
			<option value="Drum">드럼</option>
			<option value="Guitar&Bass">기타/베이스</option>
			<option value="Piano&Vocal">피아노/보컬</option>
		</select>
		<select name="startT">
			<option value="9">9시</option>
			<option value="10">10시</option>
			<option value="11">11시</option>
			<option value="12">12시</option>
			<option value="13">13시</option>
			<option value="14">14시</option>
			<option value="15">15시</option>
			<option value="16">16시</option>
			<option value="17">17시</option>
			<option value="18">18시</option>
			<option value="19">19시</option>
			<option value="20">20시</option>
			<option value="21">21시</option>
		</select>
		~
		<select name="endT">
			<option value="10">10시</option>
			<option value="11">11시</option>
			<option value="12">12시</option>
			<option value="13">13시</option>
			<option value="14">14시</option>
			<option value="15">15시</option>
			<option value="16">16시</option>
			<option value="17">17시</option>
			<option value="18">18시</option>
			<option value="19">19시</option>
			<option value="20">20시</option>
			<option value="21">21시</option>
			<option value="22">22시</option>
		</select>
		<input type="hidden" name="date" value="<%=date %>">
		<input type="submit" value="예약하기">
	</form>
</body>
</html>