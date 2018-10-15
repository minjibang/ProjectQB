<%-- 
	@JSP:notice.jsp
	@DATE:2018-10-06
	@Author:우한결
	@Desc:강사, 학생 메인 페이지(스토리보드 17, 35 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/notice.css" rel="stylesheet">
<!-- 강사, 학생 - 메인페이지 (클래스 공지사항, 시험일정) -->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<div class="row mt">
			<div class="col-sm-9">
				<section class="panel">
					<header class="panel-heading wht-bg">
						<h4 class="gen-case">공지사항</h4>
					</header>
					<div class="panel-body minimal">
						<div class="table-inbox-notice-wrap ">
							<table class="table table-inbox-notice table-hover" id="noticetable">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>첨부파일</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${notice }" var="notice">
										<tr class="" onClick="location.href='noticeDetail.do'">
											<td class="notice_num">${notice.notice_num }</td>
											<td class="notice_name">${notice.notice_name }</td>
											<td class="notice_file"><i class="fa fa-paperclip"></i></td>
											<td class="notice_member_id">${notice.member_id }</td>
											<td class="notice_date">${notice.notice_date }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div>
							<button id="noticeWrite_btn" class="btn btn-theme" onclick="location.href='noticeWrite.do'">글쓰기</button>
						</div>
					</div>
				</section>
				<section class="panel">
					<header class="panel-heading wht-bg">
						<h4 class="gen-case">시험 일정</h4>
					</header>
					<div class="panel-body minimal">
						<div class="table-inbox-wrap ">
							<table class="table table-inbox-exam table-hover" id="noticetable2">
								<thead>
									<tr>
										<th>시험번호</th>
										<th>시험 이름</th>
										<th>시험 시간</th>
										<th>응시 대상</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${exam_info}" var="exam_info">
										<tr class="" onClick="location.href='examScheduleDetail.do'">
											<td class="exam_info_num">${exam_info.exam_info_num }</td>
											<td class="exam_info_name">${exam_info.exam_info_name }</td>
											<td class="exam_info_date">${exam_info.exam_info_date }<br>
											${exam_info.exam_info_start } ~ ${exam_info.exam_info_end }<br>
											${exam_info.exam_info_time } 분</td>
											<td class="exam_info_member">${exam_info.exam_info_member }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</section>
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