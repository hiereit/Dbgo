package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;
import model.service.UserNotFoundException;
import model.dto.GroupInfo;
import model.dto.User;

public class ViewUserController implements Controller {//
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/user/login/form";
		}

		Manager manager = Manager.getInstance();
		String userId = UserSessionUtils.getLoginUserId(request.getSession());
		List<GroupInfo> mGroupList = manager.findMyGroupList(userId);

		request.setAttribute("mGroupList", mGroupList);

		User user = null;
		try {
			user = manager.findUser(userId);
		} catch (UserNotFoundException e) {				
			request.setAttribute("exception", e);
		}	

		request.setAttribute("user", user);		
		return "/user/view.jsp";
	}
}