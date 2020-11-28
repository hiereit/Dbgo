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
    	GroupSchedule g = null;
		UserManager manager = UserManager.getInstance();
		List<GroupSchedule> grpschList = manager.findGroupSchedule("g_id");
		request.setAttribute("grpschList", grpschList);
		return "/group/view.jsp";
    }
}