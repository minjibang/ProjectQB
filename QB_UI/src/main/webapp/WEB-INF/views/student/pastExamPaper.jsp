<%-- 
	@JSP:examPaperDo.jsp
	@DATE:2018-10-12
	@Author:우한결
	@Desc:학생 시험보기 페이지(스토리보드 39 of 41)
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/pastExamPaper.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/lib/onet-js/examPaperDo.js"></script> --%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script>

	// document.ready 시작 
	$(function() {
		
		$.ajax({
			url : "searchStudentAnswer.do",
			type : 'get',
			data : { 'exam_info_num': <%= request.getParameter("exam_info_num") %> }, 
			success : function(data){
				$.each(data, function(index, entry){
					
					var img_id = "img_ques_" + data[index].exam_question_seq +"_"+ data[index].student_answer_choice;  // img_ques_5_3
					var ans_id = "ans_" + img_id;   // ans_img_ques_5_3
					
					// 학생이 선택한 답의 보기 체크 - 객관식 
					$('#' + img_id).css("display", "block");
					$('#' + ans_id).css("display", "block");
					
					// 학생이 선택한 답의 보기 체크 - 주관식
					// 해야한다아아아아아ㅏ
					
					if(data[index].student_answer_status == 1){  // 학생이 푼 문제가 정답인 경우 
						
						// 문제번호에 o 
						var ques_id = "o_img_ques_" + data[index].exam_question_seq;
						console.log(ques_id);
						$('#' + ques_id).css("display", "block");
						
					} else if (data[index].student_answer_status == 0) { // 학생이 푼 문제가 오답인 경우 
						
						// 문제번호에 x 
						var ques_id = "s_img_ques_" + data[index].exam_question_seq;
						$('#' + ques_id).css("display", "block");
						
						// 정답 보기 체크 
						
						
					}
					
				});
				
			}
		});
		
		
	});  // document.ready 종료 
</script>
</head>
<body>
<%
	String questionCount2 = request.getAttribute("questionCount").toString();
	int questionCount = Integer.parseInt(questionCount2);
	
	double halfCount = questionCount / 2;
	String str = Double.toString(halfCount);			//	반으로 나눈 것의 String 값
	
	String firstRow2 = str.substring(0, str.indexOf(".")); 
	int firstRow = 0;
	int secondRow = 0;
	
	if (questionCount % 2 == 0) {	//	 짝수 
		firstRow = Integer.parseInt(firstRow2);
		secondRow = Integer.parseInt(firstRow2);
	} else {
		firstRow = Integer.parseInt(firstRow2) + 1;
		secondRow = Integer.parseInt(firstRow2);
	}
