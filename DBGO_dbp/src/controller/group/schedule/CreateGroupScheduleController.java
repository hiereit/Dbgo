package controller.group.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import controller.Controller;
import model.dao.ScheduleDAO;
import model.dao.GroupScheduleDAO;
import model.dto.*;

public class CreateGroupScheduleController implements Controller{
	//그룹 일정 등록하기
	
	//그룹 등록하는 화면에서 넘어온다.
	
	String groupName;
	private ScheduleDAO schDAO = new ScheduleDAO();
	private GroupScheduleDAO g_schDAO = new GroupScheduleDAO();
	//private GroupSchedule gs = new GroupSchedule();
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	
		
		int gSch_id, g_id;
		String gSCh_hw, gSch_memo, gSch_title, gSchStartDate, gSchEndDate; 
		
		//Date gSch_date;
		
		gSch_id = Integer.parseInt(request.getParameter("gShcId"));
		g_id = Integer.parseInt(request.getParameter("gId"));
		gSchStartDate = request.getParameter("gSchStartDate");
		gSchEndDate = request.getParameter("gSchEndDate");
		
		//String >> Date 형변환 작업
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //<< 여기 부분 수정 필요
		Date gSch_start_date = (Date)transFormat.parse(gSchStartDate);
		Date gSch_end_date = (Date)transFormat.parse(gSchEndDate);

		GroupSchedule gSch = new GroupSchedule(g_id, gSch_id, gSch_start_date, gSch_end_date,
									request.getParameter("gSchMemo"), request.getParameter("gSchHW"), 
									request.getParameter("gSchTitle"));
		
		//입력한 멤버를 받기..
		//List memberList = (List<User>)request.getAttribute("memberList");
		
		//GroupSchedule에서 groupSchedule 객체 삽입
		g_schDAO.createGroupSchedule(gSch);		
			
		return "/group/main";
	}


}
