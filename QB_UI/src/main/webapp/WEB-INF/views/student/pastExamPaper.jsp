<%-- 
	@JSP:pastExamPaper.jsp
	@DATE:2018-10-25
	@Author:김현이 
	@Desc:학생 지난시험지보기 페이지
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		var student_answer_status = "all";
		pastExamPaperView(student_answer_status);

		$('#wrongQuestionBtn').click(function() {
			
			if(student_answer_status == "all"){
				
				student_answer_status = "wrong";
				pastExamPaperView(student_answer_status);
				searchStudentAnswer(student_answer_status);
				
				$("#wrongQuestionBtn").text("전체 문제 보기");
				
			} else if(student_answer_status == "wrong") {
				
				student_answer_status = "all";
				pastExamPaperView(student_answer_status);
				searchStudentAnswer(student_answer_status);
				
				$("#wrongQuestionBtn").text("틀린 문제만 보기");
				
			}
			
		});	//	wrongbtn 이벤트 종료 

	}); // document.ready 종료
	
	
	// 문제 가져오는 ajax
	function pastExamPaperView(student_answer_status){
		$.ajax({
			url : "pastExamPaperView.do",
			type : 'post',
			data : {
					'exam_info_num' : <%=request.getParameter("exam_info_num")%>,
					'student_answer_status' : student_answer_status
			},
			dataType : "html",
			success : function(data) {
				$('#pastExamQuestion').html(data);
				searchStudentAnswer(student_answer_status); 	// 학생 답안지 가져오는 ajax 
			}
		});
	}


	// 학생 답안지 가져오는 ajax 
	function searchStudentAnswer(student_answer_status) {
		$.ajax({
			url : "searchStudentAnswer.do",
			type : 'get',
			data : {
				'exam_info_num' : <%=request.getParameter("exam_info_num")%>,
				'student_answer_status' : student_answer_status
			},
			success : function(data) {
				$.each(data, function(index, entry) {

					var img_id = "img_ques_" + data[index].exam_question_seq
							+ "_" + data[index].student_answer_choice; // img_ques_5_3
					var ans_id = "ans_" + img_id; // ans_img_ques_5_3

					// 학생이 선택한 답의 보기 체크 - 객관식 
					$('#' + img_id).css("display", "block");
					$('#' + ans_id).css("display", "block");

					if (data[index].student_answer_status == 1) { // 학생이 푼 문제가 정답인 경우 

						// 문제번호에 o 
						var ques_id = "o_img_ques_"
								+ data[index].exam_question_seq;
						$('#' + ques_id).css("display", "block");

						// 답안지 문제번호에 o 
						$('#ans_o_img_ques_' + data[index].exam_question_seq)
								.css("display", "block");

						// 주관식란에 학생이 작성한 답 
						$('#ques_' + data[index].exam_question_seq).val(
								data[index].student_answer_choice);
						$('#ques_' + data[index].exam_question_seq + "_answer")
								.val(data[index].student_answer_choice);

					} else if (data[index].student_answer_status == 0) { // 학생이 푼 문제가 오답인 경우 

						// 문제번호에 x 
						var ques_id = "s_img_ques_"
								+ data[index].exam_question_seq;
						$('#' + ques_id).css("display", "block");

						// 답안지 문제번호에 x
						$('#ans_s_img_ques_' + data[index].exam_question_seq)
								.css("display", "block");

						// 문제에 정답 보기 체크 
						var ques_ans_id = "so_img_ques_"
								+ data[index].exam_question_seq + "_"
								+ data[index].question_answer;
						$('#' + ques_ans_id).css("display", "block");

						//답안지 정답 보기 체크 
						$(
								'#o_ans_img_ques_'
										+ data[index].exam_question_seq + '_'
										+ data[index].question_answer).css(
								"display", "block");

						// 주관식란에 학생이 작성한 답 + 정답
						var short_answer = data[index].student_answer_choice
								+ "  (정답 : " + data[index].question_answer
								+ ")";
						$('#ques_' + data[index].exam_question_seq).val(
								short_answer);
						$('#ques_' + data[index].exam_question_seq + "_answer")
								.val(short_answer);
					}
				});
			}
		});
	} 
</script>
</head>
<body>
	<div class="col-lg-12 mt">
		<div id="timerblock">
			<h3 class="mb exampaneldetailsubject">
				<i class="fa fa-angle-right"></i> ${exam_info.exam_info_name}
			</h3>
		</div>
		<div id="progressbar1"></div>
		<hr>
		<div class="panel-body" id="pastExamPaperPanel">
		
			<div id="pastExamQuestion"></div>
			<!-- 문제 및 답안지 표기 -->
			
		</div>
		<button class="btn btn-theme03 exampaneldetailBtn" id="wrongQuestionBtn">틀린 문제만 보기</button>
	</div>
	</div>
</body>
</html>