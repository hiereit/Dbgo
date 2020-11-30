package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;
import model.dto.User;

public class UpdateUserFormController implements Controller {//
    private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
        }
		//String updateId = request.getParameter("userId");
		String updateId = UserSessionUtils.getLoginUserId(request.getSession());
		
		log.debug("UpdateForm Request : {}", updateId);

		UserManager manager = UserManager.getInstance();
		User user = manager.findUser(updateId);	// 사용자 정보 검색
		request.setAttribute("user", user);						
		
		return "/user/updateForm.jsp";   // 검색한 사용자 정보를 update form으로 전송     
	}
}
