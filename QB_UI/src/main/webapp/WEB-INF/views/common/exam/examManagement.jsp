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

					</div>
					<!-- panel-heading -->

					<!-- 시험지 모달 -->
					<div id="exam_preview" class="modal fade">
						<div class="fix">
								<a href="#" class="print" onclick="printpage()" title="Print page">Print page</a> 
								<a href="#" class="close" title="Close print preview" data-dismiss="modal">Close</a>
						</div>
						<div class="modal-dialog">							
							<div class="book"></div>
						</div>
					</div>


					<div class="panel-body">
						<div class="tab-content">
							<!-- 내 시험지 탭 시작 -->
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div id="div_myExam" class="col-md-12">
										<a href="examPaperMake.do" class="examPaper-insert"> <img
											src="../img/material-icon.png"> <strong>새 시험지
												만들기</strong></a>
										<div class="searchRowRightDiv">
											<select class="form-control searchRightBtnDiv"
												id="searchType" name="searchType">
												<option value="all">전체</option>
												<option value="n">클래스명</option>
												<option value="p">시험지명</option>
											</select> <input type="text" class="form-control searchRightBtnDiv"
												placeholder="검색어를 입력" id="keyword" name="keyword">
											<button type="button" class="btn btn-theme searchRightBtn"
												id="searchBtn">검색</button>
											<!-- <button type="button" class="btn btn-theme searchRightBtn" id="pastClassBtn">지난 클래스 보기</button> -->
										</div>

										<hr>
										
												<div id="examlistView2">
												
												</div>



									</div>
									<!-- 내 시험지 div 끝 -->
									
								</div>
								<!-- /col-md-12 -->
								<div class="row mt">
									<div class="col-lg-12">
										<div id="examlistView">
										
										</div>
									</div>
								</div>
							</div>
							<!-- 내 시험지 탭 끝-->

							<!-- 임시 저장된 시험지 tab 시작-->
							<div id="tempExamPaper" class="tab-pane">
								<div class="row">
									<div id="div_tempExam" class="col-md-12">
										<a href="examPaperMake.do" class="examPaper-insert"> <img
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
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<!-- 시험 일정 DeleteModal 끝 -->
									</div>

									<div id="div_examSchedule" class="col-md-12">
										<form class="insertForm">
											<a href="" class="exam-insert"> <img
												src="${pageContext.request.contextPath}/img/material-icon.png"><strong>새
													시험 일정 등록</strong></a>
											<div class="searchRowRightDiv">
												<select class="form-control searchRightBtnDiv"
													id="searchType2" name="searchType2">
													<option value="all">전체</option>
													<option value="n">클래스명</option>
													<option value="t">시험명</option>
												</select> <input type="text" class="form-control searchRightBtnDiv"
													placeholder="검색어를 입력" id="keyword" name="keyword">
												<button type="button" class="btn btn-theme searchRightBtn"
													id="searchBtn2">검색</button>
												<!-- <button type="button" class="btn btn-theme searchRightBtn" id="pastClassBtn">지난 클래스 보기</button> -->
											</div>
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
																<p>클래스명 : ${examScheduleList.class_name}</p>
																<button type="button"
																	id="${examScheduleList.exam_info_num}"
																	name="deleteExamScheduleBtn"
																	class="btn btn-theme04 buttonGroup"
																	onclick="deleteExamInfo()"
																	value="${examScheduleList.exam_info_date}">삭제</button>

																<button type="button" class="btn btn-theme buttonGroup"
																	onclick="location.href='examScheduleUpdate.do?exam_info_num=${examScheduleList.exam_info_num}&exam_info_name=${examScheduleList.exam_info_name}'">시험
																	일정 수정</button>

																<input type="hidden" id="hidden_class_num"
																	value='${param.class_num}'>
															</div>
															<br> <br>
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
				<!-- row content-panel div_table-->
			</div>
			<!-- col-lg-12 -->
		</div>
		<!-- row mt -->
	</section>
	<!-- wrapper site-min-height -->
</section>
<!-- main-content -->


<script
	src="${pageContext.request.contextPath}/lib/onet-js/examScheduleUpdate.js"></script>
<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/lib/tasks.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/lib/onet-js/examManagement.js"
	type="text/javascript"></script>

<script>
var classcheck = true;	//	왜 false?
var classParam = {
		"begin" : 0,
		"searchType" : "all",
		"keyword" : "all",
}

$(document).ready(function(){
	//무한 스크롤
	examlistClass(classParam);
	var lastScrollTop = 0;
	
	$(window).scroll(function(){
		var currentScrollTop = $(window).scrollTop();
		if( currentScrollTop - lastScrollTop > 0 ){
	            // 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
	         if ($(window).scrollTop() >= ($(document).height() - $(window).height()) -10 ){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
	        	 
	        	 //scrollTop + windowHeight + 30 > documentHeight
	        	 
				classParam.begin += 4;
				examlistClass(classParam);
				console.log("begin : " + classParam.begin +"번부터");
			 }
		  }
	});
	
	
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
	
	$('#searchBtn').click(function(){  // search 버튼을 눌렀을 때는 json 데이터의 내용을 변경시켜서 파라미터로 보내기 
		
		classParam.begin = 0; 
		classParam.searchType = $("#searchType").val();
		classParam.keyword = $("#keyword").val();
		$('#examlistView').empty();
		examlistClass(classParam);
		
	});
	
});
	//클래스 목록 가져오는 ajax
	function examlistClass(classParam){
		$.ajax({
			url : "exampaperlistClass.do",
			type : 'GET',
			dataType : "html",
			data : classParam,
			success : function(data){	
				$('#examlistView').append(data);
			},
			error : function(error) {
				console.log("===========실패");
			}
		});
	}
		
	function printpage(){
		
		var divContents = $('.book').html();
		var printWindow = window.open('','','height=1000, width=1800');
        printWindow.document.write(divContents);
        printWindow.document.close();
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
								$('#' + exam_paper_num).parent().remove();
								
							} else if (data == 2) {
								swal({
									title : "삭제완료",
									text : "삭제가 완료외었습니다.학생-(지난시험보기에는 남아있음)",
									icon : "success",
								});
								$('#' + exam_paper_num).parent().remove();
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