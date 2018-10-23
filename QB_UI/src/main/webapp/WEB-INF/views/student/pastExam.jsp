<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link
	href="${pageContext.request.contextPath}/css/studentPastExam.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/lib/onet-js/pastExam.js"></script> 
	
<!-- 학생 - 지난 시험 보기-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
		<div class="col-lg-12">
			<div class="row content-panel">
				<!-- /panel-heading -->
				<div class="panel-body">

					<div id="overview" class="all_class_div">
						<table class="title_table">
							<tr>
								<td class="title_table_fst_td">
									<p id="student_name">${member_name}</p>  
								</td>
							</tr>
							<tr>
								<td>
								<div class="search_box">
										<input type="text" class="form-control" id="search_input" placeholder="키워드를 입력하세요.">
										<button class="btn btn-theme" id="exam_rewindBtn">검색</button>
									</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="last_exam_div">
							<table class="last_exam_table">
								<!-- 하나의 시험정보 시작 -->
								<c:forEach var="examInfo" items="${examInfoList}">
									<tr class="exam_line">
										<td class="pastExamTd">
											<h3>${examInfo.exam_info_name}</h3> 
											<span>${examInfo.exam_info_desc}</span>
										</td>
										<td class="pastExamTd">
											<div>시험 날짜 : ${examInfo.exam_info_date}</div>
											<div>시험 시간 : ${examInfo.exam_info_start} ~ ${examInfo.exam_info_end}</div>
											<div>[${examInfo.exam_info_time}]</div>
										</td>
										<td class="btn_td">
											<button class="btn btn-theme" id="pastExamBtn" value="${examInfo.exam_info_num}">다시 보기</button>
										</td>
									</tr>
								</c:forEach>
								<!-- 하나의 시험정보 끝 -->
							</table>
						</div>
					</div>
					<!-- /tab-content -->
				</div>
				<!-- /panel-body -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<!-- /col-lg-12 -->
		</div>
	</section>
	<!-- /wrapper -->
</section>