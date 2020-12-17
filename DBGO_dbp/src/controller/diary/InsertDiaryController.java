package controller.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dto.Diary;
import model.service.Manager;

public class InsertDiaryController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/user/login/form";
		}

		Diary d = new Diary();
		d.setU_id(UserSessionUtils.getLoginUserId(request.getSession()));
		d.setD_date(request.getParameter("date"));
		d.setContent(request.getParameter("content"));

		if (request.getParameter("content") == null) {
			d.setContent("내용 없음");
		}

		Manager manager = Manager.getInstance();
		manager.insertDiary(d);

		return "redirect:/diary/list";
	}
}