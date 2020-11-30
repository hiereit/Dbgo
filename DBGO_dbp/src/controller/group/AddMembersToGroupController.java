package controller.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dto.GroupInfo;
import model.service.Manager;

public class AddMembersToGroupController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(AddMembersToGroupController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
		}
		try {
			String myId = UserSessionUtils.getLoginUserId(request.getSession());
			
			if (request.getMethod().equals("GET")) {	
	    		// GET request: 회원정보 수정 form 요청	
	    		// 원래는 UpdateUserFormController가 처리하던 작업을 여기서 수행
	   
	    		log.debug("AddMembersToGroup Request : {}", myId);
	    		
	    		Manager manager = Manager.getInstance();
	    		
				List<GroupInfo> myGroupList = manager.findMyGroupList(myId);	// 커뮤니티 리스트 검색
				request.setAttribute("mGroupList", myGroupList);	
					
				return "/group/updateForm.jsp";   // 검색한 사용자 정보를 update form으로 전송     
				
			}
	    	// POST request (회원정보가 parameter로 전송됨)
			Manager manager = Manager.getInstance();
			manager.addMember(request.getParameter("g_id"), request.getParameter("mem"));			
			return "redirect:/group/list";
		} catch (Exception e) {
			request.setAttribute("addMemberFailed", true);
			request.setAttribute("exception", e);
			return "redirect:/group/update";
		}
	}
}
