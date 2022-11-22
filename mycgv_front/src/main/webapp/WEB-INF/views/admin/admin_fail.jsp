<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/css/mycgv.css">
<style>
	div.admin_fail button {
		background: #ff833a;
	    color: white;
	    border: none;
	    padding: 10px;
	    font-weight: bold;
	    cursor: pointer;
	}
</style>
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:9000/header" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<div style = "text-align: center; padding: 80px 0 0 0;">
			<div>
				<img src = "http://localhost:9000/images/no-results.png" width = "300px">
			</div>
			<div class = "admin_fail">
				<h3 style = "font-size: 25px; letter-spacing: -0.08rem;">관리자 권한이 없습니다.</h3>
				<p style = "margin-bottom: 35px;">관리자 계정으로 로그인 후 다시 접근해주세요.</p>
				<a href = "/index"><button type = "button">홈으로 돌아가기</button></a>
			</div>
		</div>
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>





