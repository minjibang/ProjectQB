<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		$('.exam_rewind').click(function() {

			var popUrl = "pastExamPaper.do";
			var popOption = "width=1000px, resizable=no, location=no, left=50px, top=100px";

			window.open(popUrl, "지난 시험보기",popOption);
		});
		
		$('#search_btn').click(function(){
			alert($('#search_input').val()+" || 검색을 시작합니다.");
		});
		
	});
</script>
<link
	href="${pageContext.request.contextPath}/css/studentPastExam.css"
	rel="stylesheet">
<!-- 학생 - 지난 시험 보기-->
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
		<!-- <div class="col-lg-12"></div> -->
		<!-- /col-lg-12 -->
		<div class="col-lg-12">
			<div class="row content-panel">
				<!-- /panel-heading -->
				<div class="panel-body">

					<div id="overview" class="all_class_div">
						<table class="title_table">
							<tr>
								<td class="title_table_fst_td">
									<p id="student_name">김하나</p>
								</td>
								<td class="title_table_scd_td">
									<div class="search_box">
										<input type="text" class="form-control" id="search_input" placeholder="키워드를 입력하세요.">
										<button class="exam_rewind btn btn-theme" id="pastExamSearchBtn">검색</button>
									</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="last_exam_div">
							<table class="last_exam_table">
								<tr class="exam_line">
									<td class="examtitle_td">
										<table>
											<tr>
												<td><img class="exam_img"
													src="../img/material-icon.png"></td>
												<td></td>
												<td>
													<h3>JAVA 기본</h3> 변수 | 배열 | for문 | if문
												</td>
											</tr>
										</table>
									</td>
									<td class="examinfo_td">
										<div>시험 날짜 : 2018.08.15</div>
										<div>시험 시간 : 14:00:00 ~ 14:50:00</div>
										<div>[50분]</div>
									</td>
									<td class="btn_td">
										<button class="exam_rewind btn btn-theme">다시 보기</button>
										<div class=""></div>
									</td>
								</tr>
							</table>
							<table class="last_exam_table">
								<tr class="exam_line">
									<td class="examtitle_td">
										<table>
											<tr>
												<td><img class="exam_img"
													src="../img/material-icon.png"></td>
												<td></td>
												<td>
													<h3>JAVA 기본</h3> 변수 | 배열 | for문 | if문
												</td>
											</tr>
										</table>
									</td>
									<td class="examinfo_td">
										<div>시험 날짜 : 2018.08.15</div>
										<div>시험 시간 : 14:00:00 ~ 14:50:00</div>
										<div>[50분]</div>
									</td>
									<td class="btn_td">
										<button class="exam_rewind btn btn-theme">다시 보기</button>
										<div class=""></div>
									</td>
								</tr>
							</table>
							<table class="last_exam_table">
								<tr class="exam_line">
									<td class="examtitle_td">
										<table>
											<tr>
												<td><img class="exam_img"
													src="../img/material-icon.png"></td>
												<td></td>
												<td>
													<h3>JAVA 기본</h3> 변수 | 배열 | for문 | if문
												</td>
											</tr>
										</table>
									</td>
									<td class="examinfo_td">
										<div>시험 날짜 : 2018.08.15</div>
										<div>시험 시간 : 14:00:00 ~ 14:50:00</div>
										<div>[50분]</div>
									</td>
									<td class="btn_td">
										<button class="exam_rewind btn btn-theme">다시 보기</button>
										<div class=""></div>
									</td>
								</tr>
							</table>
							<table class="last_exam_table">
								<tr class="exam_line">
									<td class="examtitle_td">
										<table>
											<tr>
												<td><img class="exam_img"
													src="../img/material-icon.png"></td>
												<td></td>
												<td>
													<h3>JAVA 기본</h3> 변수 | 배열 | for문 | if문
												</td>
											</tr>
										</table>
									</td>
									<td class="examinfo_td">
										<div>시험 날짜 : 2018.08.15</div>
										<div>시험 시간 : 14:00:00 ~ 14:50:00</div>
										<div>[50분]</div>
									</td>
									<td class="btn_td">
										<button class="exam_rewind btn btn-theme">다시 보기</button>
										<div class=""></div>
									</td>
								</tr>
							</table>
							<table class="last_exam_table">
								<tr class="exam_line">
									<td class="examtitle_td">
										<table>
											<tr>
												<td><img class="exam_img"
													src="../img/material-icon.png"></td>
												<td></td>
												<td>
													<h3>JAVA 기본</h3> 변수 | 배열 | for문 | if문
												</td>
											</tr>
										</table>
									</td>
									<td class="examinfo_td">
										<div>시험 날짜 : 2018.08.15</div>
										<div>시험 시간 : 14:00:00 ~ 14:50:00</div>
										<div>[50분]</div>
									</td>
									<td class="btn_td">
										<button class="exam_rewind btn btn-theme">다시 보기</button>
										<div class=""></div>
									</td>
								</tr>
							</table>
							<table class="last_exam_table">
								<tr class="exam_line">
									<td class="examtitle_td">
										<table>
											<tr>
												<td><img class="exam_img"
													src="../img/material-icon.png"></td>
												<td></td>
												<td>
													<h3>JAVA 기본</h3> 변수 | 배열 | for문 | if문
												</td>
											</tr>
										</table>
									</td>
									<td class="examinfo_td">
										<div>시험 날짜 : 2018.08.15</div>
										<div>시험 시간 : 14:00:00 ~ 14:50:00</div>
										<div>[50분]</div>
									</td>
									<td class="btn_td">
										<button class="exam_rewind btn btn-theme">다시 보기</button>
										<div class=""></div>
									</td>
								</tr>
							</table>
							<table class="last_exam_table">
								<tr class="exam_line">
									<td class="examtitle_td">
										<table>
											<tr>
												<td><img class="exam_img"
													src="../img/material-icon.png"></td>
												<td></td>
												<td>
													<h3>JAVA 기본</h3> 변수 | 배열 | for문 | if문
												</td>
											</tr>
										</table>
									</td>
									<td class="examinfo_td">
										<div>시험 날짜 : 2018.08.15</div>
										<div>시험 시간 : 14:00:00 ~ 14:50:00</div>
										<div>[50분]</div>
									</td>
									<td class="btn_td">
										<button class="exam_rewind btn btn-theme">다시 보기</button>
										<div class=""></div>
									</td>
								</tr>
							</table>


						</div>
					</div>

					<!-- /tab-content -->
				</div>
				<!-- /panel-body -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<!-- /col-lg-12 -->
		
		</div>
	</section>
	<!-- /wrapper -->
</section>