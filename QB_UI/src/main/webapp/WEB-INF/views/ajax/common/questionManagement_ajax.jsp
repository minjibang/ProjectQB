<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
</head>
<body>
	<c:forEach items="${question }" var="question">
		<div class="myQuestions">
			<div
				class="questionDiv col-lg-12 questionDiv_${question.question_num }">
				
				<div class="col-lg-2">
					${question.md_category_name}<br> ${question.sm_category_name }<br>
					난이도: ${question.level_name}<br> 
					<c:if test="${question.question_type eq '객관식'}">
					정답:${question.question_answer }<br>
					</c:if>
					정답률:${question.question_correct_ratio}%<br> 출제자:
					${question.member_id }<br>
				</div>
				<div class="col-lg-9">
					<b>${question.question_name }</b><br> <br>
					<div class="questionImgDiv">
					<!-- 문제에 이미지가 있다면 questionImgDiv 밑에 추가 -->
						<c:if test="${question.question_img ne null }">
							<img
								src="${pageContext.request.contextPath}/upload/${question.question_img}"
								alt="questionImg" class="questionImg" />
						</c:if>
					</div>
					<br>
					<div>
						<c:if test="${question.question_type eq '단답형'}">
							<p>정답:  ${question.question_answer } </p>
						</c:if>
					
						<c:forEach items="${question_choice}" var="question_choice">
							<c:if
								test="${question_choice.question_num eq question.question_num}">
								<div class="col-lg-6 QCdiv">
								<p>${question_choice.question_choice_num}. &nbsp;&nbsp; ${question_choice.question_choice_content}</p>
									<c:if test="${question_choice.question_choice_image ne null }">
										<img
										src="${pageContext.request.contextPath}/upload/${question_choice.question_choice_image}"
										alt="choiceImg" class="choiceImg" />
										<!-- 문제에 이미지가 있다면 questionImgDiv 밑에 추가 -->
									</c:if>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-1">
					<button type="button" id="updateMyQuestionBtn" name="updateMyQuestionBtn" 
					class="btn btn-theme buttonGroup " data-toggle="modal"
					data-target="#singleUpdateModal" 
					data-modal-id="${question.question_num}">
					<i class="fa fa-pencil"></i> 수정</button>
					
					<button type="button" id="deleteMyQuestionBtn" name="deleteMyQuestionBtn"
					class="btn btn-theme04 buttonGroup " data-toggle="modal"
					data-target="#singleDeleteModal"
					data-modal-id="${question.question_num}">
					<i class="fa fa-trash-o"></i> 삭제</button>
					
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<hr>
		</div>
	</c:forEach>
</body>
</html>