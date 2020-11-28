package controller.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dto.GroupInfo;
import model.service.UserManager;

public class MyGroupListController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
        }
		
		UserManager manager = UserManager.getInstance();
		List<GroupInfo> mGroupList = manager.findMyGroupList(UserSessionUtils.getLoginUserId(request.getSession()));

		request.setAttribute("mGroupList", mGroupList);
		return "/group/myGroupList.jsp";
	}
}
