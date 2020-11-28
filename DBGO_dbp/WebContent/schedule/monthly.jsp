<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<script src="../static/vendor/jquery/jquery.min.js"></script>
<link href="<c:url value='/css/fullcalendar.css' />" rel='stylesheet' />
<script src="<c:url value='/js/fullcalendar.js' />"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			header:{ left: "prev", center: "title", right: "next"},
			initialView : 'dayGridMonth',
			themeSystem : 'bootstrap',
			
			dateClick: function(info) {
				   alert('Date: ' + info.dateStr);
				   alert('Resource ID: ' + info.resource.id);
			}
			/*dateClick: function( selectionInfo ){
				alert('Date: ' + info.dateStr);
			} */
		});
		
		calendar.render();
	});
	function clickAdd(){
		var url = "./scheduleFormPopup.jsp";
		var name = "formPopup";
		var option ="width=800, height = 600, left = 100, top = 100, location = no, fullscreen =yes, scrollbars = 1";
		
		window.open(url, name, option);
	}
	

</script>
<meta charset="UTF-8">
<title>Monthly Calendar</title>
<style>
.navbar-brand {
            text-align: left;
            font: normal normal bold 30px/60px Binggrae;
            letter-spacing: 0px;
            color: #FCC416;
            opacity: 0.6;
    }
    .nav-link {
          font: normal normal normal 12px/15px Binggrae;
    }
    #calendar {
      width: 50%;
      height: 50%;
      margin-left: 25%;
      padding-top : 10px;
      padding-bottom: 40px;
    }

</style>
</head>
<body>
  	<%@include file="/navbar.jsp" %>
    <div id='calendar'></div>
</body>
</html>