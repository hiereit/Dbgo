package controller.schedule;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dto.Schedule;

public class MonthlyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<Schedule> str = new ArrayList<>();
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd");  // 주의: 월을 나타내는 MM은 대문자
	    java.util.Date utilDate = df.parse("2020/11/11");
		
		str.add(new Schedule(utilDate,"빼빼로 데이"));
		utilDate = df.parse("2020/11/29");
		str.add(new Schedule(utilDate,"첫 눈"));
		utilDate = df.parse("2020/11/13");
		str.add(new Schedule(utilDate,"모르겠다"));
		
		request.setAttribute("test", str);
		return "/schedule/monthly.jsp";
	}

}
