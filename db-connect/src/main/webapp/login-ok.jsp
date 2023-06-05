<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String pageUserId = (String) request.getAttribute("pageUserId");
	
	String requestUserId = (String) request.getAttribute("userId");
	
	String sessionUserId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <p>로그인 성공</p> -->
	<p><%=userId %>님 안녕하세요.</p>
	<p><%=requestUserId %>님 안녕하세요.</p>
	<p><%=pageUserId %>님 안녕하세요.</p>
	<p><%=sessionUserId %>님 안녕하세요.</p>
</body>
</html>