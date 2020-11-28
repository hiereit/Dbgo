package controller.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.ScheduleDAO;
import model.dto.Schedule;

public class UpdateScheduleController implements Controller{

	//update 스케줄!!
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ScheduleDAO schDAO = new ScheduleDAO();
		
		String title = request.getParameter("title");
		Schedule sch = schDAO.findScheduleInfo(title);
		
		schDAO.updateSchedule(sch.getMemo(),title, sch.getCategory(), sch.getSchStartDate(),sch.getSchEndDate());				
		
		return "/schedule/main";
	}

}
