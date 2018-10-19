<%-- 
	@JSP:teacherMyExamPaper.jsp
	@DATE:2018-10-10
	@Author:유영준
	@Desc:강사-내 시험지 페이지(스토리보드 23 of 41)
	
	@2018-10-10 현이 : 시험지 생성 탭 추가
	
	@2018-10-11 영준 : 시험지 탭 메뉴 통합
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath}/css/teacherMyExamPaper.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/teacherExamManagement.css" rel="stylesheet">
<%-- <script
	src="${pageContext.request.contextPath}/lib/onet-js/teacherMyExamPaper.js"></script>	 --%>
<!--main content start-->

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel div_table">
				<div class="panel-heading">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a data-toggle="tab" href="#overview">내
								시험지 </a></li>
						<li><a data-toggle="tab" href="#tempExamPaper"
								class="contact-map">임시 저장된 시험지 </a></li>
						<li><a data-toggle="tab" href="#examSchedule"
								class="contact-map">시험 일정 </a></li>
					</ul>
				</div>
				
				<div class="panel-body">
						<div class="tab-content">
							<!-- 내 시험지 탭 시작 -->
							<div id="overview" class="tab-pane active">
								<div class="row">
								<!-- 내 시험지 DeleteModal 시작-->
								<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
								<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">시험지 삭제</h4>
									<!-- modal-header 끝 -->
								</div>
								<div class="modal-body">정말 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<div class="form-group">
										<div class="col-lg-offset-2 col-lg-10">
											<button id="examPaperDeletebtn" name="examPaperDeletebtn" class="btn btn-theme" data-toggle="modal"
													data-dismiss="modal">예</button>
											<button class="btn btn-theme04" type="button"
													data-dismiss="modal">아니오</button>
										</div>
									</div>
								</div>
								<!-- modal-content 끝 -->
								</div>
							<!-- modal-dialog 끝 -->
							</div>
						<!-- 내 시험지 DeleteModal 끝 -->
						</div>
						
				
									<div id="div_myExam" class="col-md-12">
									<form class="insertForm">
										<a href="${pageContext.request.contextPath}/teacher/examPaperMake.do" class="examPaper-insert">
										<img src="../img/material-icon.png">
										<strong>새 시험지 만들기</strong></a>
									</form>
									<hr>
										<form action="" method="post" id="pickMyExamPaperForm">
											<div class="col-lg-12">
												<!-- 시험지 하나의 div 시작 -->
												<div id="examPaperDiv">
													
													<c:forEach items="${examPaperList}" var="examPaperList">

													<input type="hidden" id="exam-paper-num" value='${examPaperList.exam_paper_num}'/>
														

														<!-- 시험지 한 개 시작 -->
														<div class="exam-paper-name">
															<h4 id="exam-paper-name"><strong>${examPaperList.exam_paper_name}</strong></h4>

															<p id="exam-paper-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${examPaperList.exam_paper_desc}
													<div class="pdf_download text-right"><a href="#">PDF 다운로드
														<img src="../img/file-download.png"></a>
														<button type="button" id="deleteExamPaperBtn" name="deleteExamPaperBtn"
																class="btn btn-theme04 buttonGroup" data-toggle="modal"
																data-target="#DeleteModal" value="${exam_paper_name}">삭제</button>
														<button type="button" class="btn btn-theme buttonGroup"
														 onclick="location.href='${pageContext.request.contextPath}/teacher/examPaperModify.do?class_num=${param.class_num}'">시험지 수정</button>
														<button type="button" class="btn btn-theme buttonGroup" 

														onclick="location.href='${pageContext.request.contextPath}/teacher/examScheduleRegist.do?class_num=${param.class_num}&exam_paper_name=${examPaperList.exam_paper_name}&exam_paper_num=${examPaperList.exam_paper_num}&class_name=${param.class_name}'">시험 등록</button>

														<input type="hidden" id="hidden_class_num" value='${param.class_num}'>


														</div>
														<hr>
														<!-- 시험지 한 개 끝 -->
														</div>
														
													</c:forEach>

													</div>
												</div>
											</form>
										</div>
										<!-- 내 시험지 div 끝 -->
										</div>		
										<!-- /col-md-12 -->
									</div>
									<!-- 내 시험지 탭 끝-->

					<!-- 임시 저장된 시험지 tab 시작-->
					<div id="tempExamPaper" class="tab-pane">
						<div class="row">
							<div id="div_tempExam" class="col-md-12">
									<form class="insertForm">
										<a href="examPaperMake.do" class="examPaper-insert">
										<img src="../img/material-icon.png">
										<strong>새 시험지 만들기</strong></a>
									</form>
								<table class="table table-inbox table-hover" width="100%">
					
									<tbody>
										<tr>
											<td class="">
											<img src="${pageContext.request.contextPath}/img/friends/fr-05.jpg" 
												class="img-thumbnail" width="150px;"></td>
											<td class="exam_paper_name"><h4><strong>NCS HTML 시험(10/15까지 완성할 것)</strong></h4>
											<p>HTML + CSS 개념 및 활용</p></td>
											<td class="pdf_download text-right"><h5><a href="#">PDF 다운로드
											<img src="../img/file-download.png"></a></h5>
											<p><button class="btn btn-theme04 buttonGroup">삭제</button>
												<button class="btn btn-theme buttonGroup">시험지 수정</button>
												<button class="btn btn-theme buttonGroup"
												 		onclick="location.href='${pageContext.request.contextPath}/teacher/examScheduleUpdate.do'">시험 등록</button>

											</p>
											</td>
										</tr>
												
										<tr>
											<td class="">
											<img src="${pageContext.request.contextPath}/img/friends/fr-05.jpg" 
												class="img-thumbnail" width="150px;"></td>
											<td class="exam_paper_name"><h4><strong>NCS JAVASCRIPT 시험(10/30까지 완성할 것)</strong></h4>
											<p>자바스크립트 개념 및 활용</p></td>
											<td class="pdf_download text-right"><h5><a href="#">PDF 다운로드
											<img src="../img/file-download.png"></a></h5>
											<p><button class="btn btn-theme04 buttonGroup">삭제</button>
												<button class="btn btn-theme buttonGroup">시험지 수정</button>
												<button class="btn btn-theme buttonGroup" 
														onclick="location.href='${pageContext.request.contextPath}/teacher/examScheduleUpdate.do'">시험 등록</button>

											</p>
											</td>
										</tr>
								</tbody>
								<!-- /table end -->
								</table>
									

								</div>
								<!-- /overview -->
							</div>
						</div>
						
							<!-- 시험 일정 tab 시작 -->
							<div id="examSchedule" class="tab-pane">
								<div class="row">
								<!-- 시험 일정 DeleteModal 시작-->
								<div class="modal fade" id="scheduleDeleteModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
								<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">시험 일정 삭제</h4>
									<!-- modal-header 끝 -->
								</div>
								<div class="modal-body">정말 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<div class="form-group">
										<div class="col-lg-offset-2 col-lg-10">
											<button class="btn btn-theme" data-toggle="modal" 
													data-dismiss="modal" id="examScheduleDeletebtn"
													name="examScheduleDeletebtn">예</button>
											<button class="btn btn-theme04" type="button"
													data-dismiss="modal">아니오</button>
										</div>
									</div>
								</div>
								<!-- modal-content 끝 -->
								</div>
							<!-- modal-dialog 끝 -->
							</div>
						<!-- 시험 일정 DeleteModal 끝 -->
						</div>
									<div id="div_examSchedule" class="col-md-12">
										<form class="insertForm">
											<a href="" class="exam-insert">
											<img src="${pageContext.request.contextPath}/img/material-icon.png"><strong>새 시험 일정 등록</strong></a>
										</form>
										<hr>
										<form action="" method="post" id="pickExamScheduleForm">
											<div class="col-lg-12">
												<!-- 시험 일정 하나의 div 시작 -->
												<div id="examScheduleDiv">
													<c:forEach items="${examScheduleList}" var="examScheduleList">
													
													<input type="hidden" id="exam-info-num" value='${examScheduleList.exam_info_num}'/>
													
														<div class="exam_info_name">
														<h4 id="exam-info-name"><strong>${examScheduleList.exam_info_name}</strong></h4>
													<div class="view-schedule text-center">
													<p id="exam-info-date">시험 날짜 : ${examScheduleList.exam_info_date}</p>
													<p id="exam-info_start">시험 시간 : ${examScheduleList.exam_info_start} ~ <span id="exam-info-end">${examScheduleList.exam_info_end}</span></p>
													<p id="exam-info-time">[${examScheduleList.exam_info_time}]</p>
													<p id="exam-info-member">응시 대상 : ${examScheduleList.exam_info_member}</p>
													
													<button type="button" id="deleteExamScheduleBtn" name="deleteExamScheduleBtn"
															class="btn btn-theme04 buttonGroup" data-toggle="modal" 
															data-target="#scheduleDeleteModal" value="">삭제</button>
													<button type="button" class="btn btn-theme buttonGroup"
															onclick="location.href='${pageContext.request.contextPath}/teacher/examScheduleUpdate.do?class_num=${param.class_num}&exam_paper_name=${examScheduleList.exam_info_name}'">시험 일정 수정</button>
															
															<input type="hidden" id="hidden_class_num" value='${param.class_num}'>
													</div>	
													<br>
													<br>
														
													<hr>	
													</div>										
													</c:forEach>
													
											</div>
										</div>
										
									</form>

												
										
										<!-- /col-md-12 -->
									</div>
									<!-- /row -->

								<!-- /col-md-12 -->

								</div>
								<!-- 시험 일정 tab 끝 -->
							</div>
							<!-- /tab-content -->
						
					<!-- tab-panel -->
					</div>
					<!-- /row content-panel div_table -->
				</div>
				
						
							</div>	
						
			</div> <!-- row content-panel div_table -->
		
	</section>	<!-- wrapper site-min-height -->
</section> <!-- main-content -->

	<script
	src="${pageContext.request.contextPath}/lib/onet-js/examScheduleUpdate.js"></script> 
	<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
  	<script src="${pageContext.request.contextPath}/lib/tasks.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/onet-js/examManagement.js" type="text/javascript"></script>