<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
    <link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
    <link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />
    <title>My Group View</title>
    <script language="JavaScript">
    	function findSchedule(targetUri) {
    		form.action = targetUri;
    		form.submit();
    	}
    </script>
    <style>
      table.table-bordered{
        font: normal normal normal 18px JSDongkang-Regular;
        text-align: center;
      }
      .tdiv{
        border:2px solid #CCCCCC;
        float:left;
        margin:auto;
        width: 300px;
        height: 510px;
        margin:10px;
      }
      .list-group{
        margin:auto;
        width: 305px;
        margin-left:13px;
        margin-top:13px;
        }
       .card {
         position:absolute;
         width: 300px;
         height: 390px;
         left:51%;
         top:23%;
         font: normal normal normal 18px JSDongkang-Regular;
        }
        .wrap {
          position:absolute;
          left:30%;
          top:20%;
        }
        .mb-1 {
        font: normal normal normal 18px JSDongkang-Regular;
        }
    </style>
  </head>
  <body>
  <%@include file="/navbar.jsp" %>
    <div class="wrap">
    <div class="tdiv">
    <table class="table table-bordered">
  	<c:forEach var="grpsch" items="${grpschList}">
      <tr>
        <th scope="row">${grpsch.groupsch_date}</th>
        <td onClick="findSchedule('<c:url value='/group/view'/>')">${grpsch.title}</td>
      </tr>
     </c:forEach>
    </table>
    </div>
    <ul class="list-group">
  <li class="list-group-item list-group-item-warning" style="padding-top:20px;padding-bottom:20px;
        text-align: center;">
      <h5 class="mb-1">${grpsch.homework}</h5>
  </li>
</ul>
<div class="card border-warning mb-3">
  <div class="card-header">기록</div>
  <div class="card-body">
    <p class="card-text">${grpsch.memo}</p>
  </div>
</div>
</div>
  </body>
</html>