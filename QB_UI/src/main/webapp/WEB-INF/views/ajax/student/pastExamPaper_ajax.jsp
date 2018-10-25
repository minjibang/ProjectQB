<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
		String questionCount2 = request.getAttribute("questionCount").toString();
		int questionCount = Integer.parseInt(questionCount2);

		double halfCount = questionCount / 2;
		String str = Double.toString(halfCount); //	반으로 나눈 것의 String 값

		String firstRow2 = str.substring(0, str.indexOf("."));
		int firstRow = 0;
		int secondRow = 0;

		if (questionCount % 2 == 0) { //	 짝수 
			firstRow = Integer.parseInt(firstRow2);
			secondRow = Integer.parseInt(firstRow2);
		} else {
			firstRow = Integer.parseInt(firstRow2) + 1;
			secondRow = Integer.parseInt(firstRow2);
		}
%>
	
	<c:set var="firstRow" value="<%=firstRow%>" />
	<c:set var="secondRow" value="<%=secondRow%>" />
	<c:set var="questionCount" value="<%=questionCount%>" />

	<div class="row content-panel exampaneldetail">
		<form method="post" id="answerForm" target="examScheduleDetail">
			<c:forEach var="question" items="${questionList}" varStatus="status">
				<!--  문제 하나의 테이블, id값에는 문제고유번호가 들어간다 -->
				<c:if test="${question.exam_question_seq < 2}">
					<div class="col-lg-5 fst_div" id="examBox">
				</c:if>
				<table class="questionTable">
					<tr class="questionTr">
						<td class="questionTd questionSpace">
							<div class="wrap">
								<img class="oximg_s"
									id="s_img_ques_${question.exam_question_seq}"
									src="${pageContext.request.contextPath}/img/oximg_s.png">
								<img class="oximg_o"
									id="o_img_ques_${question.exam_question_seq}"
									src="${pageContext.request.contextPath}/img/oximg_o.png">
							</div> <b>${question.exam_question_seq}. </b>
						</td>
						<td class="questionSpace"><b>${question.question_name}
								&nbsp;&nbsp;(${question.exam_question_score}점)</b></td>
					</tr>
					<c:if test="${not empty question.question_img}">
						<!-- 이미지 있으면 추가 -->
						<tr class="ques_choice">
							<td class="questionTd"></td>
							<td><img class="question_img"
								src="${pageContext.request.contextPath}/img/${question.question_img}"></td>
						</tr>
					</c:if>
					<c:choose>
						<c:when test="${question.question_type eq '객관식'}">
							<c:forEach var="questionChoice" items="${questionChoiceList}">
								<c:if
									test="${questionChoice.question_num eq question.question_num}">
									<tr class="ques_choice">
										<td class="questionTd">
											<div class="wrap">
												<img
													class="oximg_v oximg_v_ques_${question.exam_question_seq}"
													id="img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}"
													src="${pageContext.request.contextPath}/img/oximg_v.png">
												<img class="soximg_o"
													id="so_img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}"
													src="${pageContext.request.contextPath}/img/oximg_o.png">
											</div> ${questionChoice.question_choice_num})
										</td>
										<td><input type="radio"
											name="student_answer[${status.index}].student_answer_choice"
											id="ques_${question.exam_question_seq}_${questionChoice.question_choice_num}"
											value="${questionChoice.question_choice_num}"> 
											<label
											for="ques_${question.exam_question_seq}_${questionChoice.question_choice_num}">${questionChoice.question_choice_content}</label>
										</td>
									</tr>
									<c:if test="${questionChoice.question_choice_image ne null}">
										<tr>
											<td></td>
											<td><img class="answer_choice_image"
												src="${pageContext.request.contextPath}/img/${questionChoice.question_choice_image}"></td>
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
						</c:when>
						<c:when test="${question.question_type eq '단답형'}">
							<tr class="ques_choice">
								<td class="questionTd"></td>
								<td><input type="text"
									id="ques_${question.exam_question_seq}"
									name="student_answer[${status.index}].student_answer_choice"
									readonly></td>
							</tr>
						</c:when>
					</c:choose>
				</table>
				<c:if test="${question.exam_question_seq == firstRow }">
	</div>
	<div class="col-lg-5 scd-div">
		</c:if>
		</c:forEach>
	</div>

	</form>

	<div class="col-lg-2 trd_div">
		<!-- OMR 시작 div -->
		<table class="tg">
			<tr>
				<th class="tg-baqh qname" colspan="6">답안지</th>
			</tr>
			<c:forEach var="question" items="${questionList}">
				<tr>
					<td class="tg-baqh qnumber">
						<div class="wrap">
							<img class="oximg_s_answer"
								id="ans_s_img_ques_${question.exam_question_seq}"
								src="${pageContext.request.contextPath}/img/oximg_s.png">
							<img class="oximg_o_answer"
								id="ans_o_img_ques_${question.exam_question_seq}"
								src="${pageContext.request.contextPath}/img/oximg_o.png">
						</div> ${question.exam_question_seq}
					</td>
					<c:choose>
						<c:when test="${question.question_type eq '객관식'}">
							<c:set var="count" value="0" />
							<c:forEach var="questionChoice" items="${questionChoiceList}"
								varStatus="status">
								<c:if
									test="${questionChoice.question_num eq question.question_num}">
									<td class="tg-baqh answer_choice">
										<div class="wrap">
											<img
												class="answer_oximg_v oximg_v_ques_${question.exam_question_seq}"
												id="ans_img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}"
												src="${pageContext.request.contextPath}/img/oximg_v.png">
											<img class="answer_oximg_o"
												id="o_ans_img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}"
												src="${pageContext.request.contextPath}/img/oximg_o.png">
										</div> ${questionChoice.question_choice_num} <c:set var="count"
											value="${count+1 }" />
									</td>
								</c:if>
							</c:forEach>
							<c:forEach begin="${count}" end="4">
								<td class="tg-baqh qname"></td>
							</c:forEach>
						</c:when>
						<c:when test="${question.question_type eq '단답형'}">
							<td class="tg-baqh answer_choice" colspan="5"><input
								type="text" id="ques_${question.exam_question_seq}_answer"
								readonly></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>