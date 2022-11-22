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
<style>
	#upload_file {
		border : 1px solid white;
		position : relative;
		left : 264px;
		height : 20px;
		top : -30px;
	    width: 270px;
		display : inline-block;
		background-color : white;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
        box-sizing: border-box;
	}
	#filedelete {
		position: relative;
    	top: -30px;
	    left: 261px;
	    background-image: url(http://localhost:9000/images/delete.png);
	    background-repeat: no-repeat;
	    background-size: contain;
	    background-position: center;
	    width: 20px;
	    height: 20px;
	    border: none;
	    background-color: transparent;
	    cursor : pointer;
	}
</style>
<script>
	$(document).ready(function(){
		//새로운 파일 선택하는 이벤트
		$("input[type=file]").change(function(){
			//javascript(window)에서는 FileReader 그 외에는 FileChoose라고 부른다
			if(window.FileReader){
				//file이 여러개가 선택되면 배열에 하나씩 담기므로(0번지에 계속 쌓임), 해당 파일의 첫번째 파일의 이름을 가져온다.
				let fname = $(this)[0].files[0].name;	//파일 이름 출력
				//$(this)[0].files[0].type //파일 타입
				//$(this)[0].files[0].size //파일 사이즈
				$("#upload_file").text(fname);
				$(".file-check").val("n");
			}
		});
		
		$("#filedelete").click(function(){
			$("input[type='file']").val("");
			$("#upload_file").text("선택된 파일 없음");
			$(".file-check").val("y");
		});
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
		<h1>게시판-수정하기</h1>
		<form name="boardUpdateForm" action="/board_update" method="post" enctype = "multipart/form-data">
			<input type = "hidden" name = "bid" value = "${ vo.bid }">
			<input type = "hidden" name = "file" value = "${ vo.bfile }">
			<input type = "hidden" name = "sfile" value = "${ vo.bsfile }">
			<input type="hidden" name="fileNone"  value="n" class="file-check">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="btitle" id="btitle" value="${ vo.btitle }">
				</li>
				<li>
					<label>내용</label>
					<textarea name="bcontent">${ vo.bcontent }</textarea>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1" id = "file1">
					<c:choose>
						<%-- if~else 문 --%>
						<c:when test = "${ vo.bfile != null }">
							<span id="upload_file">${ vo.bfile }</span>		
						</c:when>
						<c:otherwise>
							<span id="upload_file">선택된 파일 없음</span>						
						</c:otherwise>
					</c:choose>
					<button type = "button" id = "filedelete"></button>
				</li>
				<li>
					<button type="button" class="btn_style" id="btnBoardUpdate">수정완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="/board_content/${ vo.bid }/${ rpage }"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="/board_list/${ rpage }"><button type="button" class="btn_style">리스트</button></a>
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







