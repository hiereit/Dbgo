package controller.user;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.dto.User;
import model.service.Manager;

public class ListUserController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/user/login/form";
		}

		Manager manager = Manager.getInstance();
		List<User> userList = manager.findUserList();

		request.setAttribute("userList", userList);				
		request.setAttribute("curUserId", UserSessionUtils.getLoginUserId(request.getSession()));

		return "/user/list.jsp";        
	}
}