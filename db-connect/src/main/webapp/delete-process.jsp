<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 	String pUserId = request.getParameter("userId"); 
	String pUserPw = request.getParameter("userPw"); 
	
	String driver = "oracle.jdbc.OracleDriver"; 
	String url ="jdbc:oracle:thin:@localhost:1521:xe"; 
	String id = "nimxxs"; 
	String pw = "1234"; 
	
	Connection conn = null; 
	PreparedStatement pstmt = null; 
	
	String sql = "delete from member where id = ? and password = ?"; 
	
	Class.forName(driver); 
	conn = DriverManager.getConnection(url,id,pw); 
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, pUserId); 
	pstmt.setString(2, pUserPw); 
	
	int result = pstmt.executeUpdate();	
	
	if(result > 0) { 
		session.invalidate();
		response.sendRedirect("login-form.jsp");
	} else { 
		out.println("<script>alert('서버오류입니다. 잠시 뒤에 다시 시도해 주세요.'); history.back();</script>");
	} 
%>