package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.group.*;
import controller.group.schedule.*;
import controller.user.*;
import controller.schedule.*;
import controller.diary.*;

public class RequestMapping {
	private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

	private Map<String, Controller> mappings = new HashMap<String, Controller>();

	public void initMapping() {
		mappings.put("/", new ForwardController("index.jsp"));
		mappings.put("/main", new ForwardController("main.jsp"));

		mappings.put("/schedule/monthly", new MonthlyController());
		mappings.put("/schedule/create", new CreateScheduleController());
		mappings.put("/schedule/update", new UpdateScheduleController());
		mappings.put("/schedule/updateDrop", new UpdateDropController());

		mappings.put("/group/view", new ViewGroupController());
		mappings.put("/group/schedule/view", new ViewGroupScheduleController());
		mappings.put("/group/schedule/add", new InsertGroupScheduleController());
		mappings.put("/group/schedule/update", new UpdateGroupScheduleController());
		mappings.put("/group/schedule/delete", new DeleteGroupScheduleController());
		mappings.put("/group/list", new MyGroupListController());
		mappings.put("/group/create/form", new ForwardController("/group/creationForm.jsp"));
		mappings.put("/group/create", new CreateGroupController());
		mappings.put("/group/update", new AddMembersToGroupController());

		mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
		mappings.put("/user/login", new LoginController());
		mappings.put("/user/logout", new LogoutController());
		mappings.put("/user/view", new ViewUserController());
		mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
		mappings.put("/user/register", new RegisterUserController());

		mappings.put("/user/update/form", new UpdateUserFormController());
		mappings.put("/user/update", new UpdateUserController());
		mappings.put("/user/delete", new DeleteUserController());

		mappings.put("/diary/register", new ForwardController("/diary/registerDiaryForm.jsp"));
		mappings.put("/diary/list", new MyDiaryListController());
		mappings.put("/diary/view", new ViewDiaryController());
		mappings.put("/diary/insert", new InsertDiaryController());
		mappings.put("/diary/delete", new DeleteDiaryController());

		logger.info("Initialized Request Mapping!");
	}

	public Controller findController(String uri) {   
		return mappings.get(uri);
	}
}