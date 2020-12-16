package controller.diary;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.DiaryDAO;
import model.dto.Diary;
import model.dto.GroupInfo;
import model.dto.GroupSchedule;
import model.service.Manager;

public class MyDiaryListController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";
        }
		String u_id = UserSessionUtils.getLoginUserId(request.getSession());
		Manager manager = Manager.getInstance();
		List<Diary> mDiaryList = manager.findAllDiaries(u_id);
		Collections.sort(mDiaryList, new Diary.SortByDate());
		
		request.setAttribute("u_id", u_id);
		request.setAttribute("mDiaryList", mDiaryList);
		return "/diary/myDiaryList.jsp";
	}
}
