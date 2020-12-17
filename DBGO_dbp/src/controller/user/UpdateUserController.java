package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.service.Manager;
import model.dto.User;

public class UpdateUserController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		User updateUser = new User(
				request.getParameter("u_id"),
				request.getParameter("name"),
				request.getParameter("email"),
				request.getParameter("password"));    

		log.debug("Update User : {}", updateUser);

		Manager manager = Manager.getInstance();
		manager.update(updateUser);		
		HttpSession session = request.getSession();
		session.removeAttribute(UserSessionUtils.USER_SESSION_KEY);
		session.invalidate();
		return "redirect:/user/login/form";			
	}
}