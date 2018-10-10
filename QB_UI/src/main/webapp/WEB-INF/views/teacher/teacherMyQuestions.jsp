<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link href="${pageContext.request.contextPath}/css/teacherMyQuesion_newQuestion.css" rel="stylesheet">

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
							<li class="active"><a data-toggle="tab" href="#overview">내 문제함</a></li>
							<li><a data-toggle="tab" href="#newQuestion" class="contact-map">새 문제 만들기</a></li>
						</ul>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div class="col-md-12"></div>
									<!-- /col-md-6 -->
								</div>
								<!-- /OVERVIEW -->
							</div>
							<!-- /tab-pane -->
							<div id="newQuestion" class="tab-pane ">
								<div class="row">
								<div class="col-lg-1"></div>
									<div class="col-md-10">
										<div class="col-lg-2">
										문제 대,중,소 분류선택 <br>
										문제 유형 선택 
										</div>
										<div class="col-lg-8 detailed mt">
												<h4 class="mb">새 문제 만들기</h4>
												<form role="form" class="form-horizontal"
													id="newQuestion_form">
													<div class="form-group">
														<label class="control-label col-md-3">문제:</label>
														<div class="col-md-6">
															<input class="form-control" id="" type="text" />
														</div>
													</div>
													
													<div class="form-group">
														<label class="control-label col-md-3">강사</label>
														<div class="col-md-6 col-xs-12">
															<input class="form-control" id="" type="text" />
														</div>
													</div>
													<div class="col-md-9 col-xs-12" id="AdminUpdateBtn">
													<button class="btn btn-theme" type="button" data-toggle="modal" data-target="#ClassUpdateModal">수정</button>
													</div>
													
												</form>
											</div>
									</div>
								</div>
							</div>
								<!-- /row -->
							

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

<!-- /MAIN CONTENT -->
<!--main content end-->