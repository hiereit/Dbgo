package controller.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.Diary;
import model.service.Manager;

public class ViewDiaryController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String d_id = request.getParameter("d_id");
		Manager manager = Manager.getInstance();
		Diary diary = manager.findDiary(d_id);

		request.setAttribute("d_id", diary.getD_id());
		request.setAttribute("date", diary.getD_date());
		request.setAttribute("content", diary.getContent());
		return "/diary/view.jsp";
	}
}