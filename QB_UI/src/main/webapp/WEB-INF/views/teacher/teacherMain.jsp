<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#div_notice {
	width: 90%;
	margin: 0 auto;
}

#notice_H2 {
	text-align: center;
}

#notice_Table {
	text-align: center;
}

#noticebtn {
	float: right;
}

#div_examinfo {
	width: 90%;
	margin: 0 auto;
}

#examinfo_H2 {
	text-align: center;
}

#exam_info_Table {
	text-align: center;
}
/* datatables 수정 */
.dataTables_length, .dataTables_info {
	display: none;
}
.dataTables_paginate {

	margin:0 auto;
}
</style>
<!-- 강사, 학생 - 메인페이지 (클래스 공지사항, 시험일정) -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
			<div class="col-lg-12 mt">
				<div class="row content-panel div_table">
					<!-- 클래스 공지사항 -->
					<div id="div_noticePannel" class="col-md-12">
						<h2 id="notice_H2">클래스 공지사항</h2>
						<div id="div_notice">
							<table id="notice_Table" class="display">
								<thead>
									<tr>
										<th class="notice_num">글번호</th>
										<th class="notice_name">제목</th>
										<th class="notice_date">작성일</th>
										<th class="member_id">작성자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="notice_num">3</td>
										<td class="notice_name"><a href="noticeView.do">추석 연휴 후 강의 일정</a></td>
										<td class="notice_date">2018.09.17</td>
										<td class="member_id">강사 홍길동</td>
									</tr>
									<tr>
										<td class="notice_num">2</td>
										<td class="notice_name"><a href="noticeView.do">조별과제 공지입니다.</a></td>
										<td class="notice_date">2018.09.10</td>
										<td class="member_id">강사 홍길동</td>
									</tr>
									<tr>
										<td class="notice_num">1</td>
										<td class="notice_name"><a href="noticeView.do">공지사항</a></td>
										<td class="notice_date">2018.09.01</td>
										<td class="member_id">강사 홍길동</td>
									</tr>
								</tbody>
							</table>
							<!-- Security 또는 Session에서 권한이 강사일 경우만 글쓰기 활성화 -->
							<div>
								<button id="noticebtn" class="btn btn-info"
									onclick="location.href='teacherNoticeWrite.do'" >글쓰기</button>
							</div>
						</div>

					</div>
					<!-- /클래스 공지사항 -->

					<!-- 시험일정 -->
					<div id="" class="col-md-12">
						<h2 id="examinfo_H2">시험 일정</h2>
						<div id="div_examinfo">
							<table id="exam_info_Table" class="display">
								<thead>
									<tr>
										<th class="exam_info_num">시험 번호</th>
										<th class="exam_info_name">시험 이름</th>
										<th class="exam_info">시험 시간</th>
										<th class="exam_info_member">응시 대상</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="exam_info_num">1</td>
										<td class="exam_info_name">JAVA의 기초와 이해</td>
										<td class="exam_info">2018.08.15<br>14:00:00 ~
											14:50:00<br>50분
										</td>
										<td class="exam_info_member">전체</td>
									</tr>
									<tr>
										<td class="exam_info_num">2</td>
										<td class="exam_info_name">JAVA의 기초와 이해 - 재시험</td>
										<td class="exam_info">2018.08.22<br>17:00:00 ~
											17:50:00<br>50분
										</td>
										<td class="exam_info_member">JAVA 1차시험 60점 미만</td>
									</tr>
									<tr>
										<td class="exam_info_num">3</td>
										<td class="exam_info_name">오라클 DB</td>
										<td class="exam_info">2018.09.15<br>14:00:00 ~
											15:30:00<br>90분
										</td>
										<td class="exam_info_member">전체</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /시험 일정 -->
				</div>
				<!-- /col-lg-12 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->