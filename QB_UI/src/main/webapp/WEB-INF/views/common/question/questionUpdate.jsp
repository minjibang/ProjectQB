<%-- 
	@JSP:questionUpdate.jsp
	@DATE:2018-10-19
	@Author:조재훈
	@Desc:내 문제 수정(스토리보드 33 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 
	2018.10.12 회준 새 문제 만들기 UI 추가 
	questionManagement.jsp와 css파일 공유
--%>
<link
	href="${pageContext.request.contextPath}/css/questionManagement.css"
	rel="stylesheet">

<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="content-panel">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form class="formNewQuestion" action="insertQuestion.do"
							method="post" onsubmit="return check()">

							<input type="text" name="member_id"
								value="${memberDto.member_id}" style="display: none">

							<h3 id="h3id">문제 수정</h3>
							<hr>
							<h4>
								<i class="fa fa-angle-right"></i> 출제자: ${memberDto.member_name}
								( ${memberDto.member_id} )
							</h4>
							<hr>
							<div>
								<h4 class="mb quesCategory">
									<i class="fa fa-angle-right"></i> 문제 분류
								</h4>
								<select id="question_lg_category2" class="form-control-static"
									name="lg_category_name">
									<option value="" selected disabled>대분류 선택</option>
									<c:forEach items="${lgCatList}" var="lgCatList">
										<option value="${lgCatList.lg_category_code}">${lgCatList.lg_category_name}</option>
									</c:forEach>
								</select> <select id="question_md_category2" class="form-control-static"
									name="md_category_name">
									<option value="">중분류 선택</option>
								</select> <select id="question_sm_category2" class="form-control-static"
									name="sm_category_code">
									<option value="">소분류 선택</option>
								</select> <select id="level_type" class="form-control-static"
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
							<span class="radio quesCategorybig"> <label
								class="questionChoiceRadioButton"> <input type="radio"
									name="question_type" id="question_type_1" value="객관식" checked
									onclick="questionType('questionChoice');" checked>객관식
							</label> &nbsp;&nbsp; <label class="questionChoiceRadioButton"> <input
									type="radio" name="question_type" id="question_type_2"
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
											placeholder="문제 내용을 입력해주세요." rows="3" required></textarea>
										<div class="fileupload fileupload-new"
											data-provides="fileupload">
											<div class="fileupload-preview fileupload-exists thumbnail"
												style="max-width: 400px; max-height: 250px; line-height: 20px;">
											</div>
											<span> <span class="btn btn-theme02 btn-file">
													<span class="fileupload-new"> <i
														class="fa fa-paperclip"></i>image
												</span> <span class="fileupload-exists"> <i
														class="fa fa-undo"></i>Change
												</span> <input type="file" name="question_img" class="default" />
											</span> <a href="" class="btn btn-theme04 fileupload-exists"
												data-dismiss="fileupload"> <i class="fa fa-trash-o"></i>Remove
											</a>
											</span>
										</div>
									</div>
									<!--문제 종료-->

									<!--객관식 보기 시작-->
									<div id="questionChoice" style="display: '';" class="col-lg-6">
										<h4>
											<i class="fa fa-angle-right"></i> 객관식 정답 입력
										</h4>
										<div class="radio" id="answerChoiceText">

											<label class="questionChoiceRadioButton"> <input
												type="radio" name="question_answer" value="1"
												id="questionAnswerRadio1"> 1번
											</label>&nbsp;&nbsp; <label class="questionChoiceRadioButton">
												<input type="radio" name="question_answer" value="2"
												id="questionAnswerRadio2"> 2번
											</label>&nbsp;&nbsp; <label class="questionChoiceRadioButton">
												<input type="radio" name="question_answer" value="3"
												id="questionAnswerRadio3"> 3번
											</label>&nbsp;&nbsp; <label class="questionChoiceRadioButton">
												<input type="radio" name="question_answer" value="4"
												id="questionAnswerRadio4"> 4번
											</label>&nbsp;&nbsp; <label class="questionChoiceRadioButton">
												<input type="radio" name="question_answer" value="5"
												id="questionAnswerRadio5"> 5번
											</label>&nbsp;&nbsp;

										</div>
										<br>

										<hr>


										<h4>

											<i class="fa fa-angle-right"></i>객관식 보기 입력

										</h4>
										<select id="howManyChoices" class="form-control-static"
											name="howManyChoices">


											<option value="2">보기 개수: 2개</option>
											<option value="3">보기 개수: 3개</option>
											<option value="4">보기 개수: 4개</option>
											<option value="5" selected>보기 개수: 5개</option>
										</select> <br> <br>


										<!-- 1번 보기 -->
										<div id="choiceInput">
											<b><input type="text" name="question_choice_num"
												value="1" style="display: none">1.</b> <input
												type="text" name="question_choice_content"
												id="question_choice_content1" class="form-control-inline"
												placeholder="1번 보기 내용을 입력해주세요."> <span
												class="fileupload fileupload-new imageup"
												data-provides="fileupload">
												<div class="fileupload-preview fileupload-exists thumbnail"
													style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
												<span> <span class="btn btn-theme02 btn-file">
														<span class="fileupload-new"> <i
															class="fa fa-paperclip"></i>image
													</span> <span class="fileupload-exists"><i
															class="fa fa-undo"></i>Change </span> <input type="file"
														class="default" />
												</span> <a href="" class="btn btn-theme04 fileupload-exists"
													data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
														Remove</a>
											</span>
											</span><br>
											<!-- 2번 보기 -->
											<b><input type="text" name="question_choice_num"
												value="2" style="display: none">2.</b> <input
												type="text" name="question_choice_content"
												id="question_choice_content2" class="form-control-inline"
												placeholder="2번 보기 내용을 입력해주세요."> <span
												class="fileupload fileupload-new imageup"
												data-provides="fileupload">
												<div class="fileupload-preview fileupload-exists thumbnail"
													style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
												<span> <span class="btn btn-theme02 btn-file">
														<span class="fileupload-new"> <i
															class="fa fa-paperclip"></i>image
													</span> <span class="fileupload-exists"><i
															class="fa fa-undo"></i>Change </span> <input type="file"
														class="default" />
												</span> <a href="" class="btn btn-theme04 fileupload-exists"
													data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
														Remove</a>
											</span>
											</span><br>
											<!-- 3번 보기 -->
											<b><input type="text" name="question_choice_num"
												value="3" style="display: none">3.</b> <input
												type="text" name="question_choice_content"
												id="question_choice_content3" class="form-control-inline"
												placeholder="3번 보기 내용을 입력해주세요."> <span
												class="fileupload fileupload-new imageup"
												data-provides="fileupload">
												<div class="fileupload-preview fileupload-exists thumbnail"
													style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
												<span> <span class="btn btn-theme02 btn-file">
														<span class="fileupload-new"> <i
															class="fa fa-paperclip"></i>image
													</span> <span class="fileupload-exists"><i
															class="fa fa-undo"></i>Change </span> <input type="file"
														class="default" />
												</span> <a href="" class="btn btn-theme04 fileupload-exists"
													data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
														Remove</a>
											</span>
											</span><br>
											<!-- 4번 보기 -->
											<b><input type="text" name="question_choice_num"
												value="4" style="display: none">4.</b> <input
												type="text" name="question_choice_content"
												id="question_choice_content4" class="form-control-inline"
												placeholder="4번 보기 내용을 입력해주세요."> <span
												class="fileupload fileupload-new imageup"
												data-provides="fileupload">
												<div class="fileupload-preview fileupload-exists thumbnail"
													style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
												<span> <span class="btn btn-theme02 btn-file">
														<span class="fileupload-new"> <i
															class="fa fa-paperclip"></i>image
													</span> <span class="fileupload-exists"><i
															class="fa fa-undo"></i>Change </span> <input type="file"
														class="default" />
												</span> <a href="" class="btn btn-theme04 fileupload-exists"
													data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
														Remove</a>
											</span>
											</span><br>
											<!-- 5번 보기 -->
											<b><input type="text" name="question_choice_num"
												value="5" style="display: none">5.</b> <input
												type="text" name="question_choice_content"
												id="question_choice_content5" class="form-control-inline"
												placeholder="5번 보기 내용을 입력해주세요."> <span
												class="fileupload fileupload-new imageup"
												data-provides="fileupload">
												<div class="fileupload-preview fileupload-exists thumbnail"
													style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
												<span> <span class="btn btn-theme02 btn-file">
														<span class="fileupload-new"> <i
															class="fa fa-paperclip"></i>image
													</span> <span class="fileupload-exists"><i
															class="fa fa-undo"></i>Change </span> <input type="file"
														class="default" />
												</span> <a href="" class="btn btn-theme04 fileupload-exists"
													data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
														Remove</a>
											</span>
											</span><br>
										</div>
										<!-- choicesInput 끝 -->
									</div>
									<!--객관식 보기 내용 입력 종료 -->

									<!--단답형 보기 시작-->
									<div id="questionShortAnswer" style="display: none;"
										class="col-lg-6">
										<h4>
											<i class="fa fa-angle-right"></i> 단답형 정답 입력
										</h4>
										<!-- 단답형 정답 입력란 -->
										<input type="text" class="form-control" name="question_answer"
											id="questionType2Answer" placeholder="정답을 입력해주세요." required
											disabled>
									</div>
									<!--단답형 내용 입력 종료 -->
								</div>
								<!--문제 내용, 정답, 보기 입력 grid 종료 -->
							</div>
							<!--문제 내용, 정답, 보기 입력 종료 -->
							<hr>
							<button type="reset" class="btn btn-secondary quesCategory">
								취소</button>
							<button type="submit"
								class="btn btn-theme quesCategory pull-right" id="btnSubmit">
								문제 수정</button>

						</form>
						<!-- 문제만들기 패널 종료 -->
						<!-- /form-panel -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->