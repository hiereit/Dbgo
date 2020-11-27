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
        height: 550px;
        margin:10px;
      }
      .list-group{
        margin:auto;
        width: 305px;
        margin-left:13px;
        margin-top:13px;
		font: normal normal normal 18px JSDongkang-Regular;
        }
       .card {
         position:absolute;
         width: 300px;
         height: 370px;
         left:51%;
         top:33%;
         font: normal normal normal 18px JSDongkang-Regular;
        }
        .wrap {
          position:absolute;
          left:30%;
          top:20%;
        }
    </style>
  </head>
  <body>
  <%@include file="/navbar.jsp" %>
    <div class="wrap">
    <div class="tdiv">
    <table class="table table-bordered">
      <tr>
        <th scope="row">11월 28일</th>
        <td>알고리즘 설계1</td>
      </tr>
      <tr>
        <th scope="row">12월 1일</th>
        <td>알고리즘 설계2</td>
      </tr>
      <tr>
        <th scope="row">12월 8일</th>
        <td>알고리즘 설계3</td>
      </tr>
    </table>
    </div>
    <ul class="list-group">
  <li class="list-group-item list-group-item-warning">
      <h5 class="mb-1">연습문제 질의응답</h5>
      <h5 class="mb-1">한글 파일 예제 질의응답</h5>
  </li>
  <li class="list-group-item">
    <h8 class="mb-1">다음 일정</h8>
    <p class="mb-1">12월 1일 (목) 20:30</p>
  </li>
</ul>
<div class="card border-warning mb-3">
  <div class="card-header">기록</div>
  <div class="card-body">
    <p class="card-text">그리드 알고리즘에 관한 퀴즈 풀이</p>
  </div>
</div>
</div>
  </body>
</html>