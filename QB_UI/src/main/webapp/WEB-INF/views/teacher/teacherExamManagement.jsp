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
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
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
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div id="div_myExam" class="col-md-12">
									<form>
										<a href="examPaperMake.do" class="examPaper-insert">
										<img src="../img/material-icon.png">
										<strong>새 시험지 만들기</strong></a>
									</form>
									<table id="myExam_table" class="display" width="100%">
										<tbody>
											<thead>
											</thead>
											<tr>
												<td class="exam_paper_name" width="70%"><h4><strong>JAVA의 기본</strong></h4>
												<p>변수|배열|FOR문|IF문</p></td>
												<td class="pdf_download text-right"><h5><a href="#">PDF 다운로드
													<img src="../img/file-download.png"></a></h5>
													<p><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button type="button" class="btn btn-theme buttonGroup" onclick="location.href='teacherExamPaperUpdate.do'">
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
												<tr>
													<td class="exam_paper_name" width="70%"><h4><strong>C++ 기본</strong></h4>
													<p>변수|배열|FOR문|IF문</p></td>
													<td class="pdf_download text-right"><h5><a href="#">PDF 다운로드
													<img src="../img/file-download.png"></a></h5>
													<p><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button class="btn btn-theme buttonGroup" onclick="location.href='teacherExamPaperUpdate.do'" >
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
												<tr>
													<td class="exam_paper_name" width="70%"><h4><strong>PYTHON 기본</strong></h4>
													<p>변수|배열|FOR문|IF문<p></td>
													<td class="pdf_download text-right"><h5><a href="#">PDF 다운로드
													<img src="../img/file-download.png"></a></h5>
													<p><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button class="btn btn-theme buttonGroup" onclick="location.href='teacherExamPaperUpdate.do'">
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
											</tbody>
											<!-- 내 시험지 table 끝 -->
										</table>			
										<!-- /col-md-12 -->
									</div>
									<!-- /row -->

							<!-- /col-md-12 -->
							</div>	
						<!-- /row -->
						</div>
				<!-- /overview -->
				
			
					<!-- 임시 저장된 시험지 tab 시작-->
					<div id="tempExamPaper" class="tab-pane">
						<div class="row">
							<div id="div_tempExam" class="col-md-12">
									<form>
										<a href="examPaperMake.do" class="examPaper-insert">
										<img src="../img/material-icon.png">
										<strong>새 시험지 만들기</strong></a>
									</form>
								<table id="tempExam_table" class="display" width="100%">
					
									<tbody>
										<thead>
										</thead>
										<tr>
											<td class="exam_paper_name"><h4><strong>NCS HTML 시험(10/15까지 완성할 것)</strong></h4>
											<p>HTML + CSS 개념 및 활용</p></td>
											<td class="pdf_download text-right"><h5><a href="#">PDF 다운로드
											<img src="../img/file-download.png"></a></h5>
											<p><button class="btn btn-theme04 buttonGroup">
												<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
												<button class="btn btn-theme buttonGroup">
												<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
												<button class="btn btn-theme buttonGroup" onclick="location.href='teacherExamPaperUpdate.do'">
												<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
											</p>
											</td>
										</tr>
												
										<tr>
											<td class="exam_paper_name"><h4><strong>NCS JAVASCRIPT 시험(10/30까지 완성할 것)</strong></h4>
											<p>자바스크립트 개념 및 활용</p></td>
											<td class="pdf_download text-right"><h5><a href="#">PDF 다운로드
											<img src="../img/file-download.png"></a></h5>
											<p><button class="btn btn-theme04 buttonGroup">
												<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
												<button class="btn btn-theme buttonGroup">
												<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
												<button class="btn btn-theme buttonGroup" onclick="location.href='teacherExamPaperUpdate.do'">
												<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
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
									<div id="div_examSchedule" class="col-md-12">
										<form>
											<a href="" class="exam-insert"> <img
											src="../img/material-icon.png"> <strong>새 시험 일정
												등록</strong></a>
										</form>
										<table id="examSchedule_table" class="display" width="100%">
											<tbody>
											<thead>
											</thead>
												<tr>
													<td class="exam_paper_name"><h4>
													<strong>자바의 기본 개념과 활용</strong></h4>
													<p>정의|개념|클래스|메소드</p></td>
													<td class="exam_schedule">
													<p>시험 날짜 : 2018.08.15</p>
													<p>시험 시간 : 14:00:00 ~ 14:50:00 [50분]</p>
													<p>응시 대상 : 전체</p>
													<td><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험 일정 수정</button>
													</td>

												</tr>

												<tr>
													<td class="exam_paper_name"><h4>
															<strong>자바의 기본 개념과 활용<br>(재시험)
															</strong>
														</h4>
														<p>정의|개념|클래스|메소드</p></td>
														<td class="exam_schedule">
														<p>시험 날짜 : 2018.08.22</p>
														<p>시험 시간 : 17:00:00 ~ 17:50:00 [50분]</p>
														<p>응시 대상 : JAVA 1차 60점 미만</p></td>
													<td><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험 일정 수정</button>
													</td>
												</tr>
											</tbody>
											<!-- /table -->
										</table>
										
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
				<!-- /col-lg-12 mt -->
			</div>
		</div>
		<!-- /row mt -->
		</div>
		<!-- /wrapper -->
	</section>
	<!-- /main-content -->
</section>
	<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
  	<script src="${pageContext.request.contextPath}/lib/tasks.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/onet-js/teacherMyExamPaper.js" type="text/javascript"></script>