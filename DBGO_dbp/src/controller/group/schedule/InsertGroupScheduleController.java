package controller.group.schedule;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.GroupSchedule;
import model.service.Manager;

public class InsertGroupScheduleController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		GroupSchedule sch = new GroupSchedule(
				request.getParameter("g_id"),
				request.getParameter("title"),
				request.getParameter("date"),
				request.getParameter("homework"),
				request.getParameter("memo"));

		Manager manager = Manager.getInstance();
		manager.insertGroupSchedule(sch);

		return "redirect:/group/view?g_id=" + request.getParameter("g_id");
	}
}