<%-- 
	@JSP:teacherTempExamPaper.jsp
	@DATE:2018-10-08
	@Author:유영준
	@Desc:강사-임시 저장된 시험지 페이지(스토리보드 27 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.pn-big {
	height: 300px;
	box-shadow: 0 2px 1px rgba(0, 0, 0, 0.2);
	}
	.weather-4 {
	background: #3cb371;
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
}
button.buttonGroup {
	float: right;
	right: 15px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}
/* datatables 수정 */
.dataTables_length, .dataTables_info {
	display: none;
}
.dataTables_paginate {

	margin:0 auto;
}
</style>
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
							<li><a data-toggle="tab" href="#contact">내 시험지
									</a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">시험지 만들기
									</a></li>
							<li class="active"><a data-toggle="tab" href="#overview">임시 저장된 시험지
									</a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">시험 등록
									</a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">시험 일정
									</a></li>
						</ul>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div id="div_tempExam" class="col-md-12">
										<table id="tempExam_table" class="display">
											<tbody>
												<tr>
													<td class="exam_paper_name"><h4><strong>NCS HTML 시험(10/15까지 완성할 것)</strong></h4>
													<p>HTML + CSS 개념 및 활용</p></td>
													<td class="pdf_download text-right"><h5>PDF 다운로드
													<img src="img/file-download.png"></h5>
													<p><button class="btn btn-danger buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-info buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button class="btn btn-info buttonGroup">
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
												
												<tr>
													<td class="exam_paper_name"><h4><strong>NCS JAVASCRIPT 시험(10/30까지 완성할 것)</strong></h4>
													<p>자바스크립트 개념 및 활용</p></td>
													<td class="pdf_download text-right"><h5>PDF 다운로드
													<img src="img/file-download.png"></h5>
													<p><button class="btn btn-danger buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-info buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button class="btn btn-info buttonGroup">
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
										</tbody>
								</table>
								<form>
								<a href="" class="exam-insert">
								<img src="img/material-icon.png">
								<strong>새 시험지 만들기</strong></a>
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