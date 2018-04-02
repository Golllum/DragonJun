package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dispatcher")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		handleRequest(request, response);
	}
	/*
	 * 클라이언트의 요청을 분석한다 (command 가 곧 요청사항)
	 * HandlerMapping을 이용하여 실제 컨트롤러 구현체를 반환받고 실행
	 * 이 때, 리턴되는 정보는 이동할 View의 url과 이동방식 (forward, redirect)
	 * 리턴된 정보를 이용하여 클라이언트에게 응답하도록 처리
	 * Exception 발생 시 error.jsp로 응답하도록 처리하되, console에 로그(운영자에게 보낼)를 남긴다
	 */
	private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		try {
			String command=request.getParameter("command");
			String url=HandlerMapping.getInstance().create(command).execute(request, response);
			
			if (url.trim().startsWith("redirect:")) {
				response.sendRedirect(url.trim().substring(9));
			} else {
				request.getRequestDispatcher(url).forward(request, response);
			}

		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}





















