<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pUserId = request.getParameter("userId");
	String pUserPw = request.getParameter("userPw");
	String pUserName = request.getParameter("userName");
	int pZonecode = Integer.parseInt(request.getParameter("zonecode"));
	String pUserAddress = request.getParameter("useraddress");
	String pDetailAddress = request.getParameter("detailAddress");
	String pExtraAddress = request.getParameter("extraAddress");
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "nimxxs";
	String pw = "1234";
	String zonecode = "48559";
	String address = "부산";
	String detailaddress = "남구";
	String extraadress = "용당동";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "insert into member values (?,?,?,?,?,?,?)";
	
	
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pUserId);
	pstmt.setString(2, pUserName);
	pstmt.setString(3, pUserPw);
	pstmt.setInt(4, pZonecode);
	pstmt.setString(5, pUserAddress);
	pstmt.setString(6, pDetailAddress);
	pstmt.setString(7, pExtraAddress);
	
	int result = pstmt.executeUpdate();		// select를 제외한 나머지 update, delete, insert
	if(result > 0){
		response.sendRedirect("login-form.jsp");		
	} else {
		out.println("<script>alert('서버 오류입니다. 잠시 뒤에 다시 시도해 주세요.'); history.back(); </script>");
	}
	
%>