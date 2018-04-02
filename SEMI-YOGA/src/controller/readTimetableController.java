package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.rsDAO;
import model.rsVO;

public class readTimetableController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<rsVO> list=rsDAO.getInstance().readTimetableInfo();
		request.setAttribute("timetable_list", list);
		return "timetable.jsp";
	}

}
