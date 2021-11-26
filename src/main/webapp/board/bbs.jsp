<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    
<%--	[JSTL] core 라이브러리 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- JSTL과 EL을 이용해서 session에 있는 user_id 값을 가져와 user_id에 저장 --%>
<c:set var = "user_id" value = "${sessionScope.user_id}"/>

<!DOCTYPE html>
<html>
<head>

<title>JSP 게시판</title>
<meta http-equiv="Conetent-Type" content = "text/html; charset = UTF-8">
<meta name="viewport" content = "width=device-width" initial-scale = "1">
<link rel = "stylesheet" href = "<%= request.getContextPath() %>/css/bootstrap.css" >
<link rel = "stylesheet" href = "<%= request.getContextPath() %>/css/custom.css">

<style>
		a, a:hover {
			color : #000000;
			text-decoration : none;
		}
</style>

</head>
<body>

<%-- 메인 네비게이션 --%>
<nav class="navbar navbar-default">
		<%-- 네비게이션 헤더 --%>
		<div class = "navbar-header">
				<button type = "button" class = "navbar-toggle collapsed"
				 	data-toggle = "collapse" data-target = "#bs-navbar-collapse"
				 	arai-expaned = "false">
				 	<span class = "icon-bar"></span>
				 	<span class = "icon-bar"></span>
				 	<span class = "icon-bar"></span>
				 </button>
				 <a class = "navbar-brand" href = "<%= request.getContextPath() %>/home">JSP 게시판</a>
		</div>
		<%-- 네비게이션 헤더 종료 --%>
		
		<%--  네비게이션 메뉴 --%>
		<div class="collapse navbar-collapse" id = "bs-navbar-collapse">
		
				<%-- 메인 메뉴 --%>
				<ul class = "nav navbar-nav">
						<li><a href="<%= request.getContextPath() %>/home">메인</a></li>
						<li class="active"><a href = "<%= request.getContextPath() %>/bbs">게시판</a></li>	
				</ul>
				<%-- 메인 메뉴 종료 --%>
				
				<%-- 마이 페이지 메뉴 --%>
				<!-- 로그인이 되있지 않을 때 표시 -->
				<c:if test = "${empty user_id}">
				<ul class = "nav navbar-nav navbar-right">
						<li class = "dropdown">
								<a href = "#" class = "dropdown-toggle"
										data-toggle = "dropdown" role="button"
										aria-haspopup="true" aria-expanded = "false ">
										 마이페이지<span class = "caret"></span>							
								</a>
								<ul class = "dropdown-menu">
										<li><a href = "<%= request.getContextPath() %>/home/login">로그인</a></li>
										<li><a href = "<%= request.getContextPath() %>/home/join">회원가입</a></li>
								</ul>
						</li>
				</ul>
				</c:if>
				
				<c:if test = "${not empty user_id }">
				 <!-- 로그인이 되었을 때 표시 -->
				<ul class = "nav navbar-nav navbar-right">
						<li class = "dropdown">
								<a href = "#" class = "dropdown-toggle"
										data-toggle = "dropdown" role="button"
										aria-haspopup="true" aria-expanded = "false ">
										 마이페이지<span class = "caret"></span>							
								</a>
								<ul class = "dropdown-menu">
										<li><a href = "<%= request.getContextPath() %>/home/logout">로그아웃</a></li>
								</ul>
						</li>
				</ul>
				</c:if>
				<%-- 마이페이지 메뉴 종료 --%>
				
		</div>
		<%-- 네비게이션 메뉴 종료  --%>
		
</nav>
<%-- 메인 네비게이션 종료 --%>

<%-- 메인 게시판 --%>
<div class = "container">
		<div class = "row">
		

				<table class = "table table-striped" style = "text-align: center; border: 1px solid #bbbbbb">
							<thead>
									<tr>
											<th style="background-color: #dddddd; text-align: center;">번호</th>
											<th style="background-color: #dddddd; text-align: center;">제목</th>
											<th style="background-color: #dddddd; text-align: center;">작성자</th>
											<th style="background-color: #dddddd; text-align: center;">작성일</th>
									</tr>
							</thead>
							<tbody>
									<c:forEach var = "boarder" items = "${list}">
									<tr>
											<td>${boarder.boarder_id}</td>
											<td><a href = "<%=request.getContextPath() %>/bbs/view?boarder_id=${boarder.boarder_id}">${boarder.title}</a></td>
											<td>${boarder.writer}</td>
											<td>${boarder.reg_date}</td>
									</tr>
									</c:forEach>
							</tbody>
							
				</table>
				<!-- GET 방식 전송 : URL에 ? 찍고, 파라미터 = 데이터 & 파라미터 = 데이터 -->
				<ul class="pagination">
				
					<!-- 이전 section 버튼 -->
					<c:if test = "${paging.pageNumber > 5}">
				
						<li><a href="./bbs?pageNum=${paging.before}"><span class = "glyphicon glyphicon-triangle-left"></span></a></li>
				
					</c:if>
						
						<c:forEach var = "i" begin = "${paging.minPage}" end = "${paging.maxPage}">
							
							<c:if test = "${i == paging.pageNumber}">
								<li class = "active"><a>${i}</a></li>
							</c:if>
							<c:if test = "${i != paging.pageNumber}">
								<li><a href="./bbs?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>						

					<!-- 다음 section 버튼 -->	
					<c:if test = "${paging.next}">
						
						<li><a href="./bbs?pageNum=${paging.forward}"><span class = "glyphicon glyphicon-triangle-right"></span></a></li>
						
					</c:if>	
						
				</ul>		
				
				
				<a href = "<%=request.getContextPath() %>/bbs/write" class = "btn btn-default pull-right">글쓰기</a>
		</div>
</div>
<%-- 메인 게시판 종료 --%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src= "<%= request.getContextPath() %>/js/bootstrap.js"></script>
</body>
</html>