%>	
<%-- <c:set var="studentAnswerList" value="${studentAnswerList}"/> --%>
	<div class="col-lg-12 mt">
		<div id="timerblock">
			<h3 class="mb exampaneldetailsubject">
				<i class="fa fa-angle-right"></i> ${exam_info.exam_info_name}
			</h3>
		</div>
		<div id="progressbar1"></div>
		<hr>
		<div class="panel-body">
			<div class="row content-panel exampaneldetail">
				<c:set var="firstRow" value="<%=firstRow%>"/>
				<c:set var="secondRow" value="<%=secondRow%>"/>
				<c:set var="questionCount" value="<%=questionCount%>"/>
			
			<form method="post" id="answerForm" target="examScheduleDetail">
			
				<c:forEach var="question" items="${questionList}" varStatus="status"> <!--  문제 하나의 테이블, id값에는 문제고유번호가 들어간다 -->		
					<c:if test="${question.exam_question_seq < 2}">
						<div class="col-lg-5 fst_div" id="examBox">	
					</c:if>
							<table class="questionTable">
  								<input type="hidden" name="student_answer[${status.index}].member_id" value="${pageContext.request.userPrincipal.name}"> 
								<input type="hidden" name="student_answer[${status.index}].exam_info_num" value="${exam_info.exam_info_num}">
		                        <input type="hidden" name="student_answer[${status.index}].question_num" value="${question.question_num}"> 
		                        <input type="hidden" name="student_answer[${status.index}].exam_question_seq" value="${question.exam_question_seq}">  
								<tr class="questionTr">
									<td class="questionTd questionSpace">
										<div class="wrap">
											<img class="oximg_s" id="s_img_ques_${question.exam_question_seq}" 
												src="${pageContext.request.contextPath}/img/oximg_s.png">
											<img class="oximg_o" id="o_img_ques_${question.exam_question_seq}" 
												src="${pageContext.request.contextPath}/img/oximg_o.png">
										</div>
										<b>${question.exam_question_seq}. </b>
									</td>
									<td class="questionSpace"><b>${question.question_name} &nbsp;&nbsp;(${question.exam_question_score}점)</b></td>
								</tr>
								<c:if test="${not empty question.question_img}"> <!-- 이미지 있으면 추가 -->
									<tr class="ques_choice">
										<td class="questionTd"></td>  
										<td><img class="question_img" src="${pageContext.request.contextPath}/img/${question.question_img}"></td>
									</tr>
								</c:if>
								<c:choose>
									<c:when test="${question.question_type eq '객관식'}">
										<c:forEach var="questionChoice" items="${questionChoiceList}">
											<c:if test="${questionChoice.question_num eq question.question_num}">
											<tr class="ques_choice">
												<td class="questionTd">
													<div class="wrap">
														<img class="oximg_v oximg_v_ques_${question.exam_question_seq}" id="img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}" 
														src="${pageContext.request.contextPath}/img/oximg_v.png">
													</div>
													${questionChoice.question_choice_num})
												</td>  	
												<td>
													<input type="radio" name="student_answer[${status.index}].student_answer_choice" id="ques_${question.exam_question_seq}_${questionChoice.question_choice_num}" 
													value="${questionChoice.question_choice_num}">
													<label for="ques_${question.exam_question_seq}_${questionChoice.question_choice_num}">${questionChoice.question_choice_content}</label>
												</td>
											</tr>
												<c:if test="${questionChoice.question_choice_image ne null}">
													<tr>
														<td></td><td><img class="answer_choice_image" src="${pageContext.request.contextPath}/img/${questionChoice.question_choice_image}"></td>
													</tr>
												</c:if>
											</c:if>
										</c:forEach>
									</c:when>
									<c:when test="${question.question_type eq '단답형'}">
										<tr class="ques_choice">
											<td class="questionTd"></td>  
											<td><input type="text" id="ques_${question.exam_question_seq}" name="student_answer[${status.index}].student_answer_choice"></td>
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
                        <td class="tg-baqh qnumber">${question.exam_question_seq}</td>
                        <c:choose>
                           <c:when test="${question.question_type eq '객관식'}">
                           <c:set var="count" value="0" />
                              <c:forEach var="questionChoice" items="${questionChoiceList}" varStatus="status">
                                 <c:if test="${questionChoice.question_num eq question.question_num}">                                 
                                     <td class="tg-baqh answer_choice">
                                             <div class="wrap"><img class="answer_oximg_v oximg_v_ques_${question.exam_question_seq}" 
                                             id="ans_img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}" 
                                             src="${pageContext.request.contextPath}/img/oximg_v.png"></div>
                                             ${questionChoice.question_choice_num}
                                             <c:set var="count" value="${count+1 }"/>
                                     </td>                                                                                          
                                 </c:if>
                              </c:forEach>	
                              <c:forEach begin="${count}" end="4">
                                 <td class="tg-baqh qname"></td>
                              </c:forEach>
                           </c:when>
                           <c:when test="${question.question_type eq '단답형'}">
                              <td class="tg-baqh answer_choice" colspan="5"><input type="text" class="" name="" id="ques_${question.exam_question_seq}_answer" ></td>
                           </c:when>
                        </c:choose>
                     </tr>
                  </c:forEach>
               </table>
					<br>
				</div>
			</div>
			<button class="btn btn-theme03 exampaneldetailBtn" id="wrongQuestionBtn">틀린 문제만 보기</button>
		</div>
	</div>
</body>
</html>