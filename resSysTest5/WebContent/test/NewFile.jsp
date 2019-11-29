<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - Chart</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js"></script>
</head>
<body>
<%
	int mon=0;
	int tue=0;
	int wed=0;
	int thu=0;
	int fri=0;
	int sat=0;
	int sun=0;
	


	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	
	try{
		conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "select res_date from SkyMusic.reservation group by res_date order by count(*)";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery(sql);
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sf2 = new SimpleDateFormat("E");

		
		while(rs.next()){
			String str = rs.getString("res_date");
			//System.out.println(str);
			
			Date date = sf.parse(str); // 선택한 날짜 
			String day = sf2.format(date);
			
			/* System.out.println(day);
			System.out.println(date); */
			switch(day){
				case "Mon":
					System.out.println(day);
					mon++;
					break;
				case "Tue":
					System.out.println(day);
					tue++;
					break;
				case "Wed":
					System.out.println(day);
					wed++;
					break;
				case "Thu":
					System.out.println(day);
					thu++;
					break;
				case "Fri":
					System.out.println(day);
					fri++;
					break;
				case "Sat":
					System.out.println(day);
					sat++;
					break;
				case "Sun":
					System.out.println(day);
					sun++;
					break;
			}
		}
		
	}catch(SQLException e){
		System.out.println(e);
	}finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
	
	
	
%>


<!-- width="400" height="400" -->

<canvas id="myChart" width="30" height="10"></canvas>
<script>
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        datasets: [{
            label: '일별 예약',
            data: [<%=mon%>,<%=tue%>,<%=wed%>,<%=thu%>,<%=fri%>,<%=sat%>,<%=sun%>],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 0, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 0, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
</body>
</html>