<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/css/mycgv.css">
<script src="http://localhost:9000/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/js/mycgv_jquery.js"></script>
<script src="http://localhost:9000/js/mycgv_login.js"></script>
<script>
	$(document).ready(function(){
		let login = "${ login_result }";
		if(login == "fail"){
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		let join = "${ join_result }";
		if(join == "ok"){
			alert("회원가입 성공!");
		}
		
		let auth_result = "${auth}";
		if(auth_result == "fail"){
			alert("유효하지 않은 접근입니다. 다시 로그인해주세요");
		}
		
		if($("li.remember_login input").prop("checked")){
			$("li.remember_login label:before").
		}
	});
</script>
</head>
<body>
	<!-- Header Include -->
	<iframe src="/header" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
	 <h1>Login</h1>
		<form name="loginForm" action="/login" method="post">
		<ul>
			<li>
				<label>아이디</label>
				<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
			</li>
			<li>
				<label>패스워드</label>
				<input type="password" name="pass" id="pass">
			</li>
			<!-- <li class = "remember_login">
				<div>
					<label style = "visibility:hidden;">none</label>
					<input type="checkbox" name="remember-me" id = "remember-me">
					<label for = "remember-me">로그인 유지</label>
				</div>
			</li> -->
			<li>
				<button type="button" id="btnLogin">로그인</button>
				<button type="reset">다시쓰기</button>
			</li>
		</ul>
		</form>
	</div>
	
	<!-- footer Include -->
	<iframe src="/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







