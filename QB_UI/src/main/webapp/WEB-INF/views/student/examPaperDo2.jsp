<%-- 
	@JSP:examPaperDo.jsp
	@DATE:2018-10-12
	@Author:우한결
	@Desc:학생 시험보기 페이지(스토리보드 39 of 41)
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/examPaperDo.css"
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
	//	프로그레스바 script 부분
	var exam_info_time = "${dto.exam_info_time}";
	var hour_ms = parseInt(exam_info_time.substr(0, 2)) * 3600000;
	var minute_ms = parseInt(exam_info_time.substr(3, 5)) * 60000;
	var second_ms = parseInt(exam_info_time.substr(6)) * 1000;

	var total_time = hour_ms + minute_ms + second_ms;
	console.log("토탈 타임: " + total_time);
	var current_time = 0;
	var refresh_interval = 50;
	var timer;

	function refresh_bar() {
		$("#progressbar1").progressbar({
			value : current_time
		});
		current_time += refresh_interval;
		if (current_time > total_time)
			clearInterval(timer);
	}

	// document.ready 시작 
	$(function() {

		// 프로그레스바 script
		$("#progressbar1").progressbar({
			max : total_time,
			value : current_time
		});
		timer = setInterval(refresh_bar, refresh_interval);

		
		// 문제 및 답지 체크 script 시작 
		// 문제 보기를 클릭했을 때 답안지에도 표시 
		$('input[type="radio"]').click(function() {
			var oximg_v_class = "oximg_v_" + $(this).attr("id").substr(0, 6);
			$("." + oximg_v_class).css("display", "none");

			var img_id = "img_" + $(this).attr("id");
			var ans_img_id = "ans_" + img_id;
			$('#' + img_id).css("display", "block");
			$('#' + ans_img_id).css("display", "block");
		});

		// 답안지를 클릭했을 때 문제 보기에도 표시 
		$('.answer_choice').click(function() {
			var ques_num = $(this).find('img').attr('class').substr(15);
			$("." + ques_num).css("display", "none"); // 이걸로 한 문제의 체크 이미지 전체를 지운다. 

			var img_ques_id = $(this).find('img').attr('id').substr(4);
			$("#" + img_ques_id).css("display", "block"); //  문제 보기에 체크 이미지 보이게  
			$(this).find('img').css("display", "block"); // 답지에 체크 이미지 보이게 
		});

		// 단답형 답 문제지와 답지 동시에 입력하기 
		$('#ques_2').change(function() {
			$('#ques_2_answer').val($(this).val());
		});
		$('#ques_2_answer').change(function() {
			$('#ques_2').val($(this).val());
		});
		
	});  // document.ready 종료 
</script>
</head>
<body>
	<div class="col-lg-12 mt">
		<div id="timerblock">
			<h3 class="mb exampaneldetailsubject">
				<i class="fa fa-angle-right"></i> ${dto.exam_info_name}
			</h3>
			<h4>남은 시간: ${dto.exam_info_time}</h4>
		</div>
		<div id="progressbar1"></div>
		<hr>
		<div class="panel-body">
			<div class="row content-panel exampaneldetail">
				<div class="col-lg-5 fst_div" id="examBox">
 				<c:forEach var="question" items="${examPaperDoDto}">
					문제고유번호 : ${question.question_num}<br>
					문제의 문제 : ${question.question_name}<br>
					문제 : ${question}<br><br>
				</c:forEach> 
				
