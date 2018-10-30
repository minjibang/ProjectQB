<%-- 
	@JSP:examDetailView.jsp 
	@DATE:2018-10-08
	@Author:김현이
	@Desc:클래스 목록 페이지(스토리보드 30, 38 of 41)
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<link
	href="${pageContext.request.contextPath}/css/examScheduleDetail.css"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/lib/onet-js/examScheduleDetail.js"></script> --%>



<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel panelControl">

					<div class="row">

						<div class="col-lg-5 examImgDiv">
							<img id="examImg"
								src="${pageContext.request.contextPath}/img/friends/fr-02.jpg">
							<h3>${dto.exam_info_name}</h3>
							<br> <br> <br>
						</div>
						<div class="col-lg-7">
							<div class="row">
								<table class="table examScheduleTable">
									<tbody>
										<tr>
											<td>시험 일시</td>
											<td>${dto.exam_info_date} &nbsp;&nbsp;&nbsp; ${dto.exam_info_start} ~ ${dto.exam_info_end}</td>
										</tr>
										<tr>
											<td>시험 시간</td>
											<td>${dto.exam_info_time}</td>
										</tr>
										<tr>
											<td>종료 알림</td>
											<td>5분 전</td>
										</tr>
										<tr>
											<td>응시 대상</td>
											<td>${dto.exam_info_member}</td>
										</tr>
										<tr>
											<td>설명</td>
											<td>${dto.exam_info_desc}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-lg-3 clockImgDiv">
									<img id="clockImg"
										src="${pageContext.request.contextPath}/img/clock2.png">
								</div>
								<div id="Exam_DDay" class="col-lg-7">
									<span id="daysRound"></span>
									<span id="hoursRound"></span>
									<span id="minutesRound"></span>
									<span id="secondsRound"></span>
								</div>
							</div>
							<div class="row examBtnDiv">
								<br> <br> <br> <br>
							</div>
						</div>
					</div>
					<div class="row examScheduleBtnDiv">
						<div class="col-lg-5">
							<button type="button" class="btn btn-default" id="examScheduleBackBtn">뒤로 가기</button>
						</div>
						<!-- 강사일 경우 버튼이 "시험 시작" / 학생일 경우 버튼이 "시험 응시"-->
						<div class="col-lg-7">
						<se:authorize access="hasRole('ROLE_TEACHER')">
							<button class="btn btn-theme03" id="examBtn">시험감독</button>
						</se:authorize>
						<se:authorize access="hasRole('ROLE_STUDENT')">
							<button class="btn btn-theme03" id="examBtn">시험시작</button>
						</se:authorize>
							
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- /wrapper -->
</section>

