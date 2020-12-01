package controller.group;

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
	
			try {
				String[] membersParam = request.getParameterValues("members");
				if (membersParam != null) {
					for (String member : membersParam) {
						group.getMembers().add(member);
					}
				}
				group.getMembers().add(UserSessionUtils.getLoginUserId(request.getSession()));
				
				Manager manager = Manager.getInstance();
				
				for (String member : group.getMembers()) {
					manager.addMember(group.getG_id(), member);
				}
				manager.createGroup(group).getG_id();
				
		    	log.debug("Create Group : {}", group);
		        return "redirect:/group/list";	// 성공 시 커뮤니티 리스트 화면으로 redirect
		        
			} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
				request.setAttribute("addMemberFailed", true);
	            request.setAttribute("creationFailed", true);
				request.setAttribute("exception", e);
				request.setAttribute("group", group);
				return "/group/creationForm.jsp";
			}
	}

}