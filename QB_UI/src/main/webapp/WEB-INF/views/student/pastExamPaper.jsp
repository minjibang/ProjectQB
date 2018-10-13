<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>지난 시험보기</title>
<style>
/* 상단 테이블 header부분 */
.title_table {
	width: 100%;
	text-align: center;
}

.exam_title {
	font-size: 25px;
	font-weight: bold;
	width: 70%;
}

.exam_title_side {
	width: 15%;
}

/* 하단 문제부분 table 관련 */
.outside_table {
	width: 100%;
	border-top: 1px solid black;
}

.inside_table {
	width: 100%;
	margin-bottom: 15px;
}

.fst_td {
	border-right: 1px solid black;
	padding-left: 10px;
	width: 43%;
	vertical-align:top;

}

.scd_td {
	vertical-align: top;
	padding-left: 10px;
	width: 43%;
	vertical-align:top;

}

.trd_td {
	width: 14%;
	vertical-align:top;
}

.question_tr {
	font-weight: bold;
}

.question_num {
	vertical-align: top;
}

/* 정답 체크부분. */
.inside_table_ox {
	width: 55px;
	height: 45px;
}

/* OMR 부분 */
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: black;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: black;
}

.tg .tg-baqh {
	text-align: center;
	vertical-align: top
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

.qnumber {
	background-color: #EAEAEA;
	color: #22741C;
	font-weight: bold;
}

.qname {
	background-color: #EAEAEA;
	color: #22741C;
	font-weight: bold;
}

.tg-baqh {
	font-weight: bold;
}


.wrap {
	position: relative;
}
/* 정답, 오답 */
.exam_ox {
	width: 60px;
	height: 45px;
	position: absolute;
	left: 0px;
	top: 4px;
}
/* 내가 표시한 답 */
.exam_check {
	width: 20px;
	height: 15px;
	position: absolute;
	left: 11px;
}
/* 실제 정답 */
.exam_ox_check {
	width: 25px;
	height: 20px;
	position: absolute;
	left: 8px;
}

/* 현이 제출 버튼 우측으로 정렬 */
.pastExamRowDiv {
	margin: 30px;
	text-align: center;
}

</style>
</head>
<body>
	<!-- <section id="main-content"> <section
		class="wrapper site-min-height">
	<div class="row">
		<div class="content-panel">
			<div>
				<table class="title_table">
					<tr>
						<td class="exam_title_side">1 / 4 페이지<br> 비트캠프 - 자바 109기
						</td>
						<td class="exam_title">자바의 기본 개념과 활용</td>
						<td class="exam_title_side">강사 홍길동</td>
					</tr>
				</table>
			</div>
			<table class="outside_table">
				<tbody>
					<tr>
						<td class="fst_td">
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td class="question_num">1)</td>
										<td>다음은 static에 대한 설명이다. 틀린 것은? (3점)</td>
									</tr>
									<tr>
										<td class="question_num"><a href="#">1.</a></td>
										<td>멤버 변수와 메서드에 static을 지정할 수 있다.</td>
									</tr>
									<tr>
										<td class="question_num"><a href="#">2.</a></td>
										<td>static형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.</td>
									</tr>
									<tr>
										<td class="question_num">3.</td>
										<td>static 메서드 안에 선언되는 변수들은 모두 static 변수이다.</td>
									</tr>
									<tr>
										<td class="question_num">4.</td>
										<td>static 메서드 안에서는 this 나 super를 사용할 수 있다.</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td class="scd_td">
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td>1)</td>
										<td>릴레이션에 포함되어 있는 튜플의 수는? (3점)</td>
									</tr>
									<tr>
										<td>1.</td>
										<td>Cardianlity</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Schema</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Type</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Degree</td>
									</tr>
								</tbody>
							</table>
							<table class="inside_table">
								<tbody>
									<tr class="question_tr">
										<td class="question_num">1)</td>
										<td>다음은 static에 대한 설명이다. 틀린 것은? (3점)</td>
									</tr>
									<tr>
										<td class="question_num"><a href="#">1.</a></td>
										<td>멤버 변수와 메서드에 static을 지정할 수 있다.</td>
									</tr>
									<tr>
										<td class="question_num"><a href="#">2.</a></td>
										<td>static형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.</td>
									</tr>
									<tr>
										<td class="question_num">3.</td>
										<td>static 메서드 안에 선언되는 변수들은 모두 static 변수이다.</td>
									</tr>
									<tr>
										<td class="question_num">4.</td>
										<td>static 메서드 안에서는 this 나 super를 사용할 수 있다.</td>
									</tr>
								</tbody>
							</table>
							
						</td>
						<td class="trd_td">

							<table class="tg">
								<tr>
									<th class="tg-baqh qname" colspan="5">답안지</th>
								</tr>
								<tr>
									<td class="tg-baqh qnumber">1</td>
									<td class="tg-baqh ">ⓐ</td>
									<td class="tg-baqh">ⓐ</td>
									<td class="tg-baqh">ⓐ</td>
									<td class="tg-baqh">ⓐ</td>
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

						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
	</section> </section> -->

	
				<div class="col-lg-12 mt">

						<div id="timerblock">
							<h3 class="mb exampaneldetailsubject">
								<i class="fa fa-angle-right"></i> 비트캠프109기-JAVA기본
							</h3>
							 ANIMATED PROGRESS BARS

							<h4>남은 시간: 00분 00초</h4>
						</div>
						<div class="progress progress-striped active" id="timer">
							<div class="progress-bar" role="progressbar" aria-valuenow="45"
								aria-valuemin="0" aria-valuemax="100" style="width: 45%">
								<span class="sr-only">45% Complete</span>
							</div>
						</div>
						<hr>
						<div class="panel-body">
						<div class="row content-panel exampaneldetail">
							<div class="col-lg-5 fst_div" id="examBox">
								<div id="exam" class="wrap">
									<div><img class="exam_ox" src="../img/oximg_o.png"></div>
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									<div><img class="exam_ox" src="../img/oximg_s.png"></div>
									2)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div><img class="exam_check" src="../img/oximg_v.png"></div>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div><img class="exam_ox_check" src="../img/oximg_o.png"></div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									<div><img class="exam_ox" src="../img/oximg_o.png"></div>
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div><img class="exam_ox_check" src="../img/oximg_o.png"></div>
									<div><img class="exam_check" src="../img/oximg_v.png"></div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									<div><img class="exam_ox" src="../img/oximg_s.png"></div>
									5)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div><img class="exam_check" src="../img/oximg_o.png"></div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div><img class="exam_check" src="../img/oximg_v.png"></div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									6)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div><img class="exam_ox_check" src="../img/oximg_o.png"></div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div><img class="exam_ox_check" src="../img/oximg_v.png"></div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>


							</div>
							<div class="col-lg-5" scd_div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div><img class="exam_ox_check" src="../img/oximg_v.png"></div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									<div><img class="exam_ox" src="../img/oximg_o.png"></div>
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
									<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
									<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
								</div>
								<div id="exam" class="wrap">
									1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
									<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
									<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그 영역이
										고정된다.</div>
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
										<td class="tg-baqh qnumber">1</td>
										<td class="tg-baqh ">ⓐ</td>
										<td class="tg-baqh">ⓐ</td>
										<td class="tg-baqh">ⓐ</td>
										<td class="tg-baqh">ⓐ</td>
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
								<table>
									<tr>
										<td><button>틀린 문제만 보기</button></td>
									</tr>
								</table>
							</div>
							</div>
							<div class="row pastExamRowDiv">
								<button class="btn btn-theme btn-primary exampaneldetailBtn">제출하기</button>
							</div>
						</div>

				</div>


</body>
</html>