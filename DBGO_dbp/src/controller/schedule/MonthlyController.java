package controller.schedule;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.ScheduleDAO;
import model.dto.Schedule;

public class MonthlyController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/user/login/form";
		}

		ScheduleDAO scheduleDAO = new ScheduleDAO();
		List<Schedule> schedules = scheduleDAO.findAllSchedules(UserSessionUtils.getLoginUserId(request.getSession()));

		request.setAttribute("schedules", schedules);
		return "/schedule/monthly.jsp";
	}
}