package third;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.rsDAO;
import model.rsVO;

public class Read_TimeTableController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<rsVO> list=rsDAO.getInstance().readTimetableInfo();
		//request.setAttribute("url", "timetable.jsp");
		request.setAttribute("timetable_list", list);
		//return "/template/layout.jsp";
		return "timetable.jsp";
	}

}
