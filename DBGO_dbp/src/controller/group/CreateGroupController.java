package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dto.GroupInfo;
import model.service.UserManager;

public class CreateGroupController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(CreateGroupController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		GroupInfo grp = new GroupInfo();		
			try {
				UserManager manager = UserManager.getInstance();
				manager.createGroup(grp);
				
		    	log.debug("Create Group : {}", grp);
		        return "redirect:/group/myGroupList";	// 성공 시 커뮤니티 리스트 화면으로 redirect
		        
			} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
	            request.setAttribute("creationFailed", true);
				request.setAttribute("exception", e);
				request.setAttribute("group", grp);
				return "/group/createGroupForm.jsp";
			}
	}

}
