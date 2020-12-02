package controller.group;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import controller.user.UserSessionUtils;
import model.dto.GroupInfo;
import model.service.Manager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CreateGroupController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(CreateGroupController.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
        }

		GroupInfo group = new GroupInfo(null, request.getParameter("name"));
		List<String> failMem = new ArrayList<>();
		
		Manager manager = Manager.getInstance();
		String g_id = request.getParameter("g_id");
		if (request.getParameter("isFailed") == null) {
			g_id = manager.createGroup(group).getG_id();
			group.setG_id(g_id);
			manager.addMember(g_id, UserSessionUtils.getLoginUserId(request.getSession()));
		}
		
		String[] membersParam = request.getParameterValues("members");
		if (membersParam != null) {
			for (String member : membersParam) {
				if (manager.existUser(member)) {
					manager.addMember(g_id, member);
				}
				else {
					failMem.add(member);
				}
			}
		}
		
		try {
			if (failMem.size() > 0) {
				throw new Exception();
			}
			else {
				 return "redirect:/group/list";
			}
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
			request.setAttribute("addMemberFailed", true);
			request.setAttribute("exception", failMem.toString() + "이 없습니다.");
			request.setAttribute("group", group);
			return "/group/creationForm.jsp";
		}
		
	}

}