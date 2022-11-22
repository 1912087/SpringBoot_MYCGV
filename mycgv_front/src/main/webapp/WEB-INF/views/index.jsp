<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/css/mycgv.css">
<script src = "http://localhost:9000/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		let login = '${ login_result}';
		if(login == "ok"){
			alert("로그인 성공");
		}
	});
</script>
</head>
<body>
	<!-- Header Include -->
	<!-- src에도 header.jsp가 아니라 매핑 aliases를 사용하여야 함 -->
	<!-- 같은 위치에 있어 http://를 쓰지않고도 바로 호출 가능 -->
	<!-- 실제로 작성한 코드 및 주소를 보지 못하도록 보안을 걸어놓는 효과가 있음 -->
	<iframe src="/header" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	<style>
		div.s1_article article > div:first-child {
			position : relative;
		}
		div.s1_article article > div:first-child::after {
		    content: "";
		    display: block;
		    width: 100%;
		    height: 50%;
		    background: linear-gradient(to Top, black, transparent);
	        position: absolute;
		    bottom: 4px;
		    border-radius: 10px;
		}
		div.carousel div.movie_video {
			width: 65%;
		    height: inherit;
		    position: absolute;
		    color: white;
		    background: linear-gradient(to right, black, transparent, black);
		    text-align: left;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    line-height: 10px;
		    padding: 10%;
    		box-sizing: border-box;
		}
		div.carousel div.movie_video p:first-child {
		    font-size: 2.3rem;
		    font-weight: bold;
		    text-shadow: 3px 2px 2px black;
		}
		div.carousel div.movie_video p:not(div.movie_video p:first-child) {
	        font-size: 1.25rem;
		    line-height: 0px;
		}
	</style>
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="carousel">
		<div class = "movie_video">
			<p>&#60;탑건:매버릭&#62;</p>
			<p>그들이 돌아왔다</p>
			<p>06월 22일 개봉</p>
		</div>
		<video autoplay muted width = "65%"><source src="/images/top_gun.mp4" type = "video/mp4"></video>
	</div>
	<div class="content">
		<section>
			<h1>무비차트 | 상영예정작</h1>
			<div class="s1_article">
				<c:forEach var = "vo" items = "${ list }">
					<article>
						<div>
							<img src="http://localhost:9000/upload/${ vo.msfile1 }">				
						</div>
						<div>${ vo.mname }</div>
						<div>${ vo.mcategory }  | 예매율 37.1%</div>
					</article>
				</c:forEach>
				<!-- <article>
					<div>
						<img src="http://localhost:9000/images/82120_320.jpg">				
					</div>
					<div>탑건-매버릭</div>
					<div>99%  | 예매율 37.1%</div>
				</article>
				<article>
					<div>
						<img src="http://localhost:9000/images/82120_320.jpg">				
					</div>
					<div>탑건-매버릭</div>
					<div>99%  | 예매율 37.1%</div>
				</article>
				<article>
					<div>
						<img src="http://localhost:9000/images/82120_320.jpg">				
					</div>
					<div>탑건-매버릭</div>
					<div>99%  | 예매율 37.1%</div>
				</article>
				<article>
					<div>
						<img src="http://localhost:9000/images/82120_320.jpg">				
					</div>
					<div>탑건-매버릭</div>
					<div>99%  | 예매율 37.1%</div>
				</article> -->
			</div>
		</section>
		
		<section>
			<h1>특별관</h1>
			<div class="s2_article">
				<div>
					<img src="http://localhost:9000/images/16390080561620.png">
				</div>
				<ul>
					<li>
						<span>SUITE CINEMA</span>
						<span>#호텔 컨셉의 프리미엄관</span>	
					</li>
					<li>
						<span>CINE & LIVINGROOM</span>
						<span>#신개념 소셜 상영관</span>	
					</li>
					<li>
						<span>4DX</span>
						<span>#모션시트 #오감체험</span>	
					</li>
					<li>
						<span>CINE de CHEF</span>
						<span>#쉐프가 있는 영화관</span>	
					</li>
				</ul>
			</div>
		</section>
		
		<section>
			<ul>
				<li>
					<h3>영화관람권</h3>
					<button type="button">더보기</button>
				</li>
				<li>
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
				<li>
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
				<li>
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
			</ul>
			<ul>
				<li>
					<h3>영화관람권</h3>
					<button type="button">더보기</button>
				</li>
				<li >
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
				<li>
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
				<li>
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
			</ul>
			<ul>
				<li>
					<h3>영화관람권</h3>
					<button type="button">더보기</button>
				</li>
				<li >
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
				<li>
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
				<li>
					<img src="http://localhost:9000/images/16094706927780.jpg">
					<div>
						<label>CGV 영화관람권</label>
						<label>12,000원</label>
					</div>
				</li>
			</ul>
		</section>		
	</div>
	
	<!-- footer Include -->
	<iframe src="/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







