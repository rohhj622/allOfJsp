
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width initial-scale=1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

<!-- 부트스트랩 JS  -->
<script src="js/bootstrap.js"></script>

<title>365CHRISTMAS</title>  
</head>

<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Courgette|Indie+Flower|Mountains+of+Christmas&display=swap');
/* font-family: 'Mountains of Christmas', cursive;
font-family: 'Indie Flower', cursive;
font-family: 'Courgette', cursive; */


/*Simple reset*/
* {margin: 0; padding: 0;}
input{
	align-self: center;
}

body {
	/*You can use any kind of background here.*/
	/* background-image: url("http://cinnabar.com/wp-content/uploads/2013/03/Santa-2.jpg") ; */
	background-image: url("https://thegrovela.com/wp-content/uploads/2018/11/GAF_SantaHouse_2880x1920.jpg") ;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
canvas {
	display: block;
}
a{
	text-align: center;
	text-decoration: none;
}
a:link { color: white; text-decoration: none;}
a:visited { color: white; text-decoration: none;}
a:hover { color: white; text-decoration: none;}
p{
	text-align:center;
	font-family: 'Indie Flower', cursive, fantasy;
	font-size: 80px;
	color: white;
	background-color: rgba(255,255,255,0.1);
	text-shadow: 2px 2px 2px gray;
}
</style>

<script type="text/javascript">
window.onload = function(){
	//canvas init
	var canvas = document.getElementById("canvas");
	var ctx = canvas.getContext("2d");
	
	//canvas dimensions
	var W = window.innerWidth;
	var H = window.innerHeight;
	canvas.width = W;
	canvas.height = H;
	
	//snowflake particles
	var mp = 25; //max particles
	var particles = [];
	for(var i = 0; i < mp; i++)
	{
		particles.push({
			x: Math.random()*W, //x-coordinate
			y: Math.random()*H, //y-coordinate
			r: Math.random()*4+1, //radius
			d: Math.random()*mp //density
		})
	}
	
	//Lets draw the flakes
	function draw()
	{
		ctx.clearRect(0, 0, W, H);
		
		ctx.fillStyle = "rgba(255, 255, 255, 0.8)";
		ctx.beginPath();
		for(var i = 0; i < mp; i++)
		{
			var p = particles[i];
			ctx.moveTo(p.x, p.y);
			ctx.arc(p.x, p.y, p.r, 0, Math.PI*2, true);
		}
		ctx.fill();
		update();
	}
	
	//Function to move the snowflakes
	//angle will be an ongoing incremental flag. Sin and Cos functions will be applied to it to create vertical and horizontal movements of the flakes
	var angle = 0;
	function update()
	{
		angle += 0.01;
		for(var i = 0; i < mp; i++)
		{
			var p = particles[i];
			//Updating X and Y coordinates
			//We will add 1 to the cos function to prevent negative values which will lead flakes to move upwards
			//Every particle has its own density which can be used to make the downward movement different for each flake
			//Lets make it more random by adding in the radius
			p.y += Math.cos(angle+p.d) + 1 + p.r/2;
			p.x += Math.sin(angle) * 2;
			
			//Sending flakes back from the top when it exits
			//Lets make it a bit more organic and let flakes enter from the left and right also.
			if(p.x > W+5 || p.x < -5 || p.y > H)
			{
				if(i%3 > 0) //66.67% of the flakes
				{
					particles[i] = {x: Math.random()*W, y: -10, r: p.r, d: p.d};
				}
				else
				{
					//If the flake is exitting from the right
					if(Math.sin(angle) > 0)
					{
						//Enter from the left
						particles[i] = {x: -5, y: Math.random()*H, r: p.r, d: p.d};
					}
					else
					{
						//Enter from the right
						particles[i] = {x: W+5, y: Math.random()*H, r: p.r, d: p.d};
					}
				}
			}
		}
	}
	
	//animation loop
	setInterval(draw, 20);
}
</script>
<body>
	<div style="position:relative;"  >
		<p><a href="main.jsp">️️Merry Christmas️️</a></p>
		<center>
			<a style="color: white;" href="write.jsp">
				이번년도 크리스마스에 있었던 일 작성하러가기 -->
			</a>
		</center>
		
	</div>
	<div style="position:relative;">
		<canvas id="canvas"></canvas>
	</div>
	<jsp:include page="playMusic.jsp"></jsp:include>
</body>
</html>