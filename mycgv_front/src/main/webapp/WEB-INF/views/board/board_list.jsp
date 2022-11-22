<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/css/mycgv.css">
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: ${ page.dbCount },	// total pages	
		    page: ${ page.reqPage },		// initial page		
		    pageSize: ${ page.pageSize },			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		// 오른쪽 꺾인 괄호 (>)
		    firstText: '&laquo;&laquo;',		// 왼쪽 꺾인 괄호 (<)
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/board_list/"+e.page);         
	    });
		
		let access_reject = "${rpage}";
		if(access_reject == "access_reject"){
			alert("유효하지 않은 접근입니다.");
			return false;
		}
 	});
</script> 
</head>
<body>
	<!-- Header Include -->
	<iframe src="/header" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>게시판-리스트</h1>
		<table class="board">
			<tr>
				<td colspan="5">
					<a href="/board_write">
					<button type="button" class="btn_style">글쓰기</button>
					</a>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test = "${ fn:length(list) == 0 }">
					<tr>
						<td colspan = "5">등록된 게시물이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var = "vo" items = "${ list }">
					<tr>
						<td>${ vo.rno }</td>
						<td>${ vo.id }</td>
						<td><a href="/board_content/${ vo.bid }/${ page.reqPage }">${ vo.btitle }</a></td>
						<td>${ vo.bdate }</td>
						<td>${ vo.bhits }</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<tr>
				<td colspan="5"><div id="ampaginationsm"></div></td>
			</tr>
		</table>	
	</div>
	
	<!-- footer Include -->
	<iframe src="/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







