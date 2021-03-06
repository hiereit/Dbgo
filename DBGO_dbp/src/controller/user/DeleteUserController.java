package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.Manager;

public class DeleteUserController implements Controller{//
	private static final Logger log = LoggerFactory.getLogger(DeleteUserController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String deleteId = request.getParameter("u_id");
		log.debug("Delete User : {}", deleteId);

		Manager manager = Manager.getInstance();

		manager.remove(deleteId);	

		return "redirect:/user/logout";
	}
}