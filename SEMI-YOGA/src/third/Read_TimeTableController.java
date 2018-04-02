package third;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.rsDAO;
import model.rsVO;

public class Read_TimeTableController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		session.setAttribute("userId", "db");
		ArrayList<rsVO> list=null;
		if(session.getAttribute("userId")==null) {
			list=rsDAO.getInstance().readTimetableInfo();
		}else {
			String user_package = rsDAO.getInstance().readUserPackage((String)session.getAttribute("userId"));
			request.setAttribute("userPackage", user_package);
			list=rsDAO.getInstance().readTimetableInfo();
		}
		//request.setAttribute("url", "timetable.jsp");
		request.setAttribute("timetable_list", list);
		//return "/template/layout.jsp";
		return "timetable.jsp";
	}

}
