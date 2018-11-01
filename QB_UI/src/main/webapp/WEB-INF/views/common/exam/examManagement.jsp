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
	href="${pageContext.request.contextPath}/css/teacherMyExamPaper.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/teacherExamManagement.css"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--main content start-->

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
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
						
					</div><!-- panel-heading -->
					
						<!-- dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd -->

					<div id="exam_preview" class="modal fade modal_preview">
						<div class="modal-dialog">
							<div id="print-modal">
								<a href="#" class="print" onclick="printpage()"
									title="Print page">Print page</a> <a href="#" class="close"
									title="Close print preview">Close</a>
							</div>
							<!-- 임시 데이터  실제 데이터는 백그라운드에서 가져와 스크립트부분에서 append방식.-->
							<div class="book"></div>
						</div>
					</div>
					<!-- dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd -->
					
					<div class="panel-body">
					<div class="tab-content">
						<!-- 내 시험지 탭 시작 -->
						<div id="overview" class="tab-pane active">
							<div class="row">
								<div id="div_myExam" class="col-md-12">
									<a
										href="examPaperMake.do"
										class="examPaper-insert"> <img
										src="../img/material-icon.png"> <strong>새 시험지
											만들기</strong></a>
									<hr>
									<form action="" method="post" id="pickMyExamPaperForm">
										<div class="col-lg-12">

											<!-- 시험지 하나의 div 시작 -->
											<div id="myExamPaperDiv">
												<c:forEach items="${myexamPaperList}" var="myexamPaperList">
													<!-- 시험지 한 개 시작 -->
													<div class="exam-paper-name">
														<h4 class="miri" id="${myexamPaperList.exam_paper_num}" data-target="#exam_preview" data-toggle="modal">
															<strong>${myexamPaperList.exam_paper_name}</strong>
														</h4>
														<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${myexamPaperList.exam_paper_desc}
														
														<div class="pdf_download text-right">
															<a href="#">PDF 다운로드 <img
																src="../img/file-download.png"></a>
															<button type="button"
																id="${myexamPaperList.exam_paper_num}"
																class="btn btn-theme04 buttonGroup"
																onclick="deleteExamCheck()" value="${myexamPaperList.exam_paper_name }">삭제</button>
															<button type="button"
																id="${myexamPaperList.exam_paper_num}"
																class="btn btn-theme buttonGroup"
																onclick="updateExamCheck()">시험지수정</button>
															<button type="button" class="btn btn-theme buttonGroup"
																onclick="location.href='examScheduleRegist.do?exam_paper_num=${myexamPaperList.exam_paper_num}&exam_paper_name=${myexamPaperList.exam_paper_name}'">시험등록</button>
															<input type="hidden" id="hidden_class_num"
																value='${param.class_num}'>
														</div>
														<hr>
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
									<a
										href="examPaperMake.do"
										class="examPaper-insert"> <img
										src="../img/material-icon.png"> <strong>새 시험지
											만들기</strong></a>
									<hr>
									<form action="" method="post" id="pickMyExamPaperForm">
										<div class="col-lg-12">

											<!-- 시험지 하나의 div 시작 -->
											<div id="examTempPaperDiv">
												<c:forEach items="${myTempExamList}" var="myTempExamList">
													<!-- 시험지 한 개 시작 -->
													<div class="exam-paper-name">
														<h4 id="exam_paper_name">
															<strong>${myTempExamList.exam_paper_name}</strong>
														</h4>
														<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${myTempExamList.exam_paper_desc}


														
														<div class="pdf_download text-right">
															<a href="#">PDF 다운로드 <img
																src="../img/file-download.png"></a>
															<button type="button"
																id="${myTempExamList.exam_paper_num}"
																class="btn btn-theme04 buttonGroup"
																onclick="deleteTempExamCheck()">삭제</button>
															<button type="button" class="btn btn-theme buttonGroup"
																onclick="location.href='tempUpdateExamView.do?exam_paper_num=${myTempExamList.exam_paper_num}&exam_paper_name=${myTempExamList.exam_paper_name}'">시험지
																수정</button>
															<input type="hidden" id="hidden_class_num"
																value='${param.class_num}'>
														</div>
														<hr>
													</div>
												</c:forEach>
											</div>
										</div>
									</form>
								</div>
								<!-- /overview -->
							</div>
						</div>

						<!-- 시험 일정 tab 시작 -->
						<div id="examSchedule" class="tab-pane">
							<div class="row">
								<!-- 시험 일정 DeleteModal 시작-->
								<div class="modal fade" id="scheduleDeleteModal" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<!-- 시험 일정 DeleteModal 끝 -->
								</div>

								<div id="div_examSchedule" class="col-md-12">
									<form class="insertForm">
										<a href="" class="exam-insert"> <img
											src="${pageContext.request.contextPath}/img/material-icon.png"><strong>새
												시험 일정 등록</strong></a>
									</form>
									<hr>
									<form action="" method="post" id="pickExamScheduleForm">
										<div class="col-lg-12">
											<!-- 시험 일정 하나의 div 시작 -->
											<div id="examScheduleDiv">
												<c:forEach items="${examScheduleList}"
													var="examScheduleList">
													<div class="exam_info_name">
														<h4>
															<strong>${examScheduleList.exam_info_name}</strong>
														</h4>
														<div class="view-schedule text-center">
															<p>시험 날짜 : ${examScheduleList.exam_info_date}</p>
															<p>시험 시간 : ${examScheduleList.exam_info_start} ~
																${examScheduleList.exam_info_end}</p>
															<p>[${examScheduleList.exam_info_time}]</p>
															<p>응시 대상 : ${examScheduleList.exam_info_member}</p>

															<button type="button"
																id="${examScheduleList.exam_info_num}"
																name="deleteExamScheduleBtn"
																class="btn btn-theme04 buttonGroup"
																onclick="deleteExamInfo()" value="${examScheduleList.exam_info_date}">삭제</button>

															<button type="button" class="btn btn-theme buttonGroup"
																onclick="location.href='examScheduleUpdate.do?exam_info_num=${examScheduleList.exam_info_num}&exam_info_name=${examScheduleList.exam_info_name}'">시험
																일정 수정</button>

															<input type="hidden" id="hidden_class_num"
																value='${param.class_num}'>
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
					
				</div><!-- row content-panel div_table-->
			</div><!-- col-lg-12 -->
		</div> <!-- row mt -->
	</section><!-- wrapper site-min-height -->
