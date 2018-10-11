<%-- 
	@JSP:teacherMyExamPaper.jsp
	@DATE:2018-10-10
	@Author:유영준
	@Desc:강사-내 시험지 페이지(스토리보드 23 of 41)
	
	@2018-10-10 현이 : 시험지 생성 탭 추가
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath}/css/teacherMyExamPaper.css"
	rel="stylesheet">
<%-- <script
	src="${pageContext.request.contextPath}/lib/onet-js/teacherMyExamPaper.js"></script>	 --%>
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
			<div class="col-lg-12 mt">
				<div class="row content-panel div_table">
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#overview">내
									시험지 </a></li>
							<li><a data-toggle="tab" href="#makeExamPaper"
								class="contact-map">시험지 만들기 </a></li>
							<li><a data-toggle="tab" href="#tempExamPaper"
								class="contact-map">임시 저장된 시험지 </a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">시험
									등록 </a></li>
							<li><a data-toggle="tab" href="#examSchedule"
								class="contact-map">시험 일정 </a></li>
						</ul>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div id="div_myExam" class="col-md-12">
										<table id="myExam_table" class="display">
											<tbody>
												<tr>
													<td class="exam_paper_name"><h4><strong>JAVA의 기본</strong></h4>
													<p>변수|배열|FOR문|IF문</p></td>
													<td class="pdf_download text-right"><h5>PDF 다운로드
													<img src="img/file-download.png"></h5>
													<p><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
												<tr>
													<td class="exam_paper_name"><h4><strong>C++ 기본</strong></h4>
													<p>변수|배열|FOR문|IF문</p></td>
													<td class="pdf_download text-right"><h5>PDF 다운로드
													<img src="img/file-download.png"></h5>
													<p><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
												<tr>
													<td class="exam_paper_name"><h4><strong>PYTHON 기본</strong></h4>
													<p>변수|배열|FOR문|IF문<p></td>
													<td class="pdf_download text-right"><h5>PDF 다운로드
													<img src="img/file-download.png"></h5>
													<p><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
													</p>
													</td>
												</tr>
											</tbody>
											<!-- 내 시험지 table 끝 -->
										</table>			
										<!-- /col-md-12 -->
									</div>
									<!-- /row -->
								<form>
								<a href="" class="exam-insert">
								<img src="img/material-icon.png">
								<strong>새 시험지 만들기</strong></a>
								</form>
							<!-- /col-md-12 -->
							</div>	
						<!-- /row -->
						</div>
				<!-- /overview -->
				</div>
			</div>
					<!-- 임시 저장된 시험지 tab 시작-->
					<div id="tempExamPaper" class="tab-pane">
						<div class="row">
							<div id="div_tempExam" class="col-md-12">
								<table id="tempExam_table">
									<tbody>
										<tr>
											<td class="exam_paper_name"><h4><strong>NCS HTML 시험(10/15까지 완성할 것)</strong></h4>
											<p>HTML + CSS 개념 및 활용</p></td>
											<td class="pdf_download text-right"><h5>PDF 다운로드
											<img src="img/file-download.png"></h5>
											<p><button class="btn btn-theme04 buttonGroup">
												<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
												<button class="btn btn-theme buttonGroup">
												<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
												<button class="btn btn-theme buttonGroup">
												<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
											</p>
											</td>
										</tr>
												
										<tr>
											<td class="exam_paper_name"><h4><strong>NCS JAVASCRIPT 시험(10/30까지 완성할 것)</strong></h4>
											<p>자바스크립트 개념 및 활용</p></td>
											<td class="pdf_download text-right"><h5>PDF 다운로드
											<img src="img/file-download.png"></h5>
											<p><button class="btn btn-theme04 buttonGroup">
												<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
												<button class="btn btn-theme buttonGroup">
												<span data-toggle="modal" data-target="#UpdateModal"></span>시험지 수정</button>
												<button class="btn btn-theme buttonGroup">
												<span data-toggle="modal" data-target="#InsertModal"></span>시험 등록</button>
											</p>
											</td>
										</tr>
								</tbody>
								<!-- /table end -->
								</table>
									<form>
										<a href="" class="exam-insert">
										<img src="img/material-icon.png">
										<strong>새 시험지 만들기</strong></a>
									</form>

								</div>
								<!-- /overview -->
							</div>

							<!-- 현이 시험지 만들기 탭 판넬 시작  -->
							<div id="makeExamPaper" class="tab-pane">
								<div class="row">
									<div class="col-lg-6">
										<h3>문항 검색</h3>
										<div class="makeExamFirstRow">
											<hr>
											<select class="form-control makeExamSelectCategory" name="">
												<option value="">대분류</option>
												<option value="">언어</option>
												<option value="">시험</option>
											</select> <select class="form-control makeExamSelectCategory" name="">
												<option value="">중분류</option>
												<option value="">자바</option>
												<option value="">C</option>
												<option value="">C++</option>
											</select> <select class="form-control makeExamSelectCategory" name="">
												<option value="">소분류</option>
												<option value="">변수</option>
												<option value="">배열</option>
												<option value="">객체</option>
											</select> <select class="form-control makeExamSelectCategory" name="">
												<option value="">난이도</option>
												<option value="">기초</option>
												<option value="">기본</option>
												<option value="">심화</option>
											</select> <select class="form-control makeExamSelectCategory" name="">
												<option value="">문제타입</option>
												<option value="">전체</option>
												<option value="">객관식</option>
												<option value="">단답식</option>
											</select> <br> <input type="text"
												class="form-control makeExamTextField"
												placeholder="키워드를 입력하세요."> <input type="button"
												class="btn btn-theme" value="검색" id="makeExamSelectBtn">
										</div>
										<hr>

									</div>
									<div class="col-lg-6">
										<h3>시험 출제 문항</h3>
										<div class="makeExamFirstRow">
											<hr>
											<div id="makeExamFirstRowText">
												<br> 출제된 문항 수 : 2<br> 현재 총 배점 : 7 / 100
											</div>
										</div>
										<hr>
									</div>

								</div>
								<!-- div 윗 줄의 문항검색 부분  -->


								<div class="row">
									<div class="col-lg-6" id="leftMakeExamDiv">
										<form aciton="" method="post" id="pickQuestionForm">
											<!-- 문제 하나의 div 시작  -->
											<div class="questionDiv">
												<div class="col-lg-1">
													<input type="checkbox" value="" name="">
													<!-- value에 문제고유번호 들어간다 -->
												</div>
												<div class="col-lg-2">
													Java<br> 기초 개념<br> 난이도: 하<br> 정답: 1<br>
													정답률:93%<br> 출제자: 김현이<br>
												</div>
												<div class="col-lg-9">
													<b>다음 설명 중 옳지 않은 것은?</b><br>
													<br>
													<div class="questionImgDiv">
														<img
															src="C:\Users\bituser\Desktop\img\questionSampleImg.jpg"
															alt="questionImg" class="questionImg">
														<!-- 문제에 이미지가 있다면 questionImgDiv 밑에 추가 -->
													</div>
													<br> 1. 자바는 영어로 Jaba이다<br> 2. 자바는 컴퓨터 프로그래밍 언어 중
													하나이다.<br> 3. 자바 언어로 간단한 게임을 구현할 수 있다.<br> 4. 자바는
													객체지향 언어이다.<br>
												</div>
												<div class="col-lg-12">
													<hr>
												</div>
											</div>
											<!-- 문제 하나의 div 끝  -->
											<!-- 문제 하나의 div 시작  -->
											<div class="questionDiv">
												<div class="col-lg-1">
													<input type="checkbox" value="" name="">
													<!-- value에 문제고유번호 들어간다 -->
												</div>
												<div class="col-lg-2">
													Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
													정답률:72%<br> 출제자:서정원<br>
												</div>
												<div class="col-lg-9">
													<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br>
													<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> 2.
													static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
													3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br> 4.
													static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>
												</div>
												<div class="col-lg-12">
													<hr>
												</div>
											</div>
											<!-- 문제 하나의 div 끝  -->
											<!-- 문제 하나의 div 시작  -->
											<div class="questionDiv">
												<div class="col-lg-1">
													<input type="checkbox" value="" name="">
													<!-- value에 문제고유번호 들어간다 -->
												</div>
												<div class="col-lg-2">
													Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
													정답률:72%<br> 출제자:서정원<br>
												</div>
												<div class="col-lg-9">
													<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br>
													<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> 2.
													static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
													3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br> 4.
													static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>
												</div>
												<div class="col-lg-12">
													<hr>
												</div>
											</div>
											<!-- 문제 하나의 div 끝  -->
											<!-- 문제 하나의 div 시작  -->
											<div class="questionDiv">
												<div class="col-lg-1">
													<input type="checkbox" value="" name="">
													<!-- value에 문제고유번호 들어간다 -->
												</div>
												<div class="col-lg-2">
													Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
													정답률:72%<br> 출제자:서정원<br>
												</div>
												<div class="col-lg-9">
													<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br>
													<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> 2.
													static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
													3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br> 4.
													static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>
												</div>
												<div class="col-lg-12">
													<hr>
												</div>
											</div>
											<!-- 문제 하나의 div 끝  -->
										</form>
									</div>

									<!-- 화면의 오른 쪽, 시험 출제 문항 부분이다  -->
									<div class="col-lg-6" id="rightMakeExamDiv">
										<!--  시험문제 배치 드래그 앤 드롭-->
										<form aciton="" method="post" id="makeExamForm">
											<div class="task-content">
												<ul id="sortable" class="task-list">
													<!--  li 태그 하나 당 문제 하나 위치시키기 -->
													<li>
														<!-- 문제 하나의 div 시작  -->
														<div class="row">
															<div class="questionDiv">
																<div class="col-lg-1">
																	<input type="checkbox" value="" name="">
																	<!-- value에 문제고유번호 들어간다 -->
																</div>
																<div class="col-lg-2">
																	Java<br> 기초 개념<br> 난이도: 하<br> 정답: 1<br>
																	정답률:93%<br> 출제자: 김현이<br>
																	<br> 배점 : <input type="number"
																		class="form-control questionScoreInputTag"
																		name="quantity" min="1" max="5">
																</div>
																<div class="col-lg-9">
																	<b>다음 설명 중 옳지 않은 것은?</b><br>
																	<br> 1. 자바는 영어로 Jaba이다<br> 2. 자바는 컴퓨터 프로그래밍
																	언어 중 하나이다.<br> 3. 자바 언어로 간단한 게임을 구현할 수 있다.<br>
																	4. 자바는 객체지향 언어이다.<br>
																</div>
															</div>
														</div> <!-- 문제 하나의 div 끝  -->
													</li>
													<li>
														<!-- 문제 하나의 div 시작  -->
														<div class="row">
															<div class="questionDiv">
																<div class="col-lg-1">
																	<input type="checkbox" value="" name="">
																	<!-- value에 문제고유번호 들어간다 -->
																</div>
																<div class="col-lg-2">
																	Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
																	정답률:72%<br> 출제자:서정원<br>
																	<br> 배점 : <input type="number"
																		class="form-control questionScoreInputTag"
																		name="quantity" min="1" max="5">
																</div>
																<div class="col-lg-9">
																	<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br>
																	<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> 2.
																	static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
																	3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br> 4.
																	static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>
																</div>
															</div>
														</div> <!-- 문제 하나의 div 끝  -->
													</li>
													<li>
														<!-- 문제 하나의 div 시작  -->
														<div class="row">
															<div class="questionDiv">
																<div class="col-lg-1">
																	<input type="checkbox" value="" name="">
																	<!-- value에 문제고유번호 들어간다 -->
																</div>
																<div class="col-lg-2">
																	Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
																	정답률:72%<br> 출제자:서정원<br>
																	<br> 배점 : <input type="number"
																		class="form-control questionScoreInputTag"
																		name="quantity" min="1" max="5">
																</div>
																<div class="col-lg-9">
																	<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br>
																	<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br> 2.
																	static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br>
																	3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br> 4.
																	static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>
																</div>
															</div>
														</div> <!-- 문제 하나의 div 끝  -->
													</li>

												</ul>
											</div>
										</form>
									</div>
								</div>
								<!-- div class="row" 끝 -->
								<div class="row questionRowBtnDiv">
									<div class="col-lg-6 pickQuestionBtnDiv">
										<input type="button" class="btn btn-theme" value="선택출제"
											id="pickQuestionBtn">
									</div>
									<div class="col-lg-6 makeExamBtnDiv">
										<input type="button" class="btn btn-theme04" value="선택문제 삭제"
											id="pickQuestionDeleteBtn"> <input type="button"
											class="btn btn-theme" value="임시저장" data-toggle="modal"
											data-target="#pickQuestionTempSaveModal"
											id="pickQuestionTempSaveModalBtn">
										<!--                                <input type="button" class="btn btn-theme" value="시험지 미리보기" id="">  우선순위에서 제외-->
										<input type="button" class="btn btn-theme" value="시험지 생성"
											data-toggle="modal" data-target="#makeExamSubmitModal"
											id="makeExamSubmitModalBtn">
									</div>
								</div>
								<!-- 모달창 -->
								<!-- 임시저장 모달 -->
								<div class="modal fade" id="pickQuestionTempSaveModal"
									tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">시험지 임시저장</h4>
											</div>
											<form action="" method="post">
												<div class="modal-body">

													시험지 이름 <input type="text" class="form-control"
														placeholder="시험지 이름을 입력하세요." name=""><br> 시험지
													설명
													<textarea type="textarea" class="form-control"
														placeholder="시험지 설명을 입력하세요." name=""></textarea>
												</div>
												<div class="modal-footer">
													<div class="form-group">
														<div class="col-lg-offset-2 col-lg-10">
															<input type="button" class="btn btn-theme"
																data-toggle="modal" data-dismiss="modal" value="임시저장"
																id="pickQuestionTempSaveBtn"> <input
																type="button" class="btn btn-theme04"
																data-dismiss="modal" value="취소">

														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- 시험지 생성 모달 -->
								<div class="modal fade" id="makeExamSubmitModal" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">시험지 생성</h4>
											</div>
											<form action="" method="post">
												<div class="modal-body">

													시험지 이름 <input type="text" class="form-control"
														placeholder="시험지 이름을 입력하세요." name=""><br> 시험지
													설명
													<textarea type="textarea" class="form-control"
														placeholder="시험지 설명을 입력하세요." name=""></textarea>
												</div>
												<div class="modal-footer">
													<div class="form-group">
														<div class="col-lg-offset-2 col-lg-10">
															<input type="button" class="btn btn-theme"
																data-toggle="modal" data-dismiss="modal" value="시험지 생성"
																id="makeExamSubmitBtn"> <input type="button"
																class="btn btn-theme04" data-dismiss="modal" value="취소">

														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- 현이 시험지 만들기 탭 판넬 끝  -->

							<!-- 시험 일정 tab 시작 -->
							<div id="examSchedule" class="tab-pane">
								<div class="row">
									<div id="div_examSchedule" class="col-md-12">
										<table id="examSchedule_table" class="display">
											<tbody>
												<tr>
													<td class="exam_paper_name"><h4>
													<strong>자바의 기본 개념과 활용</strong></h4>
													<td class="exam_schedule">
													<p>시험 날짜 : 2018.08.15</p>
													<p>시험 시간 : 14:00:00 ~ 14:50:00 [50분]</p>
													<p>응시 대상 : 전체</p>
													<td><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험 일정 수정</button>
													</td>

												</tr>

												<tr>
													<td class="exam_paper_name"><h4>
															<strong>자바의 기본 개념과 활용<br>(재시험)
															</strong>
														</h4>
														<p>정의|개념|클래스|메소드</p></td>
														<td class="exam_schedule">
														<p>시험 날짜 : 2018.08.22</p>
														<p>시험 시간 : 17:00:00 ~ 17:50:00 [50분]</p>
														<p>응시 대상 : JAVA 1차 60점 미만</p></td>
													<td><button class="btn btn-theme04 buttonGroup">
														<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button>
														<button class="btn btn-theme buttonGroup">
														<span data-toggle="modal" data-target="#UpdateModal"></span>시험 일정 수정</button>
													</td>
												</tr>
											</tbody>
											<!-- /table -->
										</table>
										<form>
											<a href="" class="exam-insert"> <img
												src="img/material-icon.png"> <strong>새 시험 일정
													등록</strong></a>
										</form>
										<!-- /col-md-12 -->
									</div>
									<!-- /row -->

								<!-- /col-md-12 -->

								</div>
								<!-- 시험 일정 tab 끝 -->
							</div>
							<!-- /tab-content -->
						</div>
		
					<!-- /row content-panel div_table -->
				</div>
				<!-- /col-lg-12 mt -->
			</div>
			<!-- /row mt -->
		</div>
		<!-- /wrapper -->
	</section>
	<!-- /main-content -->
</section>
	<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
  	<script src="${pageContext.request.contextPath}/lib/tasks.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/onet-js/teacherMyExamPaper.js" type="text/javascript"></script>