<script>
	$(document).ready(function(){		
		/*시험 응시*/
		
		$('#examBtn').click(function() {
			if(examStartDaysRound<0 && examEndDaysRound>=0){
				
				/* if(권한이 학생이라면){ */
					$.ajax({
						url : "searchStudentAnswer.do",
						type : 'get',
						data : {
							'exam_info_num' : <%=request.getParameter("exam_info_num")%>,
							'student_answer_status' : "all"
						},
						success : function(data) {
							if(data.length > 0 ){
									swal("\n이미 시험에 응시하셨습니다."); 
							} else if (data.length == 0){
								
								alert("시험 응시 버튼을 눌렀다.");

								//var popupX = (window.screen.width / 2) - (200 / 2);
								// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
								//var popupY= (window.screen.height /2) - (300 / 2);
								// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
								//window.open('', '', 'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
								
								var popUrl = "examPaperDo2.do?exam_info_num=${dto.exam_info_num}";
								var popOption = "width='1920px', height=1080px'";
								
								window.name = "examScheduleDetail";	//	부모창의 이름을 지정해줌
								window.open(popUrl, "지난 시험보기", popOption);
							}
						}
					});
				/* }  */ // 권한이 학생이라면 if문 종료 괄호
				
			} else {
				alert("시험이 종료되었습니다.")
			}
		});
		
		//시험 D-Day 시간계산
		var exam_info_date='${dto.exam_info_date}';
		var exam_info_start='${dto.exam_info_start}';
		var exam_info_end='${dto.exam_info_end}';
		
		var time1 = exam_info_date.split('-');
		var time2 = exam_info_start.split(':');
		var time3 = exam_info_end.split(':');
					
		var exam_info_date='${dto.exam_info_date}';
		var exam_info_start='${dto.exam_info_start}';
		var exam_info_end='${dto.exam_info_end}';
		
		var time1 = exam_info_date.split('-');
		var time2 = exam_info_start.split(':');
		var time3 = exam_info_end.split(':');
		
		var nowTime = new Date();
		var examStartTime = new Date(time1[0],time1[1]-1,time1[2],time2[0],time2[1],time2[2]);
		var examEndTime = new Date(time1[0],time1[1]-1,time1[2],time3[0],time3[1],time3[2]);
		
		var dDays = (examStartTime-nowTime)/1000/60/60/24;
		var examStartDaysRound = Math.floor(dDays);
		// 시작시간까지 원하는 날짜, 시간 정확하게 초단위까지 기입.
		var dHours = (examStartTime-nowTime)/1000/60/60-(24*examStartDaysRound);
		var examStartHoursRound = Math.floor(dHours);
		var dMinutes = (examStartTime-nowTime)/1000/60-(24*60*examStartDaysRound)-(60*examStartHoursRound);
		var examStartMinutesRound = Math.floor(dMinutes);
		var dSeconds = (examStartTime-nowTime)/1000-(24*60*60*examStartDaysRound)-(60*60*examStartHoursRound)-(60*examStartMinutesRound);
		var examStartSecondsRound = Math.round(dSeconds);					
		
		var eDays = (examEndTime-nowTime)/1000/60/60/24;
		var examEndDaysRound = Math.floor(eDays);
		
		// 원하는 날짜, 시간 정확하게 초단위까지 기입.
		var eHours = (examEndTime-nowTime)/1000/60/60-(24*examEndDaysRound);
		var examEndHoursRound = Math.floor(eHours);
		var eMinutes = (examEndTime-nowTime)/1000/60-(24*60*examEndDaysRound)-(60*examEndHoursRound);
		var examEndMinutesRound = Math.floor(eMinutes);
		var eSeconds = (examEndTime-nowTime)/1000-(24*60*60*examEndDaysRound)-(60*60*examEndHoursRound)-(60*examEndMinutesRound);
		var examEndSecondsRound = Math.round(eSeconds);
							
		console.log(typeof(examEndDaysRound));
		console.log("examEndDaysRound : "+examEndDaysRound);
		console.log("examStartDaysRound : "+examStartDaysRound);
		
		if(examStartDaysRound >= 0){
			$('#daysRound').html("시험 시작까지 "+examStartDaysRound+"일");
			$('#hoursRound').html(examStartHoursRound+"시간");
			$('#minutesRound').html(examStartMinutesRound+"분");
			$('#secondsRound').html(examStartSecondsRound+"초 남았습니다.<br>시험 시작 시간이 되면 시험 감독 버튼이 활성화됩니다.");
			$('#examBtn').attr('disabled',true);
		}else if(examStartDaysRound<0 && examEndDaysRound>=0){
			$('#hoursRound').html("시험이 시작되었습니다.<br>시험 종료까지 "+examEndHoursRound+"시간");
			$('#minutesRound').html(examEndMinutesRound+"분");
			$('#secondsRound').html(examEndSecondsRound+"초 남았습니다.");
			$('#examBtn').attr('disabled',false);
		}else if(examStartDaysRound<0 && examEndDaysRound < 0){
			$('#hoursRound').empty();
			$('#minutesRound').empty();
			$('#secondsRound').empty();
			$('#daysRound').html("시험이 종료 되었습니다. 수고하셨습니다.");
			$('#examBtn').attr('disabled', true);
		}
		
		$('#examScheduleBackBtn').click(function(){
			history.back();
		});
		
	});
</script>