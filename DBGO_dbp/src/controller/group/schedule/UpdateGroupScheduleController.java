package controller.group.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.GroupSchedule;
import model.service.Manager;

public class UpdateGroupScheduleController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		GroupSchedule sch = new GroupSchedule();
		sch.UpdateGroupSchedule(request.getParameter("updateGroupsch_id"),
				request.getParameter("updateTitle"),
				request.getParameter("updateDate"),
				request.getParameter("updateHomework"),
				request.getParameter("updateMemo"));

		Manager manager = Manager.getInstance();
		manager.updateGroupSchedule(sch);

		return "redirect:/group/schedule/view?groupsch_id=" + request.getParameter("updateGroupsch_id") + "&g_id=" + request.getParameter("updateG_id");
	}
}
