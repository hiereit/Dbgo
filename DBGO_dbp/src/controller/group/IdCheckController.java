package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.RegisterUserController;
import model.dao.UserDAO;
import model.service.ExistingUserException;
import model.service.UserManager;

public class IdCheckController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			UserDAO userDAO = new UserDAO();
			if (userDAO.existingUser(request.getParameter("id")) == true) {
				return "/user/creationFormm.jsp";
			}
			else {
				return "/user/creationFormm.jsp";
			}
	        
		} catch (ExistingUserException e) {		// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			return "/user/registerForm.jsp";
		}
    }
}
