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
			initialView : 'dayGridMonth',
			themeSystem : 'bootstrap'
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
<title>Insert title here</title>
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
    }

</style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <a class="navbar-brand" href="#">DBGO!</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto">
            <a class="nav-link active" href="#">&nbsp;&nbsp;&nbsp;빠른 일정 추가</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"></a>
          </li>
        </ul>
        <button class="btn"><i class="fa fa-bell fa-2x" aria-hidden="true" style="color:white;"></i></button>
        <button class="btn"><i class="fa fa-address-book fa-2x" aria-hidden="true" style="color:white;"></i></button>
        <button class="btn"><i class="fa fa-sign-out fa-2x" aria-hidden="true" style="color:white;"></i></button>
      </div>
    </nav>
    <div id='calendar'></div>
</body>
</html>