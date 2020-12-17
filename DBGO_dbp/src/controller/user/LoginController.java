package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.service.Manager;

public class LoginController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("u_id");
		String password = request.getParameter("password");

		try {
			Manager manager = Manager.getInstance();
			manager.login(userId, password);

			HttpSession session = request.getSession();
			session.setAttribute(UserSessionUtils.USER_SESSION_KEY, userId);

			return "redirect:/main.jsp";	

		} catch (Exception e) {
			request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
			return "/user/loginForm.jsp";			
		}	
	}
}