package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.group.*;
import controller.user.*;
import controller.schedule.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	mappings.put("/", new ForwardController("index.jsp"));
    	mappings.put("/main", new ForwardController("main.jsp"));
    	mappings.put("/schedule/monthly", new ForwardController("/schedule/monthly.jsp"));
    	
    	mappings.put("/group/view", new ForwardController("/group/view.jsp"));
    	mappings.put("/group/list", new MyGroupListController());
    	mappings.put("/group/create/form", new ForwardController("/group/creationForm.jsp"));
        mappings.put("/group/create", new CreateGroupController());
    	
    	mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
        
        mappings.put("/user/update/form", new UpdateUserFormController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/delete", new DeleteUserController());
        
        mappings.put("/schedule/monthly", new MonthlyController());
        
    	/*

        mappings.put("/user/list", new ListUserController());
        
        mappings.put("/community/update/form", new UpdateCommunityController());
        mappings.put("/community/update", new UpdateCommunityController());
        */
        logger.info("Initialized Request Mapping!");
        
    }

    public Controller findController(String uri) {	
        return mappings.get(uri);
    }
}
