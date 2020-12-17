package controller.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.Manager;

public class DeleteDiaryController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/user/login/form";
		}
		String d_id = request.getParameter("d_id");

		Manager manager = Manager.getInstance();
		manager.deleteDiary(d_id);

		return "redirect:/diary/list";
	}
}