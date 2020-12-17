package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.Manager;
import model.dto.User;

public class UpdateUserFormController implements Controller {//
    private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
        }
		String updateId = UserSessionUtils.getLoginUserId(request.getSession());
		
		log.debug("UpdateForm Request : {}", updateId);

		Manager manager = Manager.getInstance();
		User user = manager.findUser(updateId);
		request.setAttribute("user", user);						
		
		return "/user/updateForm.jsp"; 
	}
}