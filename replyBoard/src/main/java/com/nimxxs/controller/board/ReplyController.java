package com.nimxxs.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/reply")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReplyController() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/reply.jsp");
		dispatcher.forward(request, response);
	}

}