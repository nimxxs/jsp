package com.nimxxs.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nimxxs.model.BoardDao;
import com.nimxxs.model.BoardDto;
import com.nimxxs.utils.ScriptWriter;
@WebServlet("/board/writeProcess")
public class WriteProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public WriteProcessController() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		BoardDto boardDto = new BoardDto();
		boardDto.setName(userName);
		boardDto.setUserId(userId);
		boardDto.setTitle(title);
		boardDto.setContents(contents);
		BoardDao boardDao = new BoardDao();
		int result = boardDao.writeBoard(boardDto);
		if(result>0) {
			response.sendRedirect("../board/list");
		} else {
			ScriptWriter.alertAndBack(response, "알 수 없는 오류로 글이 입력되지 않았습니다. 다시 시도해 주세요.");
		}
	}


}
