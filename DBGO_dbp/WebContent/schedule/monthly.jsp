<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.dto.Schedule"%>
<% java.util.List<Schedule> schedules = (java.util.List<Schedule>)request.getAttribute("schedules");%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
    <script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link href="<c:url value='/css/fullcalendar.css' />" rel='stylesheet' />
<script src="<c:url value='/js/fullcalendar.js' />"></script>
<link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />
<link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<title>Monthly Calendar</title>
<style>
    #calendar {
      width: 50%;
      height: 50%;
      margin: auto;
      margin-top : 30px;
      padding-bottom: 40px;
      font: normal normal normal 20px JSDongkang-Regular;
    }
	::placeholder {
        color: #B8B8B8;
    }
      label[for="selectCategory"] {
        padding-bottom: 0px;
        padding-top: 0px;
      }
      .inputContent i {
        font-size: 30px/40px;
        color: #B8B8B8;
        padding-bottom: 0px;
        padding-top: 6px;
      }
      .inputContent input {
        text-align: left;
        font: normal normal normal 18px JSDongkang-Regular;
        letter-spacing: 0px;
        color: #000000;
        opacity: 1;
      }
      #inputScheduleTitle {
        text-align: left;
        font-family: JSDongkang-Bold;
		font-size: 20px;
        letter-spacing: 0px;
        color: #000000;
        opacity: 1;
      }
      .btn-rounded {
        width: 60px;
        height: 30px;
        float: right;
        margin-left: 10px;
        border-radius: 40px!important;
        text-align: center;
        font-family: JSDongkang-Bold!important;
		font-size: 15px;
        color: #ffffff;
      }
      hr {
        margin-top: 15px;
    	margin-bottom: 15px;
      }
      .selectCategory {
        border:0px;
        outline:0px;
        padding-left: 20px;
        text-align: left;
        font-family: JSDongkang-Bold;
		font-size: 20px;
        letter-spacing: 0px;
        color: #B8B8B8;
        opacity: 1;
      }
      .row {
        text-align: center;
      }
      .modal {
	        padding: 61px 69px;
	        background: #FFFFFF 0% 0% no-repeat padding-box;
	        box-shadow: 0px 3px 50px #CECECE;
	        opacity: 1;
	        position:absolute;
	        margin: auto;
	        -moz-border-radius: 50px;
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        .fc-time{
   display : none;
}
.fc .fc-list-event-dot {
    display: inline-block;
    box-sizing: content-box;
    width: 0;
    height: 0;
    border: 5px solid #f3969a;
    border: calc(var(--fc-list-event-dot-width, 10px) / 2) solid var(--fc-event-border-color, #f3969a);
    border-radius: 5px;
    border-radius: calc(var(--fc-list-event-dot-width, 10px) / 2);
  }
  .fc-v-event { /* allowed to be top-level */
  display: block;
  border: 1px solid #f3969a;
  border: 1px solid var(--fc-event-border-color, #f3969a);
  background-color: #f3969a;
  background-color: var(--fc-event-bg-color, #f3969a)

}
.fc-h-event { /* allowed to be top-level */
  display: block;
  border: 1px solid #f3969a;
  border: 1px solid var(--fc-event-border-color, #f3969a);
  background-color: #f3969a;
  background-color: var(--fc-event-bg-color, #f3969a)

}
</style>
<script>
	 var calendar;
	 
	 var HashMap = function(obj) {
		 var mapData = (obj != null) ? cloneObject(obj) : new Object();
		 
		 this.put = function(key, value) {
				mapData[key] = value;
			}
		 this.get = function(key) {
				return mapData[key];
			}
		 this.containsKey = function(key) {
				for (var tKey in mapData) {
					if (tKey == key) {
						return true;
					}
				}
				return false;
			}
	 }	 
	 
	 function getFormatDate(date){
		    var year = date.getFullYear();              //yyyy
		    var month = (1 + date.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
	 
	 var memo = new HashMap();
		var category = new HashMap();
	 <%
		for (int i = 0; i < schedules.size(); i++) {
			Schedule s = schedules.get(i);
		%>
		memo.put('<%= s.getSch_id() %>', '<%= s.getMemo() %>');
		category.put('<%= s.getSch_id() %>', '<%= s.getCategory() %>');
		<%
		}%>

	function updateDrop(param){
		 $.ajax({
             type: 'POST',
             url: '/schedule/updateDrop',
             data: param,
             dataType: 'text',
             success: function() {
                location.reload();
                
             }, error: function(request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
          });
	}
		
	document.addEventListener('DOMContentLoaded', function() {
		var initialLocaleCode = 'ko';
		var calendarEl = document.getElementById('calendar');
		
		calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			themeSystem : 'bootstrap',
			dateClick: function(info) {
				    $('#newStartDate').val(info.dateStr);
				   $('#myModal').show(); 
			},
			editable: true,
			droppable: true,
			dragRevertDuration: 0,
            eventDrop: function(eventDropInfo) {
            	var newEventObj = eventDropInfo.event;
                var oldEventObj = eventDropInfo.oldEvent;
                
                var changeId = oldEventObj.id;
                var changeStart = moment(newEventObj.start).format('YYYY-MM-DD');
                var param;
                if (oldEventObj.end == null) {
                	 param = 'sch_id='+changeId+'&start_date='+changeStart;
                }
                else {
                	var changeEnd = moment(newEventObj.end).format('YYYY-MM-DD');
                	param = 'sch_id='+changeId+'&start_date='+changeStart+'&end_date='+changeEnd;
                }
        	
                updateDrop(param);
             
            },
			events: [
				<%
				for (int i = 0; i < schedules.size(); i++) {
					Schedule s = schedules.get(i);
					String color = null;
					switch (s.getCategory()) {
					case "학교":
						color = "#56cc9d";
						break;
					case "친구":
						color = "#ffce67";
						break;
					case "가족":
						color = "#6cc3d5";
						break; 
					}
				%>
				{
					id: '<%= s.getSch_id() %>',
					title: '<%= s.getTitle() %>',
					start: '<%= s.getStart_date() %>',
					end: '<%= s.getEnd_date() %>'+" 23:59:59",
					color: '<%= color %>'
				},
				<%
				}
				%>
			],
			displayEventTime: false,
			headerToolbar: {
			    left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,listWeek'
			},
			locale: initialLocaleCode,
			eventClick: function(info) {
			      var eventObj = info.event;
			      $("#myModal2 option:contains(" + category.get(eventObj.id) +")").prop('selected', true);
			      $('#myModal2 #inputScheduleTitle').val(eventObj.title); 
			      $('#updateStartDate').val(getFormatDate(eventObj.start)); 
			      if (eventObj.end != null) {
			    	  $('#updateEndDate').val(getFormatDate(eventObj.end)); 
			      }
			      if (memo.containsKey(eventObj.id)) {
	                  if (memo.get(eventObj.id) != "null") {
	                     $('#myModal2 #inputMemo').val(memo.get(eventObj.id));
	                  }
	               }
			      $('#myModal2 form').append('<input type="hidden" name="sch_id" value="'+  eventObj.id +'" >');
			      $('#myModal2').show(); 
			    }
		});
		
		calendar.render();
	});
	
	

	function add() {
		if (form.title.value == "") {
			alert("일정 제목을 입력하십시오.");
			form.title.focus();
			return false;
		}
		if (form.startDate.value == "") {
				alert("시작 날짜를 입력하십시오.");
				form.startDate.focus();
				return false;
		}
		if (form.category.value == "카테고리") {
			 alert("카테고리를 선택하십시오.");
				form.category.focus();
				return false;
		 }
	
		form.submit();

	  }
	
	function upd() {
		if (update.title.value == "") {
			alert("일정 제목을 입력하십시오.");
			update.title.focus();
			return false;
		}
		if (update.startDate.value == "") {
				alert("시작 날짜를 입력하십시오.");
				update.startDate.focus();
				return false;
		}
		if (update.category.value == "카테고리") {
			 alert("카테고리를 선택하십시오.");
				update.category.focus();
				return false;
		 }
		$('#myModal2 form').append('<input type="hidden" name="btn" value="update" >');
		update.submit();
	  }
	function del() {
		 $('#myModal2 form').append('<input type="hidden" name="btn" value="delete" >');
		update.submit();
	  }	
	

	function getval(sel)
	{
		switch (sel.value) {
			case "기본":
				document.getElementById("cateIcon").style.color = "#f3969a"
				break;
			case "학교":
				document.getElementById("cateIcon").style.color = "#56cc9d"
				break;
			case "친구":
				document.getElementById("cateIcon").style.color = "#ffce67"
				break;
			case "가족":
				document.getElementById("cateIcon").style.color = "#6cc3d5"
				break;
		}
	}
	function reply_click(clicked_id)
	{
	    alert(clicked_id);
	}

	$( function(){
	    $("#newStartDate, #newEndDate, #updateStartDate, #updateEndDate").datepicker({
	    	dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	    });
	  } );
</script>


</head>
<body>
  	<%@include file="/navbar.jsp" %>
    <div id='calendar'></div>
    
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
		<form name="form" method="POST" 
		action="<c:url value='/schedule/create'/>">
        <fieldset>
          <button type="button" id="subBtn" class="btn btn-warning btn-rounded" onClick="add()">등록</button>
          <a href="<c:url value='/schedule/monthly' />"><button type="button" class="btn btn-warning btn-rounded">취소</button></a>
          <div class="form-group row" >
            <label id="cateIcon" for="selectCategory" class="col-md-1 col-form-label"><i class="fa fa-folder" aria-hidden="true"></i></label>
        
              <select name="category" class="selectCategory" onchange="getval(this);">
                <option selected>카테고리</option>
                <option>기본</option>
                <option>학교</option>
                <option>친구</option>
                <option>가족</option>
              </select>
          
          </div>
          <div class="form-group">
            <input type="text" class="form-control-plaintext" id="inputScheduleTitle" placeholder="일정 제목" name="title">
          </div>
          <hr>
          <div class="inputContent">
            <div class="form-group row">
              <label class="col-md-1 col-form-label "><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-range" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
  <path d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"/>
</svg></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="newStartDate" placeholder="시작 날짜" name="startDate" readonly>
                <input type="text" class="form-control-plaintext" id="newEndDate" placeholder="마지막 날짜" name="endDate" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label for="inputMemo" class="col-md-1 col-form-label"><i class="fa fa-sticky-note"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputMemo" placeholder="메모" name="memo">
              </div>
            </div>
          </div>
        </fieldset>
      </form>
		</div>
		</div>
		
		
		 <div id="myModal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
		<form name="update" method="POST" 
		action="<c:url value='/schedule/update'/>">
        <fieldset>
        <button type="button" id="deleteBtn" class="btn btn-warning btn-rounded" value="delete" onClick="del()">삭제</button>
          <button type="button" id="updateBtn" class="btn btn-warning btn-rounded" value="update" onClick="upd()">수정</button>
          <a href="<c:url value='/schedule/monthly' />"><button type="button" class="btn btn-warning btn-rounded">취소</button></a>
          <div class="form-group row" >
            <label for="selectCategory" class="col-md-1 col-form-label"><i class="fa fa-folder" aria-hidden="true"></i></label>
        
              <select name="category" class="selectCategory">
                <option selected>카테고리</option>
                <option>기본</option>
                <option>학교</option>
                <option>친구</option>
                <option>가족</option>
              </select>
          
          </div>
          <div class="form-group">
            <input type="text" class="form-control-plaintext" id="inputScheduleTitle" placeholder="일정 제목" name="title">
          </div>
          <hr>
          <div class="inputContent">
            <div class="form-group row">
              <label class="col-md-1 col-form-label "><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-range" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
  <path d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"/>
</svg></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="updateStartDate" placeholder="시작 날짜" name="startDate" readonly>
                <input type="text" class="form-control-plaintext" id="updateEndDate" placeholder="마지막 날짜" name="endDate" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label for="inputMemo" class="col-md-1 col-form-label"><i class="fa fa-sticky-note"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputMemo" placeholder="메모" name="memo">
              </div>
            </div>
          </div>
        </fieldset>
      </form>
		</div>
		</div>
</body>
</html>