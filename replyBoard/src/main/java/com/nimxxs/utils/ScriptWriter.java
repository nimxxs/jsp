package com.nimxxs.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptWriter {
	public static void alert(HttpServletResponse response,String alertMsg) throws IOException {
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>alert('"+alertMsg+"');</script>");
	} // 경고 띄우기
	public static void alertAndBack(HttpServletResponse response,String alertMsg) throws IOException {
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>alert('"+alertMsg+"');history.back();</script>");
	} // 경고 띄우고 이전 페이지
	public static void alertAndNext(HttpServletResponse response,String alertMsg, String next) throws IOException {
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>alert('"+alertMsg+"');location.href='"+next+"';</script>");
	} // 경고 띄우고 다음 페이지
}
