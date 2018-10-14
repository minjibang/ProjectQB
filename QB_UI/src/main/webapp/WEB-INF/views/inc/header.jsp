<!-- 공통 inc 폴더 밑의 header가 아니라, 각 권한별 inc 폴더 밑의 header.jsp 를 사용할 예정 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--header start-->
<header class="header black-bg">
	
	<!--logo start-->
	<a href="#" class="logo"><b>QB<span>QB</span></b></a>
	<!--logo end-->

	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<!-- 정원 -->
			<div class="nav notify-row" id="top_menu">
				<ul class="nav top-menu">
					<li id="header_inbox_bar">
					<a href="${pageContext.request.contextPath}/common/myMessage.do"> 
					<i class="fa fa-envelope-o"></i>
					<span class="badge bg-theme">5</span>
					</a></li>
					<li id="header_inbox_bar"><a href="${pageContext.request.contextPath}/common/mypage.do"> 
					<i class="fa fa-user"></i>
					</a></li>
				</ul>
			</div>
			<li><a class="logout" href="">Logout</a></li>
		</ul>
	</div>
</header>
<!--header end-->