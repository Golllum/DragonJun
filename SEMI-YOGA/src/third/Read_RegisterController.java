package third;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.rsDAO;
import model.rsVO;

public class Read_RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("userId", "db");
		ArrayList<rsVO> list=rsDAO.getInstance().Read_RegisterStatus((String)session.getAttribute("userId"));
		request.setAttribute("registerStatus_list", list);
		return "RegisterStatus.jsp";
	}

}
