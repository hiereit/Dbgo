package controller.group.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.GroupSchedule;
import model.service.UserManager;

public class DeleteGroupScheduleController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String groupsch_id = request.getParameter("groupsch_id");
		String g_id = request.getParameter("g_id");

		UserManager manager = UserManager.getInstance();
		manager.deleteGroupSchedule(groupsch_id);

		return "redirect:/group/schedule/view?groupsch_id=" + groupsch_id + "&g_id=" + g_id;
	}
}