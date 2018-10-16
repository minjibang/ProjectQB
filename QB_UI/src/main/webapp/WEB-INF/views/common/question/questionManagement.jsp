<%-- 
	@JSP:questionManagement.jsp
	@DATE:2018-10-12
	@Author:양회준
	@Desc:새로운 문제 만들기 및 수정(스토리보드 34 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 2018.10.10 정원 내 문제함 UI 추가 -->
<link
	href="${pageContext.request.contextPath}/css/questionManagement.css"
	rel="stylesheet">

<!-- 2018.10.10 재훈 새 문제 만들기 UI 추가 -->
<!-- 2018.10.12 회준 새 문제 만들기 UI 추가 -->

<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
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

									<select id="question_lg_category" class="form-control-static"
										name="lg_category_name">
										<option value="" selected disabled>대분류 선택</option>
										<c:forEach items="${lgCatList}" var="lgCatList">
											<option value="${lgCatList.lg_category_code}">${lgCatList.lg_category_name}</option>
										</c:forEach>
									</select> <select id="question_md_category" class="form-control-static"
										name="md_category_name">
										<option value="">중분류 선택</option>
									</select> <select id="question_sm_category" class="form-control-static"
										name="sm_category_name">
										<option value="">소분류 선택</option>
									</select> <select class="form-control-static" name="QuestionLevel">
										<option value="quesLevel">난이도</option>
										<c:forEach items="${quesLevelList}" var="quesLevelList">
											<option value="">${quesLevelList.level_name}</option>
										</c:forEach>
									</select> <input type="button"
										class="btn btn-theme myQuestionSelectBtn pull-right"
										value="전체조회"> <input type="button"
										class="btn btn-theme myQuestionSelectBtn pull-right"
										value="검색"> <input type="text"
										class="form-control myQuestionSelectCategory2 pull-right"
										placeholder="키워드를 입력하세요.">

								</div>
								<a href=""></a>
								<!-- /detailed -->
							</div>
							<div class="row mt hrRow">
								<div class="col-lg-2 mt">
									<label class="checkbox-inline" id="totalCheckLabel"> <input
										type="checkbox" id="totalCheckbox" value="option1">
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
											Java <br> 메서드와 변수 <br> 난이도: 중 <br> 정답:3<br>
											정답률:72%<br> 출제자:서정원<br>
										</div>
										<div class="col-lg-3 myQuestionFont">
											<div>
												<b>문제 : </b>
											</div>
											<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> <img
												src="${pageContext.request.contextPath}/img/500.png"
												class="myQuestionImg"> <br>

										</div>
										<div class="col-lg-5 myQuestionFont">
											<div>
												<b>보기 : </b>
											</div>
											<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> <br>
											2. static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
											<br> 3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br>
											<br> 4. static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>


										</div>
										<div class="col-lg-1 btnUpDe">
											<br> <br> <a href="questionUpdate.do"><button
													type="button" class="btn btn-theme">수정</button></a>
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
												Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
												정답률:72%<br> 출제자:서정원<br>
											</div>
											<div class="col-lg-3 myQuestionFont">
												<div>
													<b>문제 : </b>
												</div>
												<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> <img
													src="${pageContext.request.contextPath}/img/404.png"
													class="myQuestionImg"> <br>

											</div>
											<div class="col-lg-5 myQuestionFont">
												<div>
													<b>보기 : </b>
												</div>
												<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> <br>
												2. static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
												<br> 3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br>
												<br> 4. static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>


											</div>
											<div class="col-lg-1 btnUpDe">
												<br> <br> <a href="questionUpdate.do"><button
														type="button" class="btn btn-theme">수정</button></a>
												&nbsp;&nbsp;
												<button type="button" class="btn btn-theme04">삭제</button>

											</div>

										</div>
										<!-- /col-md-6 -->
									</div>




								</div>

							</div>
							<button type="button" class="btn btn-theme btnDeIn">선택
								문제 수정</button>
							<button type="button" class="btn btn-theme pull-right btnDeIn">새
								문제 등록</button>


						</div>
						<!-- /OVERVIEW -->
						<!-- 정원 추가 끝 -->


<!--#####################      새로운 문제 만들기 탭 시작               ##################### -->
<!--%%%%%%%%%%%%%%%%%%%%%      재훈 18.10.10 추가 시작             %%%%%%%%%%%%%%%%%%%%%%-->
<!--%%%%%%%%%%%%%%%%%%%%%      회준 18.10.12 수정 시작             %%%%%%%%%%%%%%%%%%%%%%-->
						<div id="newQuestion" class="tab-pane">
							<div class="row">
								<div class="col-lg-12">
									<form class="formNewQuestion" action="insertQuestion.do"
										method="post" onsubmit="return check()">
										
										<input type="text" name="member_id"
										value="${memberDto.member_id}" style="display: none">
										
										<h3 id="h3id">새로운 문제 만들기</h3>
										<hr>
										<h4>
											<i class="fa fa-angle-right"></i> 출제자: ${memberDto.member_name} ( ${memberDto.member_id} )
										</h4>
										<hr>
										<div>
											<h4 class="mb quesCategory">
												<i class="fa fa-angle-right"></i> 문제 분류
											</h4>
											<select id="question_lg_category2"
												class="form-control-static" name="lg_category_name">
												<option value="" selected disabled>대분류 선택</option>
												<c:forEach items="${lgCatList}" var="lgCatList">
													<option value="${lgCatList.lg_category_code}">${lgCatList.lg_category_name}</option>
												</c:forEach>
											</select> <select id="question_md_category2"
												class="form-control-static" name="md_category_name">
												<option value="">중분류 선택</option>
											</select> <select id="question_sm_category2"
												class="form-control-static" name="sm_category_code">
												<option value="">소분류 선택</option>
											</select> <select id="question_level" class="form-control-static"
												name="level_code">
												<option value="">난이도</option>
												<c:forEach items="${quesLevelList}" var="quesLevelList">
													<option value="${quesLevelList.level_code}">${quesLevelList.level_name}</option>
												</c:forEach>
											</select>
										</div>
										<h4 class="quesCategory">
											<i class="fa fa-angle-right"></i> 문제 유형
										</h4>
										<span class="radio quesCategorybig"> 
											<label class="questionChoiceRadioButton"> 
												<input type="radio" name="question_type" id="question_type_1"
												value="객관식" checked onclick="questionType('questionChoice');" checked>객관식
											</label> &nbsp;&nbsp; 
											<label class="questionChoiceRadioButton">
												<input type="radio" name="question_type" id="question_type_2"
												value="단답형" onclick="questionType('questionShortAnswer');">단답형
										</label>
										</span>
										<hr>
										<div class="form-group" id="questionMoonje">
											<div class="row">
												<div class="col-lg-6 ">
													<h4>
														<i class="fa fa-angle-right"></i> 문제 내용 입력
													</h4>
													<textarea name="question_name" class="form-control"
														placeholder="문제 내용을 입력해주세요." rows="3"></textarea>
													<div class="fileupload fileupload-new" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 400px; max-height: 250px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="question_img" class="default"/>
															</span>
															<a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</a>
														</span>
													</div>
												</div>
												<!--문제 종료-->

												<!--객관식 보기 시작-->
												<div id="questionChoice" style="display: '';"
													class="col-lg-6">
													<h4>
														<i class="fa fa-angle-right"></i> 객관식 정답 입력
													</h4>
													<div class="radio" id="answerChoiceText">
														
														<label class="questionChoiceRadioButton"> 
															<input  type="radio" name="question_answer" value="1" id="questionAnswerRadio1">
															1번
														</label>&nbsp;&nbsp; 
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="2" id="questionAnswerRadio2">
															2번
														</label>&nbsp;&nbsp;
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="3" id="questionAnswerRadio3">
															3번
														</label>&nbsp;&nbsp;
														 
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="4" id="questionAnswerRadio4">
															4번
														</label>&nbsp;&nbsp; 
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="5" id="questionAnswerRadio5">
															5번
														</label>&nbsp;&nbsp;
													</div>
													<br>
													
													<hr>
													
													
													<h4>
														<i class="fa fa-angle-right"></i> 객관식 보기 입력 및 정답 선택
													
													</h4>
													<select id="howManyChoices" class="form-control-static" name="howManyChoices">
													
														
														<option value="2">보기 개수: 2개</option>
														<option value="3">보기 개수: 3개</option>
														<option value="4">보기 개수: 4개</option>
														<option value="5" selected>보기 개수: 5개</option>
													</select> <br> <br>
													
													<!-- <select id="answerSelect" class="form-control-static" name="question_answer">
													    <option value="" selected disabled> 정답을 선택해주세요 </option>
														<option value="1">
														정답: 1번</option>
														<option value="2">
														정답: 2번</option>
														<option value="3">
														정답: 3번</option>
														<option value="4">
														정답: 4번</option>
														<option value="5">
														정답: 5번</option>
													</select> <br> <br> -->
													
													<!-- 1번 보기 -->
													<div id="choiceInput">
													<b><input type="text" name="question_choice_num"
														value="1" style="display: none">1.</b>
													   <input type="text" name="question_choice_content"
														class="form-control-inline" placeholder="1번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new imageup"
														data-provides="fileupload">
														   <div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
															<span> 
																<span class="btn btn-theme02 btn-file">
																	<span class="fileupload-new">
																		<i class="fa fa-paperclip"></i>image
																	</span>
																	<span class="fileupload-exists"><i class="fa fa-undo"></i>Change
																	</span> 
																	<input type="file" class="default" />
																</span>
																<a href="" class="btn btn-theme04 fileupload-exists"
																data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
																Remove</a>
															</span>
														</span><br>
													<!-- 2번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="2" style="display: none">2.</b>
													   <input type="text" name="question_choice_content"
														class="form-control-inline" placeholder="2번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new imageup"
														data-provides="fileupload">
														   <div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
															<span> 
																<span class="btn btn-theme02 btn-file">
																	<span class="fileupload-new">
																		<i class="fa fa-paperclip"></i>image
																	</span>
																	<span class="fileupload-exists"><i class="fa fa-undo"></i>Change
																	</span> 
																	<input type="file" class="default" />
																</span>
																<a href="" class="btn btn-theme04 fileupload-exists"
																data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
																Remove</a>
															</span>
														</span><br>
													<!-- 3번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="3" style="display: none">3.</b>
													   <input type="text" name="question_choice_content"
														class="form-control-inline" placeholder="3번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new imageup"
														data-provides="fileupload">
														   <div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
															<span> 
																<span class="btn btn-theme02 btn-file">
																	<span class="fileupload-new">
																		<i class="fa fa-paperclip"></i>image
																	</span>
																	<span class="fileupload-exists"><i class="fa fa-undo"></i>Change
																	</span> 
																	<input type="file" class="default" />
																</span>
																<a href="" class="btn btn-theme04 fileupload-exists"
																data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
																Remove</a>
															</span>
														</span><br>
													<!-- 4번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="4" style="display: none">4.</b>
													   <input type="text" name="question_choice_content"
														class="form-control-inline" placeholder="4번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new imageup"
														data-provides="fileupload">
														   <div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
															<span> 
																<span class="btn btn-theme02 btn-file">
																	<span class="fileupload-new">
																		<i class="fa fa-paperclip"></i>image
																	</span>
																	<span class="fileupload-exists"><i class="fa fa-undo"></i>Change
																	</span> 
																	<input type="file" class="default" />
																</span>
																<a href="" class="btn btn-theme04 fileupload-exists"
																data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
																Remove</a>
															</span>
														</span><br>
													<!-- 5번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="5" style="display: none">5.</b>
													   <input type="text" name="question_choice_content"
														class="form-control-inline" placeholder="5번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new imageup"
														data-provides="fileupload">
														   <div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
															<span> 
																<span class="btn btn-theme02 btn-file">
																	<span class="fileupload-new">
																		<i class="fa fa-paperclip"></i>image
																	</span>
																	<span class="fileupload-exists"><i class="fa fa-undo"></i>Change
																	</span> 
																	<input type="file" class="default" />
																</span>
																<a href="" class="btn btn-theme04 fileupload-exists"
																data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
																Remove</a>
															</span>
														</span><br>
													</div> <!-- choicesInput 끝 -->
												</div><!--객관식 보기 내용 입력 종료 -->

												<!--단답형 보기 시작-->
												<div id="questionShortAnswer" style="display:none;" class="col-lg-6">
													<h4>
														<i class="fa fa-angle-right"></i> 단답형 정답 입력
													</h4>
													<!-- 단답형 정답 입력란 -->
													<input type="text" class="form-control" name="question_answer"
														id="questionType2Answer" placeholder="정답을 입력해주세요.">
												</div>
												<!--단답형 내용 입력 종료 -->
											</div>
											<!--문제 내용, 정답, 보기 입력 grid 종료 -->
										</div>
										<!--문제 내용, 정답, 보기 입력 종료 -->
										<hr>
										<button type="button" class="btn btn-secondary quesCategory">
										취소</button>
										<button type="submit" class="btn btn-theme quesCategory pull-right">
										문제 등록</button>
										
									</form>
								</div>
								<!-- 문제만들기 패널 종료 -->
								<!-- /form-panel -->
							</div>

							<!--%%%%%%%%%%%%%%%%%%%%%     회준 18.10.12 수정 끝         %%%%%%%%%%%%%%%%%%%%%-->
							<!--%%%%%%%%%%%%%%%%%%%%%     재훈 18.10.10 추가 끝         %%%%%%%%%%%%%%%%%%%%%-->



						</div>
						<!-- /tab-content -->
					</div>
					<!-- /panel-body -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /col-lg-12 -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<script
	src="${pageContext.request.contextPath}/lib/onet-js/questionManagement.js"
	type="text/javascript"></script>

<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기 비동기 스크립트 시작 -->
<script>
	$(function() {
		$('#question_lg_category')
				.change(
						function() {
							$('#question_md_category').children(
									'option:not(:first)').remove();
							<c:forEach items="${mdCatList}" var="mdlist">
							if (document.getElementById("question_lg_category").value == "${mdlist.lg_category_code}") {
								$('#question_md_category')
										.append("<option value=${mdlist.md_category_code}>${mdlist.md_category_name}</option>")
							}
							</c:forEach>
							$('#question_sm_category').children(
							'option:not(:first)').remove();
						})

		$('#question_md_category')
				.change(
						function() {
							$('#question_sm_category').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document.getElementById("question_md_category").value == "${smlist.md_category_code}") {
								$('#question_sm_category')
										.append("<option value=${mdlist.md_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})

		$('#question_lg_category2')
				.change(
						function() {
							$('#question_md_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${mdCatList}" var="mdlist">
							if (document
									.getElementById("question_lg_category2").value == "${mdlist.lg_category_code}") {
								$('#question_md_category2')
										.append("<option value=${mdlist.md_category_code}>${mdlist.md_category_name}</option>")
							}
							</c:forEach>
							$('#question_sm_category2').children(
							'option:not(:first)').remove();
						})

		$('#question_md_category2')
				.change(
						function() {
							$('#question_sm_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document
									.getElementById("question_md_category2").value == "${smlist.md_category_code}") {
								$('#question_sm_category2')
										.append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})
						
		$('#answerSelect')
				.change(
						function() {
							var st = $("#answerSelect option:selected").val();
							console.log(st);
						})

	})
</script>
<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기 비동기 스크립트 끝 -->

