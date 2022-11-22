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
<style>
	#upload_file {
		border : 1px solid white;
		position : relative;
		left : 264px;
		height : 15px;
		top : -30px;
		width : 110px;
		display : inline-block;
		background-color : white;
	}
</style>
<script>
	$(document).ready(function(){
		$("input[type=file]").change(function(){
			if(window.FileReader){
				let nfile = $(this)[0].files[0].name;
				$("#upload_file").text(nfile);
			}
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
		<h1>공지사항-수정하기</h1>
		<form name="boardUpdateForm" action="/admin_notice_update" method="post"
				enctype = "multipart/form-data">
			<input type = "hidden" name = "nid" value = "${ vo.nid }">
			<input type = "hidden" name = "file" value = "${ vo.nfile }">
			<input type = "hidden" name = "sfile" value = "${ vo.nsfile }">
			<input type = "hidden" name = "rpage" value = "${ rpage }">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="ntitle" id="ntitle" value="${ vo.ntitle }">
				</li>
				<li>
					<label>내용</label>
					<textarea name="ncontent">${ vo.ncontent }</textarea>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1">
					<span id = "upload_file">${ vo.nsfile }</span>
				</li>
				<li>
					<button type="button" class="btn_style" id="btnNoticeUpdate">수정완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="/admin_notice_content/${ vo.nid }/${ rpage }"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="/admin_notice_list/${ rpage }"><button type="button" class="btn_style">리스트</button></a>
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>






