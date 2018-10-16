<%-- 
	@JSP:examPaperDo.jsp
	@DATE:2018-10-12
	@Author:우한결
	@Desc:학생 시험보기 페이지(스토리보드 39 of 41)
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/examPaperDo.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/lib/onet-js/examPaperDo.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script>
	var exam_info_time = "${dto.exam_info_time}";
	var hour_ms = parseInt(exam_info_time.substr(0, 2))*3600000;
	var minute_ms = parseInt(exam_info_time.substr(3, 5))*60000;
	var second_ms = parseInt(exam_info_time.substr(6))*1000;

	var total_time = hour_ms + minute_ms + second_ms;
	console.log("토탈 타임: "+total_time);
	var current_time = 0;
	var refresh_interval = 0.5;
	var timer;
	
	function refresh_bar() {
	  $( "#progressbar1" ).progressbar({ value: current_time });
	  current_time += refresh_interval;
	  if(current_time > total_time) clearInterval( timer );
	}
	
	$(function() {
	  $( "#progressbar1" ).progressbar({ 
		  max: total_time, 
		  value: current_time 
		  
	  });
	  timer = setInterval( refresh_bar, refresh_interval );
	});
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
					<div id="exam" class="wrap exam_num_1">
						<div>
							<!-- 정답 체크 부분 -->
						</div>
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>
							<img class="exam_check" src="../img/oximg_v.png">
						</div>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>
							<img class="exam_check" src="../img/oximg_v.png">
						</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>
							<img class="exam_check" src="../img/oximg_v.png">
						</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>
							<img class="exam_check" src="../img/oximg_v.png">
						</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						2)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>
							<img class="exam_check" src="../img/oximg_v.png">
						</div>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>
							<img class="exam_check" src="../img/oximg_v.png">
						</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						5)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>
							<img class="exam_check" src="../img/oximg_o.png">
						</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>
							<img class="exam_check" src="../img/oximg_v.png">
						</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						6)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>


				</div>
				<div class="col-lg-5" scd_div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>

						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>

						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>

						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>

						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
					<div id="exam" class="wrap">
						1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
						<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
						<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이 고정된다.</div>
						<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
						<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
					</div>
				</div>
				<div class="col-lg-2 trd_div">
					<table class="tg">
						<tr>
							<th class="tg-baqh qname" colspan="5">답안지</th>
						</tr>
						<tr>
							<td id="ans_num" class="tg-baqh qnumber">1</td>
							<td id="ans_td" class="tg-baqh check_num pointer">	
								<a href="#" onclick="check_num()">1</a>
							</td>
							<td class="tg-baqh">2</td>
							<td class="tg-baqh">3</td>
							<td class="tg-baqh">4</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">2</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">3</td>
							<td class="tg-baqh ">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
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
						<tr>
							<td class="tg-baqh qnumber">8</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">9</td>
							<td class="tg-baqh ">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">10</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">11</td>
							<td class="tg-baqh ">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">12</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">13</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">14</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
						<tr>
							<td class="tg-baqh qnumber">15</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
							<td class="tg-baqh">ⓐ</td>
						</tr>
					</table>
					<br>
				</div>
			</div>
			<button class="btn btn-large btn-primary exampaneldetailBtn">제출하기</button>
		</div>

	</div>


</body>
</html>