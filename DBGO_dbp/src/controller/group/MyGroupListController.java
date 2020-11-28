package controller.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.GroupInfo;
import model.service.UserManager;

public class MyGroupListController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserManager manager = UserManager.getInstance();
		List<GroupInfo> mGroupList = manager.findMyGroupList("jimin");
		System.out.println("리스트 사이즈 " + mGroupList.size());
		request.setAttribute("mGroupList", mGroupList);
		return "/group/myGroupList.jsp";
	}
}
