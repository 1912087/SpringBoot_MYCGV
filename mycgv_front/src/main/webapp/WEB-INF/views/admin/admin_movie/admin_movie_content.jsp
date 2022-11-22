<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/css/mycgv.css">
	<style>
		.background{
			position : fixed;
			top : 0;
			left : 0;
			width : 100%;
			height : 100vh;
			background-color : rgba(0, 0, 0, 0.3);
			z-index : -1;
			opacity : 0;
		}
		.window {
			position : relative;
			width : 100%;
			height : 100%;
		}
		.popup {
			position : absolute;
			top : 50%;
			left : 50%;
			transform : translate(-50%, -30%);
			width : 500px;
			height : 400px;
			background-color : white;
			border-radius : 15px;
			z-index : -1;
		}
		.show {
			opacity : 1;
			z-index : 10;
			transition : all 0.5s;
		}
		.show .popup{
			transform : translate(-50%, -50%);
			z-index : 10;
			transition : all 0.5s;
		}
	</style>
	<script src = "http://localhost:9000/js/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#openDelete").click(function(){
				$(".background").addClass("show");
				$(".window").addClass("show");
			});
			$("#close").click(function(){
				$(".background").removeClass("show");
				$(".window").removeClass("show");
			});
		});
	</script>
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:9000/header" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>영화 상세 정보</h1>
		<table class="boardContent">	
			<tr>				
				<th>등록날짜</th>
				<td>${ vo.mdate }</td>
				<th>장르</th>
				<td>${ vo.mcategory }</td>
			</tr>		
			<tr>				
				<th>제목</th>
				<td colspan="3">${ vo.mname }</td>
			</tr>
			<tr>				
				<th>내용</th>
				<td colspan="3">${ vo.mdesc }<br><br>
				<c:if test = "${ vo.msfile1 != null }">
					<img src = "http://localhost:9000/upload/${ vo.msfile1 }" width = "50%">
				</c:if><br>
				<c:if test = "${ vo.msfile2 != null }">
					<img src = "http://localhost:9000/upload/${ vo.msfile2 }" width = "50%">
				</c:if><br>
				<br><br></td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="/admin_movie_update/${ vo.mid }/${rpage}"><button type="button" class="btn_style">수정하기</button></a>
					<button type="button" class="btn_style" id = "openDelete">삭제하기</button>
					<a href="/admin_movie_list/${ rpage }">
						<button type="button" class="btn_style">리스트</button></a>
					<a href="http://localhost:9000/admin"><button type="button" class="btn_style">관리자홈</button></a>
				</td>
			</tr>			
		</table>	
	</div>
	
	<div class = "background">
		<div class = "window">
			<div class = "popup">
				<form name="boardDeleteForm" action="/admin_movie_delete" method="post"
					style = "margin : 0; padding : 0; width : 100%; height : 100%">
					<input type = "hidden" name = "mid" value = "${ vo.mid }">
					<input type = "hidden" name = "msfile1" value = "${ vo.msfile1 }">
					<input type = "hidden" name = "msfile2" value = "${ vo.msfile2 }">
					<input type = "hidden" name = "fie" value = "${ vo.fid }">
					<ul style = "margin : 0; padding : 0; width : 100%; height : 100%; border : none;">
						<li style = "padding-top : 50px;">
							<img src="http://localhost:9000/images/delete.jpg"> <!-- 휴지통 이미지 -->					
						</li>				
						<li>
							<div>정말로 삭제하시겠습니까?</div>
						</li>
						<li>
							<button type="submit" class="btn_style">삭제완료</button>					
							<button type="button" class="btn_style" id = "close">창닫기</button>
							<a href="/admin_movie_list/${ rpage }"><button type="button" class="btn_style">리스트</button></a>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<!-- footer Include -->
	<iframe src="http://localhost:9000/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>