</section> <!-- main-content -->
					

<script
	src="${pageContext.request.contextPath}/lib/onet-js/examScheduleUpdate.js"></script>
<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/lib/tasks.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/lib/onet-js/examManagement.js"
	type="text/javascript"></script>

<script>

$(document).ready(function(){
	
	$('.miri').click(function(){
		var exam_paper_num = $(this).attr('id');
		
			 $.ajax({
				  url : "examMiri.do",
				  type:'GET',
				  data : {
					  'exam_paper_num' : exam_paper_num
				  },
				  dataType:"html",
				  success:function(data){
					  $('.book').html(data);
				  }
			   });
	   }); 
});

	function printpage(){
		
		var divContents = $('.book').html();
		var printWindow = window.open('','','height=400, width=800');
		
		printWindow.document.write('<html>');
		printWindow.document.write('<head>')
		printWindow.document.write('<style>#page table {width : 45%;height : 260 px;margin-bottom : 50px;margin-right : 20px;} td {vertical-align : top; padding : 2px;} th {vertical-align : top;padding-bottom : 15px;}#page {width: 793px; height: 1122px; flex-flow:column wrap;text-overflow:clip;}</style>');
		printWindow.document.write('</head>')
        printWindow.document.write('<body >');
        printWindow.document.write(divContents);
        printWindow.document.write('</body></html>');
        printWindow.print();
	}
	function updateExamCheck() {
		var exam_paper_num = window.event.target.id;

		$.ajax({
			url : "updateExamCheck.do",
			type : "get",
			dataType : "json",
			data : {
				'exam_paper_num' : exam_paper_num
			},
			success : function(data){
				if(data == 1){
					location.href = "updateExamView.do?exam_paper_num=" + exam_paper_num;		
				}else if(data == 2){
					location.href = "updateExamView.do?exam_paper_num=" + exam_paper_num;
				}else{
					swal({
						title : "수정불가",
						text : "등록된 시험일정이 있습니다. 시험일정을 확인하고 수정해주세요.",
						icon : "warning",
					});
				}
			}
		});
	}
	function deleteExamCheck() {
		var exam_paper_num = window.event.target.id;
		swal({
			  title: "시험지를 삭제 하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true
			}).then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url : "deleteExam.do",
						type : 'GET',
						dataType : "json",
						data : {
							'exam_paper_num' : exam_paper_num
						},
						success : function(data) {
							if (data == 1) {
								swal({
									title : "삭제완료",
									icon : "success",
								});
								$('#' + exam_paper_num).parent().parent(
										".exam-paper-name").remove();
							} else if (data == 2) {
								swal({
									title : "삭제완료",
									text : "삭제가 완료외었습니다.학생-(지난시험보기에는 남아있음)",
									icon : "success",
								});
								$('#' + exam_paper_num).parent().parent(
										".exam-paper-name").remove();
							} else {
								swal({
									title : "삭제불가",
									text : "등록된 시험일정이 있습니다.",
									icon : "warning",
									dangerMode: true
								});
							}
						},
						error : function(error) {
							console.log("===========실패");
						}
					});
			    swal("Poof! Your imaginary file has been deleted!", {
			      icon: "success",
			    });
			  } else {}
			});
	}
	function deleteTempExamCheck() {
		var exam_paper_num = window.event.target.id;
		
		
		swal({
			  title: "시험지를 삭제 하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true
			}).then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url : "deleteTempExam.do",
						type : 'GET',
						dataType : "json",
						data : {
							'exam_paper_num' : exam_paper_num
						},
						success : function(data) {
							swal({
								title : "삭제완료",
								icon : "success",
							});
							$('#' + exam_paper_num).parent().parent(".exam-paper-name")
									.remove();
						},
						error : function(error) {
							console.log("===========실패");
						}
					});
				  
			    swal("Poof! Your imaginary file has been deleted!", {
			      icon: "success",
			    });
			  } else {
			  }
		});
	}
</script>