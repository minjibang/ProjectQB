<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- <link href="${pageContext.request.contextPath}/css/teacherMyQuesion_newQuestion.css" rel="stylesheet">
 --%>
<style>

#categorySelect{
 width:100%;
 text-align:center;
}

button.categorySelectButton{
	margin:10px;
	width:150px;
	display: inline-block;
}

#questionMoonjeLabel{
	margin-bottom:20px;
}

#questionMoonjeText{
	margin-left:20px;
}
#questionMoonje{
	width:100%;
	text-align:right;
}

#questionMoonjeFile{
	margin:5px;
	display: inline-block;
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
										</div>
										<div class="col-lg-8 detailed mt">
												<h4 class="mb">새 문제 만들기</h4>
												<form role="form" class="form-horizontal"
													id="newQuestion_form">
													<div id="categorySelect" class="form-group">
													
													<div class="btn-group">
														<button type="button"
															class="btn btn-default dropdown-toggle categorySelectButton"
															data-toggle="dropdown">
															대분류 선택 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="#">대분류1</a></li>
															<li><a href="#">대분류2</a></li>
														</ul>
													</div>
													<div class="btn-group">
														<button type="button"
															class="btn btn-default dropdown-toggle categorySelectButton"
															data-toggle="dropdown">
															중분류 선택 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="#">중분류1</a></li>
															<li><a href="#">중분류2</a></li>
														</ul>
													</div>
													<div class="btn-group">
														<button type="button"
															class="btn btn-default dropdown-toggle categorySelectButton"
															data-toggle="dropdown">
															소분류 선택 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="#">소분류1</a></li>
															<li><a href="#">소분류2</a></li>
														</ul>
													</div>
													<div class="btn-group">
														<button type="button"
															class="btn btn-default dropdown-toggle categorySelectButton"
															data-toggle="dropdown">
															난이도 선택 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="#">Dropdown link</a></li>
															<li><a href="#">Dropdown link</a></li>
														</ul>
													</div>
													

												</div>
													
													<span>
													<label id="questionMoonjeLabel" class="control-label col-md-12">문제 입력:</label>
													</span>
													
													<div id="questionMoonje" class="form-group">
												
														<div class="col-md-12">
                    										<textarea id="questionMoonjeText" class="wysihtml5 form-control" rows="2" placeholder="문제 내용을 입력해주세요. 문제를 이미지로 대체하길 원하는 경우, 이미지 파일을 첨부해주세요."></textarea>
														</div>
														
													<div class="form-group last">
														<label class="control-label col-md-3">Image Upload</label>
														<div class="col-md-9">
															<div class="fileupload fileupload-new"
																data-provides="fileupload">
																<div class="fileupload-new thumbnail"
																	style="width: 200px; height: 150px;">
																	<img
																		src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image"
																		alt="" />
																</div>
																<div
																	class="fileupload-preview fileupload-exists thumbnail"
																	style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
																<div>
																	<span class="btn btn-theme02 btn-file"> <span
																		class="fileupload-new"><i
																			class="fa fa-paperclip"></i> Select image</span> <span
																		class="fileupload-exists"><i class="fa fa-undo"></i>
																			Change</span> <input type="file" class="default" />
																	</span> <a href="advanced_form_components.html#"
																		class="btn btn-theme04 fileupload-exists"
																		data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
																		Remove</a>
																</div>
															</div>
															<span class="label label-info">NOTE!</span> <span>
																Attached image thumbnail is supported in Latest Firefox,
																Chrome, Opera, Safari and Internet Explorer 10 only </span>
														</div>
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