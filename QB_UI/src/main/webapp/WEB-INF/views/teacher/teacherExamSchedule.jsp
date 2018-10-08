<%-- 
	@JSP:teacherExamSchedule.jsp
	@DATE:2018-10-08
	@Author:유영준
	@Desc:강사-시험 일정 페이지(스토리보드 29 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<!-- 데이터 테이블 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
</head>
<style>
.wrapper-low {
	    display: inline-block;
	    margin-top: 20px;
	    padding-left: 15px;
	    padding-right: 15px;
	    padding-bottom: 0px;
	    padding-top: 0px;
	    width: 100%;
	}
.img{
	width: 32px;
	height: 32px;
	display: inline-block;
}
button.add {
	float: left;
	right: 15px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
button.buttonGroup {
	float: right;
	right: 15px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}	
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
			<div class="col-lg-12 mt">
				<div class="row content-panel">
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
							<li><a data-toggle="tab" href="teacherMyExamPaper.do" class="contact-map">내 시험지
									</a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">시험지 만들기
									</a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">임시 저장된 시험지
									</a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">시험 등록
									</a></li>
							<li class="active"><a data-toggle="tab" href="#overview">시험 일정
									</a></li>
						</ul>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div class="col-md-12">
										<table id="examScheduleTable">
											<tbody>
												<tr>
													<td class="exam_paper_name"><h4><strong>자바의 기본 개념과 활용</strong></h4><br>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정의|개념|클래스|메소드</td>
													<td class="exam_schedule">시험 날짜 : 2018.08.15<br>
																			    시험 시간 : 14:00:00 ~ 14:50:00 [50분]<br>
																			    응시 대상 : 전체</td>
													<td><button class="btn btn-info buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험 일정 수정</button>
														<button class="btn btn-danger buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														
													</td>
												</tr>
												
												<tr>
													<td class="exam_paper_name"><h4><strong>자바의 기본 개념과 활용<br>(재시험)</strong></h4><br>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정의|개념|클래스|메소드</td>
													<td class="exam_schedule">시험 날짜 : 2018.08.22<br>
																			    시험 시간 : 17:00:00 ~ 17:50:00 [50분]<br>
																			    응시 대상 : JAVA 1차 60점 미만</td>
													<td><button class="btn btn-info buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험 일정 수정</button>
														<button class="btn btn-danger buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
													
													</td>
												</tr>
											
										</tbody>
								</table>
								<form>
								<a href="" class="exam-insert">
								<img src="img/material-icon.png">
								<strong>새 시험 일정 등록</strong></a>
								</form>
						</div>
						
				<!-- /col-md-6 -->
				</div>
				<!-- /OVERVIEW -->
				</div>

						</div>
						<!-- /tab-content -->
					</div>
					<!-- /panel-body -->
				</div>
				<!-- /col-lg-12 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</section>
	<!-- /wrapper -->
</section>
<script>
// DataTable 구현
$(document).ready( function () {
    $('#examScheduleTable').DataTable();
} 
);
</script>
</html>