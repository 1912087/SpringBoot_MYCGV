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
	           $(location).attr('href', "http://localhost:9000/admin_member_list/"+e.page);         
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
		<h1>회원관리-리스트</h1>
		<table class="board">			
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>성명</th>
				<th>연락처</th>
				<th>가입날짜</th>
			</tr>
			<c:choose>
				<c:when test = "${ fn:length(list) == 0 }">
					<tr>
						<td colspan = "5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var = "vo" items = "${ list }">
						<tr>
							<td>${ vo.rno }</td>
							<td><a href="/admin_member_content/${ vo.id }/${ page.reqPage }">${ vo.id }</a></td>
							<td>${ vo.name }</td>
							<td>${ vo.pnumber }</td>
							<td>${ vo.mdate }</td>
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
	<iframe src="http://localhost:9000/footer" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>




