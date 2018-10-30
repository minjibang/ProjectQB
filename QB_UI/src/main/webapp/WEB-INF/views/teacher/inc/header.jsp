<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!--header start-->
<header class="header black-bg">
	
	<!--logo start-->
	<a href="${pageContext.request.contextPath}/teacher/teacherMain.do" class="logo"><b>QB<span>QB</span></b></a>
	<!--logo end-->

	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<!-- 정원 -->
			<div class="nav notify-row" id="top_menu">
				<ul class="nav top-menu">
					<li id="header_inbox_bar">
					<a href="${pageContext.request.contextPath}/teacher/myMessage.do"> 
					<i class="fa fa-envelope-o"></i>
					<span class="badge bg-theme" id="message"></span>
					</a></li>
					<li id="header_inbox_bar"><a href="${pageContext.request.contextPath}/teacher/myPage.do"> <i
							class="fa fa-user"></i>
					</a></li>
				</ul>
			</div>
			<li><a class="logout" href="${pageContext.request.contextPath}/logout">Logout</a></li>
			<!--  -->
		</ul>
	</div>
</header>


<se:authorize access="isAuthenticated()">
<se:authentication property="principal.username" var="username"/>
<script>
var wsUri = "ws://localhost:8090/qb/count.do";


function send_message() {
	websocket = new WebSocket(wsUri);
	websocket.onopen = function(evt) {
        onOpen(evt);
    };
    websocket.onmessage = function(evt) {
    	console.log("send_message 에서  onmessage함수");
        onMessage(evt);
    };
    websocket.onerror = function(evt) {
        onError(evt);
    };

}



function onOpen(evt) 
{
   websocket.send("${username}");
}

function onMessage(evt) {
	console.log("onMessage 함수 실행")
		$('#message').append(evt.data);
}

function onError(evt) {

}


$(document).ready(function(){
	send_message();
	$('#noticeWrite_btn').click(function(){
		var class_name2 = $('#noticeWrite_btn').val();
		location.href="noticeWrite.do?class_name=" + class_name2;
	});
	
	$('#noticeWrite_btnAdmin').click(function(){
		var adminClass_name = $('#noticeWrite_btnAdmin').val();
		location.href="noticeWrite.do?class_name=" + adminClass_name;
	});
	
	
});


</script>
</se:authorize>

<!--header end-->

<!--header end-->

