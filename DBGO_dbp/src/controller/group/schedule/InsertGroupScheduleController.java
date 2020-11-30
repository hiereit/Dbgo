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
	
		request.setAttribute("g_id", request.getParameter("g_id"));
		return "/group/view";	// 성공 시 커뮤니티 리스트 화면으로 redirect
    }
}
