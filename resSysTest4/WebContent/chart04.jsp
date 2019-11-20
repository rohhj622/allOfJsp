<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
  <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
  </head>
  <body>
  <%
  	int a=0;int b=0;int c=0;int d=0;int e=0;int f=0;int g=0;int h=0;int i=0; int j=0;int k=0;int l=0;int m = 0; 
  	//주말 시간 
  	int n=0; int o=0;int p=0;int q=0; //평일 시작 시간 (18,19,20,21)
  
  	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	//Map<String, String> result = new HashMap<String, String>();
	conn = DriverManager.getConnection(url,id,pass);
	
	try{
		/* 기타 평일 시간 */
		String sql  = "select acd_no ,count(*), acd_startTime"+
					" from SkyMusic.reservation natural join SkyMusic.academy "+
					"where SkyMusic.academy.acd_no like 'G_d%' group by acd_no order by 1";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String str = rs.getString("acd_startTime").substring(0, 2);
			System.out.println(str);
			
			if(str.equals("18")){
				n = rs.getInt("count(*)");
			}else if(str.equals("19")){
				o = rs.getInt("count(*)");
			}
			else if(str.equals("20")){
				p = rs.getInt("count(*)");
			}
			else if(str.equals("21")){
				q = rs.getInt("count(*)");
			}
		}
		
		/*  드럼 주말 시간  */
		String sql2  = "select acd_no ,count(*), acd_startTime"+
				" from SkyMusic.reservation natural join SkyMusic.academy "+
				"where SkyMusic.academy.acd_no like 'G_w%' group by acd_no order by 1";
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery(sql2);
		
		while(rs.next()){
			String str = rs.getString("acd_startTime").substring(0, 2);
			System.out.println(str);
			
			if(str.equals("9")){
				a = rs.getInt("count(*)");
			}else if(str.equals("10")){
				b = rs.getInt("count(*)");
			}
			else if(str.equals("11")){
				c = rs.getInt("count(*)");
			}
			else if(str.equals("12")){
				d = rs.getInt("count(*)");
			}
			else if(str.equals("13")){
				e = rs.getInt("count(*)");
			}
			else if(str.equals("14")){
				f = rs.getInt("count(*)");
			}
			else if(str.equals("15")){
				g = rs.getInt("count(*)");
			}
			else if(str.equals("16")){
				h = rs.getInt("count(*)");
			}
			else if(str.equals("17")){
				i = rs.getInt("count(*)");
			}
			else if(str.equals("18")){
				j = rs.getInt("count(*)");
			}
			else if(str.equals("19")){
				k = rs.getInt("count(*)");
			}
			else if(str.equals("20")){
				l = rs.getInt("count(*)");
			}
			else if(str.equals("21")){
				m = rs.getInt("count(*)");
			}
			
		}
		
		
	}
	catch(SQLException ex){
		System.out.println(ex);
	}finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
  %>
   	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Time', '평일', '주말'],
          ['9',  <%=a%>,      0],
          ['10',  <%=b%>,     0],
          ['11',  <%=c%>,     0],
          ['12',  <%=d%>,     0],
          ['13',  <%=e%>,     0],
          ['14',  <%=f%>,     0],
          ['15',  <%=g%>,     0],
          ['16',  <%=h%>,     0],
          ['17',  <%=i%>,     0],
          ['18',  <%=j%>,     <%=n%>],
          ['19',  <%=k%>,     <%=o%>],
          ['20',  <%=l%>,     <%=p%>],
          ['21',  <%=m%>,     <%=q%>],
          ['22',  0,    0]
          
        ]);

        var options = {
          title: '시간별 사용량 차트 [기타]',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
    <div id="curve_chart" style="width:700px; height: 300px"></div>
  </body>
</html>
