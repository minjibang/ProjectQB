<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <link href="${pageContext.request.contextPath}/css/teacherMyQuesion_newQuestion.css" rel="stylesheet">
 --%>
<style>
#categorySelect {
	width: 100%;

	border-bottom: 1px solid #e2e2e2;
}

button.categorySelectButton {
	margin: 10px;
	width: 150px;
	display: inline-block;
}

#questionTypeSelect{
	width: 100%;
	
	border-bottom: 1px solid #e2e2e2;
}

label.questionTypeRadioButton{
	margin-top: 10px;
	margin-left: 15px;
	margin-right: 15px;
	margin-bottom: 10px;
}

#questionMoonje{
	width: 100%;
	padding-bottom:40px;
	
	border-bottom: 1px solid #e2e2e2;
}

#questionMoonjeText{
	display:inline-block;
	width: 100%;
}

#moonjeTextArea{
	display:inline-block;
	width:80%;
	resize: none;
	margin-bottom: 15px;
}

#moonjeImage{
	display:inline-block;
}

#questionChoice{
	width: 100%;
	
	border-bottom: 1px solid #e2e2e2;
	padding-bottom: 40px;
}


</style>

<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
			<div class="col-lg-12 mt">
				<div class="row content-panel">
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#overview">내
									문제함</a></li>
							<li><a data-toggle="tab" href="#newQuestion"
								class="contact-map">새 문제 만들기</a></li>
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
							<div id="newQuestion" class="tab-pane">
								<div class="row">
									<div class="col-md-2">
									</div>
										<div class="col-md-8">
											
											<form role="form" class="" id="newQuestion_form">
												<div id="categorySelect" class="form-group">
													<h4>Step1. 문제 분류 및 난이도 선택</h4>
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
															<li><a href="#">상</a></li>
															<li><a href="#">중</a></li>
															<li><a href="#">하</a></li>
														</ul>
													</div>
													
													
													
												</div>
											</form>
											
											<div id="questionTypeSelect" class="form-group">
											<h4>Step2. 문제 유형 선택</h4>
												<div class="radio">
													<label class="questionTypeRadioButton"> <input type="radio" class="questionTypeRadioButton" name="optionsRadios"
														id="optionsRadios1" value="option1" checked>
														객관식
													</label>
													
													<label class="questionTypeRadioButton"> <input type="radio"  name="optionsRadios"
														id="optionsRadios2" value="option2"> 
														단답형
													</label>
												</div>
											</div>
											
											
											<div class="form-group" id="questionMoonje">
											<h4>Step3. 문제 내용 입력</h4>
											<textarea id="moonjeTextArea" class="form-control" placeholder="문제 내용을 입력해주세요." rows="5"></textarea>
												<div class="col-sm-8"></div>
												<div class="col-sm-2">
										    		<input id="moonjeImage" type="file" class="default"/>
												</div>
												<div class="col-sm-2"></div>
											</div>
											<!-- style="border:1px solid red;" -->
											
											<div class="form-group" id="questionChoice">
											<h4>Step4. 문제 보기 입력</h4>
												<div class="col-sm-12">
												<h5> 1번 보기</h5>
												</div>
												
												<div>
												<textarea id="moonjeTextArea" class="form-control" placeholder="1번 보기 내용을 입력해주세요." rows="3"></textarea>
												<div class="col-sm-8"></div>
												<div class="col-sm-2">
										    		<input id="moonjeImage" type="file" class="default"/>
												</div>
												<div class="col-sm-2"></div>
												</div>
												
												<div class="col-sm-12">
												<h5> 2번 보기</h5>
												</div>
												
												<div>
												<textarea id="moonjeTextArea" class="form-control" placeholder="2번 보기 내용을 입력해주세요." rows="3"></textarea>
												<div class="col-sm-8"></div>
												<div class="col-sm-2">
										    		<input id="moonjeImage" type="file" class="default"/>
												</div>
												<div class="col-sm-2"></div>
												</div>
												
												<div class="col-sm-12">
												<h5> 3번 보기</h5>
												</div>
												
												<div>
												<textarea id="moonjeTextArea" class="form-control" placeholder="3번 보기 내용을 입력해주세요." rows="3"></textarea>
												<div class="col-sm-8"></div>
												<div class="col-sm-2">
										    		<input id="moonjeImage" type="file" class="default"/>
												</div>
												<div class="col-sm-2"></div>
												</div>
												
												<div class="col-sm-12">
												<h5> 4번 보기</h5>
												</div>
												
												<div>
												<textarea id="moonjeTextArea" class="form-control" placeholder="4번 보기 내용을 입력해주세요." rows="3"></textarea>
												<div class="col-sm-8"></div>
												<div class="col-sm-2">
										    		<input id="moonjeImage" type="file" class="default"/>
												</div>
												<div class="col-sm-2"></div>
												</div>
											
											</div>
											
											
										</div>
										<div class="col-sm-2"></div>
										
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
		
	</section>
	<!-- /wrapper -->
</section>

<!-- /MAIN CONTENT -->
<!--main content end-->