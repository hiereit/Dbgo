<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>일기 작성</title>
<link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
<link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />
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
<style>
	.diary {
		background: #EFFBEF;
		margin: auto;
		width: 50%;
	}

	.centerElement {
		padding-top: 80px;
	}
      #form-div {
      	padding: 61px 69px;
        background: #FFFFFF 0% 0% no-repeat padding-box;
        box-shadow: 0px 3px 50px #CECECE;
        opacity: 1;
        position:absolute;
        -webkit-border-radius: 50px;
        width: 50%;
      }
       .btn-rounded {
        width: 80px;
        float: right;
        margin-bottom: 10px;
        border-radius: 30px!important;
        text-align: center;
        font-family: JSDongkang-Bold;
		font-size: 18px;
        color: #ffffff;
      }
      #byte {
      	float: right;
      	font-family: JSDongkang-Regular;
      }
</style>
<script>
function fnChkByte(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;

    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";

    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4)
        {
            rbyte += 2;
        }
        else
        {
            rbyte++;
        }


        if(rbyte <= maxByte)
        {
            rlen = i+1;
        }
     }


     if(rbyte > maxByte)
     {
  		alert("더이상 입력할 수 없습니다.");
 		 str2 = str.substr(0,rlen);
  		obj.value = str2;
 		 fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo').innerText = rbyte;
     }
}
</script>
</head>
<body>
  	<%@include file="/navbar.jsp" %>
	<div class="centerElement">
			<div class="diary">
	<div id="form-div">
      <form name="form" method="POST" action="<c:url value='/diary/insert'/>">
          <fieldset>
           <button type="submit" id="subBtn" class="btn btn-warning btn-rounded">등록</button>
           <div class="form-group">
	      <label for="exampleTextarea" style="font-family: JSDongkang-Bold; font-size: 18px;">일기 작성</label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="diaryDate" placeholder="날짜" name="date" style="font-family: JSDongkang-Regular; font-size: 18px; margin-top: 15px;">
              </div>
          <hr>
	      <textarea name="content" class="form-control" id="exampleTextarea" rows="3" maxlength="1500"  onKeyUp="javascript:fnChkByte(this,'1500')" style="font-family: JSDongkang-Regular; margin-top: 0px; margin-bottom: 0px; height: 336px;"></textarea>
	    	<br/>
			<div id="byte"><span id="byteInfo">0</span>/1500</div>
	    </div>
        </fieldset>
      </form>
    </div>
    </div>
    </div>
</body>
</html>