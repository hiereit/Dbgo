package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;


public class UpdateGroupController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UpdateGroupController.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
		}
		
		return null;	

	}
}
