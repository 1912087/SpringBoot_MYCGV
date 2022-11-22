<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="http://localhost:9000/css/mycgv.css">
</head>
<body>
	<!---------------------------------------------->
	<!--------------- Header ----------------------->
	<!---------------------------------------------->
	<header>
		<div class="header_contents1">
			<div>
				<a href="http://localhost:9000/index" target="_parent">
					<img src="http://localhost:9000/images/logoRed.png" width="150" height="70"></a>
				<span>CULTURFLEX</span>
			</div>
			<!-- 로그인을 진행하기 전 -->
			<c:choose>
			<c:when test = "${ sessionScope.svo == null }">
			<div>
				<img src="http://localhost:9000/images/hcard.png">
				<a href="/login" target="_parent">
					<img
					src="http://localhost:9000/images/loginPassword.png">
					<span>로그인</span>
				</a> <a href="/join" target="_parent">
					<img
					src="http://localhost:9000/images/loginJoin.png">
					<span>회원가입</span>
				</a> <a href="/mycgv" target="_parent">
					<img
					src="http://localhost:9000/images/loginMember.png">
					<span>MY CGV</span>
				</a> <a href="/board_list"
					target="_parent"> <img
					src="http://localhost:9000/images/loginCustomer.png">
					<span>게시판</span>
				</a> <a href="/notice_list"
					target="_parent"> <img
					src="http://localhost:9000/images/loginCustomer.png">
					<span>공지사항</span>
				</a> 
			</div>
			</c:when>
			
			<%-- 로그인을 진행한 후 --%>
			<c:otherwise>
			<div>
				<img src="http://localhost:9000/images/hcard.png">
				<div>[${ sessionScope.svo.name }]님 안녕하세요</div>
				<a href="/logout" target="_parent" >
					<img src="http://localhost:9000/images/loginPassword.png">
					<span>로그아웃</span>
				</a>
				<a href="/join" target="_parent" >
					<img src="http://localhost:9000/images/loginJoin.png">
					<span>회원가입</span>
				</a>
				<a href="/mycgv" target="_parent">
					<img src="http://localhost:9000/images/loginMember.png">
					<span>MY CGV</span>
				</a>
				<a href="/board_list" target="_parent" >
					<img src="http://localhost:9000/images/loginCustomer.png">
					<span>게시판</span>
				</a>
				<a href="/notice_list" target="_parent" >
					<img src="http://localhost:9000/images/loginCustomer.png">
					<span>공지사항</span>
				</a>
					<c:if test = "${ sessionScope.svo.id == 'admin' }">
					<a href="/admin" target="_parent" >
						<img src="http://localhost:9000/images/loginCustomer.png">
						<span>Admin</span>
					</a>				
					</c:if>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="header_contents2">
			<nav>
				<ul class="dropdown">
					<li>
						<h2><a href="#">영화</a></h2>
						<dl class="dropdown-content">
							<dt><h2>영화</h2></dt>
							<dd><h3>무비차트</h3></dd>
							<dd><h3>아트하우스</h3></dd>
							<dd><h3>ICECON</h3></dd>							
						</dl>				
					</li>
					<li>
						<h2><a href="#">극장</a></h2>
						<dl class="dropdown-content">
							<dt><h2>극장</h2></dt>
							<dd><h3>CGV 극장</h3></dd>
							<dd><h3>특별관</h3></dd>
						</dl>				
					</li>
					<li>
						<h2><a href="#">예매</a></h2>
						<dl class="dropdown-content">
							<dt><h2>예매</h2></dt>
							<dd><h3>빠른예매</h3></dd>
							<dd><h3>상영스케줄</h3></dd>
							<dd><h3>English Ticketing</h3></dd>
							<dd><h3>English Schedule</h3></dd>
						</dl>				
					</li>
					<li>
						<h2><a href="#">스토어</a></h2>
						<dl class="dropdown-content">
							<dt><h2>영화관람권</h2></dt>
							<dd><h3>기프트카드</h3></dd>
							<dd><h3>콤보</h3></dd>
							<dd><h3>팝콘</h3></dd>
							<dd><h3>음료</h3></dd>
							<dd><h3>스낵</h3></dd>
							<dd><h3>플레이존</h3></dd>
						</dl>				
					</li>
					<li>
						<h2><a href="#">이벤트</a></h2>
						<dl class="dropdown-content">
							<dt><h2>이벤트</h2></dt>
							<dd><h3>SPECIAL</h3></dd>
							<dd><h3>영화/예매</h3></dd>
							<dd><h3>멤버십/CLUB</h3></dd>
							<dd><h3>CGV 극장별</h3></dd>	
						</dl>				
					</li>
					<li>
						<h2><a href="#">혜택</a></h2>
						<dl class="dropdown-content">
							<dt><h2>혜택</h2></dt>
							<dd><h3>CGV 할인정보</h3></dd>
							<dd><h3>CLUB 서비스</h3></dd>
							<dd><h3>VIP 라운지</h3></dd>							
						</dl>				
					</li>				
				</ul>
			</nav>		
		</div>	
	</header>
</body>
</html>