<%-- 
	@JSP:questionUpdate.jsp
	@DATE:2018-10-19
	@Author:조재훈
	@Desc:내 문제 수정(스토리보드 33 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- 
	2018.10.12 회준 새 문제 만들기 UI 추가 
	questionManagement.jsp와 css파일 공유
--%>
<link
	href="${pageContext.request.contextPath}/css/questionManagement.css"
	rel="stylesheet">

<!-- 문제 삭제 모달창 시작 -->	
		<div class="modal fade" id="singleDeleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					data-modal-id="">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">문제 삭제</h4>
								<!-- modal-header 끝 -->
							</div>
							<div class="modal-body"><h4>정말 삭제하시겠습니까?</h4><br>
							<h5>문제 제출자 또는 다른 사용자가 해당 문제를 사용하여 <br>
							 시험지 생성 또는 시험지 임시저장 했을 경우 <br>
							 그 문제는 삭제/수정이 불가능합니다.
							 </h5>
							</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
									
										<button id="singleDeleteConfirmBtn" name="deletebtn" class="btn btn-theme" 
										value="" data-dismiss="modal" aria-label="Close">
										확인</button>
										<button class="btn btn-theme04" type="button" data-dismiss="modal">
										취소</button>
										
									</div>
								</div>
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
				</div>
<!-- 문제 삭제 모달창 끝 -->	


<!--main content start-->
<section id="main-content">

	<section class="wrapper site-min-height">
		<div class="content-panel">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12 ">
						<form class="formNewQuestion" action="insertQuestion.do"
							method="post" onsubmit="return check()">
						 <c:forEach items="${qdto}" var="qdto"> 
						 ${qdto}<br>
						 ${cdto}<br>
						 <input type="text" id="qdto_question_num" name="qdto_question_num" style="display: none" value="${qdto.question_num}">
						 <input type="text" name="qdto_question_answer" style="display: none" value="${qdto.question_answer}">
						 <c:forEach items="${cdto}" var="cdto">
						 <input type="text" name="cdto_question_num" style="display: none" value="${cdto.question_num}">  
						 <input type="text" name="cdto_question_choice_num" style="display: none" value="${cdto.question_choice_num}">  
						 <input type="text" name="cdto_question_choice_content" style="display: none" value="${cdto.question_choice_content}"> 
						 </c:forEach>
						 
						 	
							<input type="text" name="member_id"
								value="${qdto.member_id}" style="display: none">
						
							<h3 id="h3id">문제 수정</h3>
							<hr>
							<h4>
							
								<i class="fa fa-angle-right"></i> 출제자:
								 ( ${qdto.member_id} )<br>
								 
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
									<%-- <c:forEach items="${smCatList}" var="smCatList">
										<option value="${smCatList.sm_category_code}" <c:if test='${smCatList.sm_category_code eq qdto.sm_category_code}''> selected </c:if>>
										${smCatList.sm_category_name}</option>
									</c:forEach> --%>
								</select> <select id="level_type" class="form-control-static"
									name="level_code">
									<option value="">난이도</option>
									<c:forEach items="${quesLevelList}" var="quesLevelList">
									
										<option value="${quesLevelList.level_code}"
										<c:if test="${quesLevelList.level_code eq qdto.level_code}"> selected </c:if>>
										${quesLevelList.level_name}</option>
									
									</c:forEach>
								</select>
							</div>
							<h4 class="quesCategory">
								<i class="fa fa-angle-right"></i> 문제 유형
							</h4>
							<span class="radio quesCategorybig"> 
							<label class="questionChoiceRadioButton">
								
								 <input type="radio" name="question_type" id="question_type_1"
								 value="객관식" 
								
								 	<c:if test="${qdto.question_type eq '객관식'}">checked</c:if>
								
								 >객관식
								
							</label> &nbsp;&nbsp; 
							<label class="questionChoiceRadioButton"> 
								<input type="radio" name="question_type" id="question_type_2"
								value="단답형" 
								
							 		<c:if test="${qdto.question_type eq '단답형'}">checked</c:if>
								
								>단답형
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
											placeholder="문제 내용을 입력해주세요." rows="3" required> ${qdto.question_name} </textarea>
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
										<div id="questionChoiceSub1">
											<h4>
												<i class="fa fa-angle-right"></i> 객관식 정답 입력
											</h4>
											<div class="radio" id="answerChoiceText">

											</div>
											<br>
										<hr> 
										</div><!-- /questionChoiceSub1 -->
										<div id="questionChoiceSub2">
										<h4>
											<i class="fa fa-angle-right"></i>객관식 보기 입력
										</h4>
										
											<select id="howManyChoices" class="form-control-static"
												name="howManyChoices">
												<option value="10" selected disabled>보기 개수 선택</option> 
												<option value="2"
												<c:if test="${fn:length(cdto) eq 2}"> selected </c:if>
												>보기 개수: 2개</option>
												<option value="3"
												<c:if test="${fn:length(cdto) eq 3}"> selected </c:if>
												>보기 개수: 3개</option>
												<option value="4"
												<c:if test="${fn:length(cdto) eq 4}"> selected </c:if>
												>보기 개수: 4개</option>
												<option value="5"
												<c:if test="${fn:length(cdto) eq 5}"> selected </c:if>
												>보기 개수: 5개</option>
											</select>
											<p id="warning_text">주의 - 보기 개수 변경시 기존의 문제보기 입력값이 초기화됩니다.</p>
										</div><!-- /questionChoiceSub2 -->
										<br>
										<!-- 1번 보기 -->
										<div id="choiceInput">
											
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
											id="questionType2Answer" placeholder="정답을 입력해주세요."
											value="${qdto.question_answer}" required
											disabled>
									</div>
									<!--단답형 내용 입력 종료 -->
								</div>
								<!--문제 내용, 정답, 보기 입력 grid 종료 -->
							</div>
							<!--문제 내용, 정답, 보기 입력 종료 -->
							<hr>
							<button type="button" class="btn btn-secondary quesCategory"
								id="btnUpdateCancel">
								취소</button>
								
							<button type="button" id="deleteQuestionBtn" name="deleteQuestionBtn"
								class="btn btn-theme04 buttonGroup quesCategory" data-toggle="modal"
								data-target="#singleDeleteModal"
								data-modal-id="${question.question_num}">
								<i class="fa fa-trash-o"></i>문제 삭제</button>
								
							<button type="submit"
								class="btn btn-theme quesCategory pull-right" id="btnSubmit">
								수정 완료</button>
						</c:forEach>
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

<script
	src="${pageContext.request.contextPath}/lib/onet-js/questionUpdate.js"
	type="text/javascript"></script>

<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기, 관리자-전체문제, 강사-내가 만든 문제 스크립트 시작 -->

<script>
$(document).ready(function() {	
		$('#question_lg_category').change(
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

		$('#question_md_category').change(
						function() {
							$('#question_sm_category').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document.getElementById("question_md_category").value == "${smlist.md_category_code}") {
								$('#question_sm_category')
										.append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})

		$('#question_lg_category2').change(
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

		$('#question_md_category2').change(
						function() {
							$('#question_sm_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document.getElementById("question_md_category2").value == "${smlist.md_category_code}"){
								$('#question_sm_category2').append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})
		
})
</script>			
