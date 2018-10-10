<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!-- 2018.10.10 정원 내 문제함 UI 추가 -->
<link href="${pageContext.request.contextPath}/css/teacherMyQuestion.css"
	rel="stylesheet">
=======
<!-- 2018.10.10 재훈 새 문제 만들기 UI 추가 -->
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

#questionMoonjeLabel {
	margin-bottom: 20px;
}

#questionMoonjeText {
	margin-left: 20px;
}

#questionMoonje {
	width: 100%;
	text-align: right;
}

#questionMoonjeFile {
	margin: 5px;
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

		<div class="row mt">
			<div class="col-lg-12">
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
										<div class="col-lg-12">

											<h3 id="h3id">내가 만든 문제</h3>
											<hr>
											<select class="form-control myQuestionSelectCategory" name="">
												<option value="">대분류</option>
												<option value="">언어</option>
												<option value="">시험</option>
											</select> <select class="form-control myQuestionSelectCategory"
												name="">
												<option value="">중분류</option>
												<option value="">자바</option>
												<option value="">C</option>
												<option value="">C++</option>
											</select> <select class="form-control myQuestionSelectCategory"
												name="">
												<option value="">소분류</option>
												<option value="">변수</option>
												<option value="">배열</option>
												<option value="">객체</option>
											</select> <select class="form-control myQuestionSelectCategory"
												name="">
												<option value="">난이도</option>
												<option value="">기초</option>
												<option value="">기본</option>
												<option value="">심화</option>
											</select> <input type="text"
												class="form-control myQuestionSelectCategory2"
												placeholder="키워드를 입력하세요."> <input type="button"
												class="btn btn-theme myQuestionSelectBtn" value="검색">
											<input type="button"
												class="btn btn-theme myQuestionSelectBtn" value="전체조회">
										</div>
										<a href=""></a>
										<!-- /detailed -->
									</div>
									<div class="row mt hrRow">
										<div class="col-lg-2 mt">
											<label class="checkbox-inline" id="totalCheckLabel">
												<input type="checkbox" id="totalCheckbox" value="option1">
												&nbsp;전체선택
											</label>
										</div>
									</div>


									<hr>

									<!-- /col-md-6 -->
									<div class="row content-panel" id="myQuestionPanel">
										<div class="myQuestionDiv">
											<div class="row mt">

												<div class="col-lg-1 myQuestionCheck">
													<input type="checkbox" value="" name="" id="checkLa">
													<!-- value에 문제고유번호 들어간다 -->
												</div>
												<div class="col-lg-2 myQuestionCategory">
													Java<br> <br> 메서드와 변수<br> <br> 난이도: 중<br>
													<br> 정답:3<br> <br> 정답률:72%<br> <br>
													출제자:서정원<br> <br>
												</div>
												<div class="col-lg-3 myQuestionFont">
													<div>
														<b>문제 : </b>
													</div>
													<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> <img
														src="${pageContext.request.contextPath}/img/500.png"
														class="myQuestionImg"> <br>

												</div>
												<div class="col-lg-4 myQuestionFont">
													<div>
														<b>보기 : </b>
													</div>
													<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> <br>
													2. static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
													<br> 3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br>
													<br> 4. static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>


												</div>
												<div class="col-lg-2 btnUpDe">
													<br> <br>
													<button type="button" class="btn btn-theme">수정</button>
													&nbsp;&nbsp;
													<button type="button" class="btn btn-theme04">삭제</button>

												</div>


												<!-- /col-md-6 -->
											</div>



											<hr class="hr">

											<!-- /col-md-6 -->
											<div class="row mt">
												<div class="myQuestionDiv">
													<div class="col-lg-1 myQuestionCheck">
														<input type="checkbox" value="" name="">
														<!-- value에 문제고유번호 들어간다 -->
													</div>
													<div class="col-lg-2 myQuestionCategory">
														Java<br> <br> 메서드와 변수<br> <br> 난이도: 중<br>
														<br> 정답:3<br> <br> 정답률:72%<br> <br>
														출제자:서정원<br> <br>
													</div>
													<div class="col-lg-3 myQuestionFont">
														<div>
															<b>문제 : </b>
														</div>
														<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> <img
															src="${pageContext.request.contextPath}/img/404.png"
															class="myQuestionImg"> <br>

													</div>
													<div class="col-lg-4 myQuestionFont">
														<div>
															<b>보기 : </b>
														</div>
														<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> <br>
														2. static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
														<br> 3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br>
														<br> 4. static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>


													</div>
													<div class="col-lg-2 btnUpDe">
														<br> <br>
														<button type="button" class="btn btn-theme">수정</button>
														&nbsp;&nbsp;
														<button type="button" class="btn btn-theme04">삭제</button>

													</div>

												</div>
												<!-- /col-md-6 -->
											</div>




										</div>
										<br>
										<div class="btnDeIn">
											<button type="button" class="btn btn-theme">선택 문제 삭제</button>
											<button type="button" class="btn btn-theme">새 문제 등록</button>
										</div>
									</div>

									<!-- /OVERVIEW -->
								</div>
								<!-- 정원 추가 끝 -->
								<!-- /tab-pane -->
								<div id="newQuestion" class="tab-pane ">
									<div class="row">
										<div class="col-lg-1"></div>
										<div class="col-md-10">
											<div class="col-lg-2"></div>
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

													<span> <label id="questionMoonjeLabel"
														class="control-label col-md-12">문제 입력:</label>
													</span>

													<div id="questionMoonje" class="form-group">

														<div class="col-md-12">
															<textarea id="questionMoonjeText"
																class="wysihtml5 form-control" rows="2"
																placeholder="문제 내용을 입력해주세요. 문제를 이미지로 대체하길 원하는 경우, 이미지 파일을 첨부해주세요."></textarea>
														</div>

														<div class="form-group last">
															<label class="control-label col-md-3">Image
																Upload</label>
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
																			class="fileupload-exists"><i
																				class="fa fa-undo"></i> Change</span> <input type="file"
																			class="default" />
																		</span> <a href="advanced_form_components.html#"
																			class="btn btn-theme04 fileupload-exists"
																			data-dismiss="fileupload"><i
																			class="fa fa-trash-o"></i> Remove</a>
																	</div>
																</div>
																<span class="label label-info">NOTE!</span> <span>
																	Attached image thumbnail is supported in Latest
																	Firefox, Chrome, Opera, Safari and Internet Explorer 10
																	only </span>
															</div>
														</div>

													</div>



													<div class="col-md-9 col-xs-12" id="AdminUpdateBtn">
														<button class="btn btn-theme" type="button"
															data-toggle="modal" data-target="#ClassUpdateModal">수정</button>
													</div>

												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- /row -->
							</div>


							<!-- /tab-pane -->
		
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
			<!-- /row -->
		</div>

		<!-- /container -->
			<!-- /col-lg-12 -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->