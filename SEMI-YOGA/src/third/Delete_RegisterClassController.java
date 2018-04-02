package third;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.rsDAO;

public class Delete_RegisterClassController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("userId", "db");
		rsDAO.getInstance().Delete_RegisterClass((String)session.getAttribute("userId"),Integer.parseInt(request.getParameter("classNo")));
		return "dispatcher?command=Read_Register";
	}

}
