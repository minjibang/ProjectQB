<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
teacherMain.jsp
한결
2018.10.10 
-->
<link href="${pageContext.request.contextPath}/css/teacherMain.css" rel="stylesheet">

<!-- 강사, 학생 - 메인페이지 (클래스 공지사항, 시험일정) -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
			<div class="col-lg-12 mt fluid-container">
				<div class="row content-panel div_table">
					<!-- 클래스 공지사항 -->
					
					<div id="div_noticePannel" class="col-md-12">
						<h2 id="notice_H2">클래스 공지사항</h2>
						<div id="div_notice">
							<table id="notice_Table" class="display">
								<thead>
									<tr>
										<th class="notice_num">글번호</th>
										<th class="notice_name">제목</th>
										<th class="notice_date">작성일</th>
										<th class="member_id">작성자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${notice}" var="notice">
									<tr>
										<td class="notice_num">${notice.notice_num}</td>
										<td class="notice_name"><a href="noticeView.do">${notice.notice_name }</a></td>
										<td class="notice_date">${notice.notice_date }</td>
										<td class="notice_id">${notice.member_id }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<!-- Security 또는 Session에서 권한이 강사일 경우만 글쓰기 활성화 -->
							<div>
								<button id="noticebtn" class="btn btn-info"
									onclick="location.href='teacherNoticeWrite.do'" >글쓰기</button>
							</div>
						</div>

					</div>
					<!-- /클래스 공지사항 -->
					<!-- 시험일정 -->
					<div id="" class="col-md-12">
						<h2 id="examinfo_H2">시험 일정</h2>
						<div id="div_examinfo">
							<table id="exam_info_Table" class="display">
								<thead>
									
									<tr>
										<th class="exam_info_num">시험 번호</th>
										<th class="exam_info_name">시험 이름</th>
										<th class="exam_info">시험 시간</th>
										<th class="exam_info_member">응시 대상</th>
									</tr>
									
								</thead>
								<tbody>
									<c:forEach items="${exam_info}" var="exam_info">
									<tr>
										<td class="exam_info_num">${exam_info.exam_info_num }</td>
										<td class="exam_info_name"><a href="examScheduleDetail.do">${exam_info.exam_info_name }</a></td>
										<td class="exam_info">${exam_info.exam_info_date } <br>
											${exam_info.exam_info_start } ~ ${exam_info.exam_info_end }<br>${exam_info.exam_info_time }분
										</td>
										<td class="exam_info_member">${exam_info.exam_info_member}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /시험 일정 -->
				</div>
				<!-- /col-lg-12 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->