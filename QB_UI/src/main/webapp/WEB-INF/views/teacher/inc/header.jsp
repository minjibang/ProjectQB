<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!--header start-->
<header class="header black-bg">
	
	<!--logo start-->
	
	<a href="${pageContext.request.contextPath}/teacher/teacherMain.do" class="logo"> 
	<img src="${pageContext.request.contextPath}/img/logo1.png" alt="QB_logo" class="QB_logo" style="height:45px;"/></a>
		<!-- 로고 후보:logo1.png // logo22.png // logo 33.png 각각 테스트 해보고 마음에 드는걸로 결정.
							다른 아이디어 (색깔 등등) 있으면 적극 수렴. -->
	<!--logo end-->
	
	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<!-- 정원 -->
			<div class="nav notify-row" id="top_menu">
				<ul class="nav top-menu">
					<li>
					<span id="className"></span>
					<span id="memberName"></span><span>(${pageContext.request.userPrincipal.name})</span>
					님 환영합니다.&nbsp;&nbsp;
					</li>
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
<script>
$(document).ready(function(){
	$('#noticeWrite_btn').click(function(){
		var class_name2 = $('#noticeWrite_btn').val();
		location.href="noticeWrite.do?class_name=" + class_name2;
	});
	$('#noticeWrite_btnAdmin').click(function(){
		var adminClass_name = $('#noticeWrite_btnAdmin').val();
		location.href="noticeWrite.do?class_name=" + adminClass_name;
	});
});
$.ajax({
		url:"../common/memberCheck.do",
		type:"get",
		success:function(data){
			$('#className').text(data[0].class_name);
			$('#memberName').text(data[0].member_name);
		},
		error:function(xml){
		}
	});
</script>

