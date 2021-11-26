<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page isELIgnored = "false" %>
<%--
			[EL]
		ㆍJSP 스크립트 언어의 표현식 (<%= %>) 대신에ㅔ속성을 간결하게 표현
		ㆍpage, request, session, application 4개의 scop값 출력
 --%>
 
 <%--	[JSTL] core 라이브러리 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
 
<%-- 	[JSP 태그와 JSTL 태그의 변수 선언]
		JSP 태그 		: 	<%! String user_id = 'user'; %> -> 이 태그를 없애주는게 c:set 태그이다.
		JSTL 태그 	:  	<c:set var = 'user_id' value = 'user'/>   
		
			[JSP 태그와 JSTL 태그의 조건문]
		JSP 태그 		: <% if(user_id == null) {내용} %>
		JSTL 태그 	: <c:if test = "${empty user_id}"> 내용 </c:if>


			[else if 문]
		// 변수 선언
		<% int a = 10; %>
		<c:set var = 'user_id' value = 'user'/>  
		
		JSP 태그 		: <% if('a' > 10 ) {실행문1} else if(a < 10) {실행문2} else {실행문3} %>
		JSTL 태그 	: <c:choose>
		 						<c:when test = "${a > 10}">실행문1</c:when> // if
								<c:when test = "${a < 10}">실행문2</c:when> // else if
								<c:outerwise>실행문3</c:outerwise>					// else
						  </c:choose>
						  
			[JSP와 JSTL의 반복문]
		JSP 태그		: <% for(int i = 1; i <= 10; i++) { 실행문 }
		JSTL 태그	: <c:forEach var = "i" begin = "1" end = "10">실행문</c:forEach>
			
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>