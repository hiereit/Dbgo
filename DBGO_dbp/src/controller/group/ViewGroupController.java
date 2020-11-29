package controller.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.UserManager;
import model.dto.GroupSchedule;

public class ViewGroupController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String g_id = request.getParameter("g_id");
		UserManager manager = UserManager.getInstance();
		List<GroupSchedule> grpschList = manager.findGroupSchedule(g_id);
		String g_name = manager.findGroupName(g_id);
		request.setAttribute("grpschList", grpschList);
		request.setAttribute("g_name", g_name);
		request.setAttribute("g_id", g_id);
		return "/group/view.jsp";
    }
}