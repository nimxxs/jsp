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
   String pUserEmail = request.getParameter("userEmail");
   
   
   int pZonecode = Integer.parseInt(request.getParameter("zonecode"));
   String pUserAdress = request.getParameter("userAddress");
   String pDetailAddress = request.getParameter("detailAddress");
   String pExtraAddress = request.getParameter("extraAddress");

   
   String driver = "oracle.jdbc.OracleDriver";
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String id = "nimxxs";
   String pw = "1234";
   // 여기까지 고정으로 써야하는 것
   
   Connection conn = null;   //객체 default는 항상 null
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   // jsp에서 query날리면 auto commit이 됨.
   // member는 table명
   String sql = "update member set name = ?" 
   			+ ", email=?, zonecodee=?, address=?, detailAddress=?, extraAddress=?"
		    + " where id =? and password =?";
   
   Class.forName(driver);
   conn = DriverManager.getConnection(url, id, pw);
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1,pUserName);
   pstmt.setString(2,pUserEmail);
   pstmt.setInt(3,pZonecode);
   pstmt.setString(4,pUserAdress);
   pstmt.setString(5,pDetailAddress);
   pstmt.setString(6,pExtraAddress);
   pstmt.setString(7,pUserId);
   pstmt.setString(8,pUserPw);

   
   int result = pstmt.executeUpdate();      //select를 제외한 나머지 update, delete, insert
   if(result > 0) {
	   session.invalidate();
      response.sendRedirect("login-form.jsp");
   } else {
      out.println("<script>alert('서버오류입니다. 잠시뒤에 다시 시도해 주세요.'); history.back();</script>");   //history.back : 한단계 뒤로감.
   }
   
   
   
%>