<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String pUserId = request.getParameter("userId");   

   String driver = "oracle.jdbc.OracleDriver";
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String id = "nimxxs";
   String pw = "1234";

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   String sql = "select count(*) as count from member where id = ?";



   Class.forName(driver);
   conn = DriverManager.getConnection(url,id,pw);
   pstmt = conn.prepareStatement(sql);   
   pstmt.setString(1,pUserId);   
   rs = pstmt.executeQuery();      //결과
   int result = 0;
   boolean isState = true;
   if(rs.next()){
      result = rs.getInt("count");   //count column명
      if(result<=0){
         isState = true;
      } else {
         isState = false;
      }
   }



%>

   { "isOk":<%= isState %> }   
