package controller.group.schedule;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.GroupSchedule;
import model.service.Manager;

public class ViewGroupScheduleController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String g_id = request.getParameter("g_id");
    	String groupsch_id = request.getParameter("groupsch_id");
    	
		Manager manager = Manager.getInstance();
		GroupSchedule fgsch = manager.findGroupScheduleDetail(groupsch_id);
		
		List<GroupSchedule> grpschList = manager.findGroupSchedule(g_id);
		String g_name = manager.findGroupName(g_id);
		
		request.setAttribute("groupsch_id", groupsch_id);
		request.setAttribute("fgsch", fgsch);
		request.setAttribute("grpschList", grpschList);
		request.setAttribute("g_name", g_name);
		request.setAttribute("g_id", g_id);
		request.setAttribute("detail", true);
		return "/group/view.jsp";
    }
}