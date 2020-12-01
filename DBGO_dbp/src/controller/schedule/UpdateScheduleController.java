package controller.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.ScheduleDAO;
import model.dto.Schedule;

public class UpdateScheduleController implements Controller{

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
        }
	
		ScheduleDAO scheduleDAO = new ScheduleDAO();
		if (request.getParameter("btn").equals("update")) {
			Schedule s = new Schedule();
			s.setSch_id(request.getParameter("sch_id"));
			s.setTitle(request.getParameter("title"));
			System.out.println("title " +request.getParameter("title"));
			s.setCategory(request.getParameter("category"));
			System.out.println("category " +request.getParameter("category"));
			s.setStart_date(request.getParameter("startDate"));
			System.out.println("startDate " +request.getParameter("startDate"));
			if (request.getParameter("endDate") != null) {
				s.setEnd_date(request.getParameter("endDate"));
				System.out.println("endDate " +request.getParameter("endDate"));
			}
			if (request.getParameter("memo") != null) {
				s.setMemo(request.getParameter("memo"));
				System.out.println("memo " +request.getParameter("memo"));
			}
			
			scheduleDAO.update(s);
		}
		else {
			scheduleDAO.delete(request.getParameter("sch_id"));
		}
		
		
		return "redirect:/schedule/monthly";
	}
	
	

}