<%-- 				문제 : <c:out value="${examPaperDoDto}" /> <br>
				
				<c:forEach var="question" items="${examPaperDoDto}" varStatus="status">     
					문제 : ${question.question_name}<br>
					문제 : <c:out value="${question.question_name}" /> 
				</c:forEach> --%>
                    
                    
                    <table class="questionTable">  <!--  문제 하나의 테이블, id값에는 문제고유번호가 들어간다 -->
                        <input type="hidden" name="문제고유번호" value="">
                        <input type="hidden" name="문제배치번호" value="">
						<tr class="questionTr">
							<td class="questionTd questionSpace"><b>1.</b></td>
							<td class="questionSpace"><b>다음 중 옳은 것은? &nbsp;&nbsp;(3점)</b></td>
						</tr>
						<tr class="ques_choice">
							<td class="questionTd"><div class="wrap"><img class="oximg_v oximg_v_ques_1" id="img_ques_1_1" src="../img/oximg_v.png"></div>1)</td>  
							<td><input type="radio" name="ques_1" id="ques_1_1" value="1"><label for="ques_1_1">멤버 변수와 메서드에 static를 지정할 수 있다.</label></td>
						</tr>
						<tr class="ques_choice">
							<td class="questionTd"><div class="wrap"><img class="oximg_v oximg_v_ques_1" id="img_ques_1_2" src="../img/oximg_v.png"></div>2)</td>
                            <td><input type="radio" name="ques_1" id="ques_1_2" value="2"><label for="ques_1_2">static형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.static형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.</label></td>
						</tr>
						<tr class="ques_choice">
							<td class="questionTd"><div class="wrap"><img class="oximg_v oximg_v_ques_1" id="img_ques_1_3" src="../img/oximg_v.png"></div>3)</td>
                            <td><input type="radio" name="ques_1" id="ques_1_3" value="3"><label for="ques_1_3">static형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.</label></td>
						</tr>
						<tr class="ques_choice">
							<td class="questionTd"><div class="wrap"><img class="oximg_v oximg_v_ques_1" id="img_ques_1_4" src="../img/oximg_v.png"></div>4)</td>
                            <td><input type="radio" name="ques_1" id="ques_1_4" value="4"><label for="ques_1_4">static형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.</label></td>
						</tr>
						<tr class="ques_choice">
							<td class="questionTd"><div class="wrap"><img class="oximg_v oximg_v_ques_1" id="img_ques_1_5" src="../img/oximg_v.png"></div>5)</td>
                            <td><input type="radio" name="ques_1" id="ques_1_5" value="5"><label for="ques_1_5">static형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.</label></td>
						</tr>
					</table>
                    
                    
                    <table class="questionTable">  <!--  단답형 문제 하나의 테이블 -->
                        <input type="hidden" name="문제고유번호" value="">
                        <input type="hidden" name="문제배치번호" value="">
						<tr class="questionTr">
							<td class="questionTd questionSpace"><b>2.</b></td>
							<td class="questionSpace"><b>단답형 답을 적으세요. &nbsp;&nbsp;(3점)</b></td>
						</tr>
                        <tr class="ques_choice">
							<td class="questionTd"></td>  
							<td><img class="question_img" src="../img/sampleQuestionImg.jpg"></td>
						</tr>
						<tr class="ques_choice">
							<td class="questionTd"></td>  
							<td><input type="text" id="ques_2" name="ques_2"></td>
						</tr>
					</table>
                    
					
					
				</div><!-- 단의 왼쪽 끝 div -->
                
                
                
                
                
                
				<div class="col-lg-5 scd_div" ><!-- 단의 오른쪽 시작 div -->

					



				</div>
				<!-- 단의 오른쪽 끝  div -->
                
                
                
                
				<div class="col-lg-2 trd_div">
                    
					<!-- OMR 시작 div -->
					<table class="tg">
						<tr>
							<th class="tg-baqh qname" colspan="6">답안지</th>
						</tr>
                        <tr>
							<td class="tg-baqh qnumber">1</td>
							<td class="tg-baqh answer_choice">
                                <div class="wrap"><img class="answer_oximg_v oximg_v_ques_1" id="ans_img_ques_1_1" src="../img/oximg_v.png"></div>
                                1
                            </td>
                            <td class="tg-baqh answer_choice">
                                <div class="wrap"><img class="answer_oximg_v oximg_v_ques_1" id="ans_img_ques_1_2" src="../img/oximg_v.png"></div>
                                2
                            </td>
                            <td class="tg-baqh answer_choice">
                                <div class="wrap"><img class="answer_oximg_v oximg_v_ques_1" id="ans_img_ques_1_3" src="../img/oximg_v.png"></div>
                                3
                            </td>
                            <td class="tg-baqh answer_choice">
                                <div class="wrap"><img class="answer_oximg_v oximg_v_ques_1" id="ans_img_ques_1_4" src="../img/oximg_v.png"></div>
                                4
                            </td>
                            <td class="tg-baqh answer_choice">
                                <div class="wrap"><img class="answer_oximg_v oximg_v_ques_1" id="ans_img_ques_1_5" src="../img/oximg_v.png"></div>
                                5
                            </td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">2</td>
							<td class="tg-baqh answer_choice" colspan="5"><input type="text" name="" id="ques_2_answer" ></td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">4</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">5</td>
							<td class="tg-baqh ">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">6</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">7</td>
							<td class="tg-baqh ">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
					</table>
					<br>
				</div>
			</div>
			<button class="btn btn-theme03 exampaneldetailBtn">제출하기</button>
		</div>
		
		
		

	</div>


</body>
</html>