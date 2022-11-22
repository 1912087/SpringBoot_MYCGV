<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/css/mycgv.css">
<script src="http://localhost:9000/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/js/mycgv_jquery.js"></script>
<script>
	$(document).ready(function(){
		let mcategory = "${vo.mcategory}";
		$("select[name='mcategory']").val(mcategory);
		
		$("#file1").change(function(){
			if(window.FileReader){
				let fname = $(this)[0].files[0].name;
				$(".fileCheck1").text(fname);
			}
		});
		
		$("#file2").change(function(){
			if(window.FileReader){
				let fname = $(this)[0].files[0].name;
				$(".fileCheck2").text(fname);
			}
		});
		
		$("#btnMovieUpdate").click(function(){
			if($("#mtitle").val() == ""){
				alert("제목을 입력하세요");
				$("#mtitle").focus();
				return false;
			}else{
				boardWriteForm.submit();
			}
		});
	});
</script>
<style>
	
	
	div.file_div {
	    border: 0.5px solid #ccc;
	    float: left;
	    width: 59.5%;
	    box-sizing: border-box;
        border-radius: 5px;
        display : flex;
        align-items : center;
	}
	input[type="file"]{
		display : none;
	}
	label.fileCheck {
	    width: 65px !important;
	    background: #f5f5f5 !important;
	    border: 0.5px solid black !important;
	    margin-left: 10px !important;
	    text-align: center;
	    padding: 2px 5px !important;
	    font-weight: 400 !important;
	    text-indent : 0 !important;
	}
	label.fileCheck1,
	label.fileCheck2 {
	    background: none !important;
	    border: none !important;
	    display: inline-block !important;
	    float: left !important;
	    background: none;
	    margin-left: 0 !important;
	    width: 265px !important;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    text-align: left;
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
		<h1>영화 수정 화면</h1>
		<form name="boardWriteForm" action="/admin_movie_update" method="post"
			enctype = "multipart/form-data">
			<input type = "hidden" name = "mid" value = "${ vo.mid }">
			<input type = "hidden" name = "fid" value = "${ vo.fid }">
			<input type = "hidden" name = "msfile1" value = "${ vo.msfile1 }">
			<input type = "hidden" name = "msfile2" value = "${ vo.msfile2 }">
			<ul>
				<li>
					<label>카테고리</label>
					<select name = "mcategory">
						<option value = "액션">액션</option>
						<option value = "로맨스">로맨스</option>
						<option value = "스릴러">스릴러</option>
					</select>
				</li>
				<li>
					<label>영화제목</label>
					<input type = "text" name = "mname" id ="mtitle" value = "${ vo.mname }">
				</li>
				<li>
					<label>영화내용</label>
					<textarea name="mdesc">${ vo.mdesc }</textarea>
				</li>
				<%-- checkbox에 name을 동일하게 주면 배열로 받듯이, name을 files로 동일하게 주면 배열로 받는다. --%>
				<li>
					<label>파일첨부</label>
					<input type="file" name="files" id = "file1">
					<div class = "file_div">
						<label for="file1" class = "fileCheck">파일 선택</label>
						<c:choose>
							<c:when test = "${ vo.msfile1 != null }">
								<label for = "file1" class = "fileCheck1">${ vo.mfile1 }</label>
							</c:when>
							<c:otherwise>
								<label for = "file1" class = "fileCheck1">선택된 파일 없음</label>
							</c:otherwise>
						</c:choose>
					</div>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="files" id = "file2">
					<div class = "file_div">
						<label for="file2" class = "fileCheck">파일 선택</label>
						<c:choose>
							<c:when test = "${ vo.msfile2 != null }">
								<label for="file2" class = "fileCheck2">${ vo.mfile2 }</label>
							</c:when>
							<c:otherwise>
								<label for="file2" class = "fileCheck2">선택된 파일 없음</label>
							</c:otherwise>
						</c:choose>
					</div>
				</li>
				<li>
					<button type="button" class="btn_style" id="btnMovieUpdate">등록완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="/admin_movie_list/${ rpage }">
						<button type="button" class="btn_style">리스트</button></a>
					<a href="http://localhost:9000/admin"><button type="button" class="btn_style">관리자홈</button></a>
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>
