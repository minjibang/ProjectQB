<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
teacherMain.jsp
한결
2018.10.10 
-->
<!-- 강사, 학생 - 메인페이지 (클래스 공지사항, 시험일정) -->
<link href="${pageContext.request.contextPath}/css/notice.css" rel="stylesheet">
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<div class="row mt">
			<div class="col-sm-9">
				<div class="content-panel noticePanelDiv" >
					<div class="panel-body">
						<!-- <section class="panel"> -->
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">공지사항</h4>
						</header>
						<div class="panel-body minimal">
							<div class="table-inbox-wrap ">
								<table class="table table-inbox table-hover" id="noticetable">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr class="" onClick="location.href='noticeView.do'">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message  dont-show">Google Inc.</td>
											<td class="view-message ">Your new account is ready.</td>
											<td class="view-message  inbox-small-cells"><i
												class="fa fa-paperclip"></i></td>
											<td class="view-message  text-right">08:10 AM</td>
										</tr>
										<tr class="" onClick="location.href='noticeView.do'">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message dont-show">Mark Thompson</td>
											<td class="view-message">Last project updates</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 15</td>
										</tr>
										<tr class="" onClick="location.href='noticeView.do'">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message dont-show">Wonder Corp.</td>
											<td class="view-message">Thanks for your registration</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 15</td>
										</tr>
										<tr class="" onClick="location.href='noticeView.do'">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message dont-show">>Facebook</td>
											<td class="view-message">New Friendship Request</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 13</td>
										</tr>
										<tr class="" onClick="location.href='noticeView.do'">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i
												class="fa fa-star inbox-started"></i></td>
											<td class="view-message dont-show">Mark Webber <span
												class="label label-danger pull-right">urgent</span></td>
											<td class="view-message">The server is down</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 09</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- </section> -->
					</div>
				</div>

				<div class="content-panel">
					<div class="panel-body">
						<!-- <section class="panel"> -->
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">시험 일정</h4>
						</header>
						<div class="panel-body minimal">
							<div class="table-inbox-wrap ">
								<table class="table table-inbox table-hover" id="noticetable2">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr class="">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message  dont-show">Google Inc.</td>
											<td class="view-message ">Your new account is ready.</td>
											<td class="view-message  inbox-small-cells"><i
												class="fa fa-paperclip"></i></td>
											<td class="view-message  text-right">08:10 AM</td>
										</tr>
										<tr class="" onClick="location.href='noticeView.do'">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message dont-show">Mark Thompson</td>
											<td class="view-message">Last project updates</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 15</td>
										</tr>
										<tr class="">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message dont-show">Wonder Corp.</td>
											<td class="view-message">Thanks for your registration</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 15</td>
										</tr>
										<tr class="">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message dont-show">>Facebook</td>
											<td class="view-message">New Friendship Request</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 13</td>
										</tr>
										<tr class="">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i
												class="fa fa-star inbox-started"></i></td>
											<td class="view-message dont-show">Mark Webber <span
												class="label label-danger pull-right">urgent</span></td>
											<td class="view-message">The server is down</td>
											<td class="view-message inbox-small-cells"></td>
											<td class="view-message text-right">March 09</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--       </section> -->
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<section class="panel">
					<div class="panel-body">
						<div class="profile-text">
							<h3>Today Exam</h3>
						</div>
						<ul class="nav nav-pillsnav-stacked  mail-nav">
							<li class="active"><a href="inbox.html"> <i
									class="fa fa-inbox"></i> Inbox <span
									class="label label-theme pull-right inbox-notification">3</span></a></li>
							<li><a href="#"> <i class="fa fa-envelope-o"></i> Send
									Mail
							</a></li>
							<li><a href="#"> <i class="fa fa-exclamation-circle"></i>
									Important
							</a></li>
							<li><a href="#"> <i class="fa fa-file-text-o"></i>
									Drafts <span
									class="label label-info pull-right inbox-notification">8</span></a></a>
							</li>
							<li><a href="#"> <i class="fa fa-trash-o"></i> Trash
							</a></li>
						</ul>
					</div>
				</section>
			</div>
		</div>
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->