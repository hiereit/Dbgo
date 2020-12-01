package controller.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.ScheduleDAO;

public class UpdateDropController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ScheduleDAO scheduleDAO = new ScheduleDAO();
		String sch_id = request.getParameter("sch_id");
		
		String start_date = request.getParameter("start_date");

		String end_date = null;
		if (request.getParameter("end_date") != null) {
			end_date = request.getParameter("end_date");
			scheduleDAO.updateByDrop(sch_id, start_date, end_date);
		}else {
			scheduleDAO.updateByDrop(sch_id, start_date);
		}
		

		return null;
	}

}
