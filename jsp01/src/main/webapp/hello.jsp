<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String name = "장성호";
	String msg = "hello";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>hello jsp</h1>
	<h2><%= name %></h2>
	<%
		out.println("hello jsp");
		out.println(name+msg);
		for(int i=0; i<=100; i++){
			out.println("hello jsp <br>");
		}
	%>
</body>
</html>