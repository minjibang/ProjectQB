<%-- 
	@JSP:examPaperMake.jsp
	@DATE:2018-10-11
	@Author:김현이
	@Desc:강사-시험지 생성 페이지(스토리보드 24 of 41) --> 시험관리 탭에서 하나의 페이지로 따로 빼냈음
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/examPaperMake.css"
	rel="stylesheet">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-6">
								<h3>문항 검색</h3>
								<div class="makeExamFirstRow">
									<hr>
									<select class="form-control makeExamSelectCategory" name="">
											<option value="">대분류</option>
										<c:forEach items="${list1}" var="lgCategoryList">
											<option value="${lgCategoryList.lg_category_code}">${lgCategoryList.lg_category_name}</option>
										</c:forEach>
									</select> <select class="form-control makeExamSelectCategory" name="">
											<option value="">중분류</option>
										<c:forEach items="${list2}" var="mdCategoryList">
											<option value="${mdCategoryList.md_category_code}">${mdCategoryList.md_category_name}</option>
										</c:forEach>
									</select> <select class="form-control makeExamSelectCategory" name="">
												<option value="">소분류</option>
											<c:forEach items="${list3}" var="smCategoryList">
												<option value="${smCategoryList.sm_category_code}">${smCategoryList.sm_category_name}</option>
											</c:forEach>
									</select> <select class="form-control makeExamSelectCategory" name="">
										<option value="">난이도</option>
										<option value="D1">기초</option>
										<option value="D2">기본</option>
										<option value="D3">심화</option>
										<option value="D4">실전</option>
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
									<c:forEach items="${question }" var="question">
										<div class="questionDiv">
											<div class="col-lg-1">
												<input type="checkbox" value="${question.question_num }" name="" class="question_num">
												<!-- value에 문제고유번호 들어간다 -->
											</div>
											<div class="col-lg-3">
												${question.md_category_name}<br> ${question.sm_category_name }<br> 난이도: ${question.level_name }<br> 정답: ${question.question_answer }<br>
												정답률:${question.question_correct_ratio}%<br> 출제자: ${question.member_id }<br>
											</div>
											<div class="col-lg-8">
												<b>${question.question_name }</b><br> <br>
												<div class="questionImgDiv">
													<img
														src="${pageContext.request.contextPath}/img/sampleQuestionImg.jpg"
														alt="questionImg" class="questionImg" />
													<!-- 문제에 이미지가 있다면 questionImgDiv 밑에 추가 -->
												</div>
												<div>
												<br> 1. 멤버
											변수와 메서드에 static을 지정할 수 있다<br> 2. static 형 변수는 클래스 로딩시에
											메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br> 3. static 메서드 안에
											선언되는 변수들은 모두 static 변수이다.<br> 4. static 메서드 안에서는 this 나
											super를 사용할 수 있다.<br>
												</div>
													<%-- <br> ${question.question_choice_num }. ${question.question_choice_content } --%>
												
											</div>
											<div class="col-lg-12">
												<hr>
											</div>
										</div>
									</c:forEach>
									<!-- 문제 하나의 div 끝  -->
									<!-- 문제 하나의 div 시작  -->
									<!-- <div class="questionDiv">
										<div class="col-lg-1">
											<input type="checkbox" value="" name="">
											value에 문제고유번호 들어간다
										</div>
										<div class="col-lg-3">
											Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
											정답률:72%<br> 출제자:서정원<br>
										</div>
										<div class="col-lg-8">
											<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> 1. 멤버
											변수와 메서드에 static을 지정할 수 있다<br> 2. static 형 변수는 클래스 로딩시에
											메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br> 3. static 메서드 안에
											선언되는 변수들은 모두 static 변수이다.<br> 4. static 메서드 안에서는 this 나
											super를 사용할 수 있다.<br>
										</div>
										<div class="col-lg-12">
											<hr>
										</div>
									</div>
									문제 하나의 div 끝 
									문제 하나의 div 시작 
									<div class="questionDiv">
										<div class="col-lg-1">
											<input type="checkbox" value="" name="">
											value에 문제고유번호 들어간다
										</div>
										<div class="col-lg-3">
											Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
											정답률:72%<br> 출제자:서정원<br>
										</div>
										<div class="col-lg-8">
											<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> 1. 멤버
											변수와 메서드에 static을 지정할 수 있다<br> 2. static 형 변수는 클래스 로딩시에
											메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br> 3. static 메서드 안에
											선언되는 변수들은 모두 static 변수이다.<br> 4. static 메서드 안에서는 this 나
											super를 사용할 수 있다.<br>
										</div>
										<div class="col-lg-12">
											<hr>
										</div>
									</div>
									문제 하나의 div 끝 
									문제 하나의 div 시작 
									<div class="questionDiv">
										<div class="col-lg-1">
											<input type="checkbox" value="" name="">
											value에 문제고유번호 들어간다
										</div>
										<div class="col-lg-3">
											Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
											정답률:72%<br> 출제자:서정원<br>
										</div>
										<div class="col-lg-8">
											<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> 1. 멤버
											변수와 메서드에 static을 지정할 수 있다<br> 2. static 형 변수는 클래스 로딩시에
											메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br> 3. static 메서드 안에
											선언되는 변수들은 모두 static 변수이다.<br> 4. static 메서드 안에서는 this 나
											super를 사용할 수 있다.<br>
										</div>
										<div class="col-lg-12">
											<hr>
										</div>
									</div> -->
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
														<div class="col-lg-3">
															Java<br> 기초 개념<br> 난이도: 하<br> 정답: 1<br>
															정답률:93%<br> 출제자: 김현이<br> <br> 배점 : <input
																type="number" class="form-control questionScoreInputTag"
																name="quantity" min="1" max="5">
														</div>
														<div class="col-lg-8">
															<b>다음 설명 중 옳지 않은 것은?</b><br> <br> 1. 자바는 영어로
															Jaba이다<br> 2. 자바는 컴퓨터 프로그래밍 언어 중 하나이다.<br> 3.
															자바 언어로 간단한 게임을 구현할 수 있다.<br> 4. 자바는 객체지향 언어이다.<br>
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
														<div class="col-lg-3">
															Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
															정답률:72%<br> 출제자:서정원<br> <br> 배점 : <input
																type="number" class="form-control questionScoreInputTag"
																name="quantity" min="1" max="5">
														</div>
														<div class="col-lg-8">
															<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> 1.
															멤버 변수와 메서드에 static을 지정할 수 있다<br> 2. static 형 변수는 클래스
															로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br> 3. static
															메서드 안에 선언되는 변수들은 모두 static 변수이다.<br> 4. static 메서드
															안에서는 this 나 super를 사용할 수 있다.<br>
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
														<div class="col-lg-3">
															Java<br> 메서드와 변수<br> 난이도: 중<br> 정답:3<br>
															정답률:72%<br> 출제자:서정원<br> <br> 배점 : <input
																type="number" class="form-control questionScoreInputTag"
																name="quantity" min="1" max="5">
														</div>
														<div class="col-lg-8">
															<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br> <br> 1.
															멤버 변수와 메서드에 static을 지정할 수 있다<br> 2. static 형 변수는 클래스
															로딩시에 메모리가 할당되어 프로그램 종료까지 그 영역이 고정된다.<br> 3. static
															메서드 안에 선언되는 변수들은 모두 static 변수이다.<br> 4. static 메서드
															안에서는 this 나 super를 사용할 수 있다.<br>
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
								<!-- 한결 - 10.10 시험지 미리보기 페이지 추가-->
								<button class="btn btn-theme" data-target="#exam_preview"
									data-toggle="modal">시험지 미리보기</button>
								<div id="exam_preview" class="modal fade modal_preview">
									<div class="modal-dialog" style="width: 70%;">
										<!-- 임시 데이터  실제 데이터는 백그라운드에서 가져와 스크립트부분에서 append방식.-->
										<div class="row mt">
											<div class="col-lg-12">
												<div class="">
													<div class="row content-panel">
														<div id="timerblock">
															<h3 class="mb exampaneldetailsubject">
																<i class="fa fa-angle-right"></i> 비트캠프109기-JAVA기본
															</h3>

														</div>

														<hr>
														<div class="panel-body">
															<div class="row content-panel exampaneldetailed">
																<div class="col-lg-6" id="examBox"
																	style="border-right: 1px solid black;">
																	<div id="exam"
																		style="text-align: left; padding-top: 10px;">
																		1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
																		<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
																		<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그
																			영역이 고정된다.</div>
																		<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																		<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																	</div>
																	<div id="exam" style="text-align: left;">
																		1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
																		<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
																		<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그
																			영역이 고정된다.</div>
																		<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																		<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																	</div>
																	<div id="exam" style="text-align: left;">
																		1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
																		<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
																		<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그
																			영역이 고정된다.</div>
																		<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																		<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																	</div>
																	<div id="exam" style="text-align: left;">
																		1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
																		<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
																		<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그
																			영역이 고정된다.</div>
																		<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																		<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																	</div>

																</div>
																<div class="col-lg-6">
																	<div id="exam" style="text-align: left;">
																		1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
																		<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
																		<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그
																			영역이 고정된다.</div>
																		<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																		<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																	</div>
																	<div id="exam" style="text-align: left;">
																		1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
																		<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
																		<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그
																			영역이 고정된다.</div>
																		<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																		<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																	</div>
																	<div id="exam" style="text-align: left;">
																		1)다음은 static에 대한 설명이다. 틀린것은?(3점)<br> <br>
																		<div>1.멤버 변수와 메서드에 static을 지정할 수 있다.</div>
																		<div>2.static형 변수는 클래스 로딩시에 메로리가 할당되어 프로그램종료까지 그
																			영역이 고정된다.</div>
																		<div>3.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																		<div>4.static메서드 안에 선언되는 변수들은 모두 static변수이다.</div>
																	</div>
																</div>

															</div>
															<button
																class="btn btn-large btn-primary exampaneldetailBtn"
																data-dismiss="modal">확인</button>
														</div>
													</div>
												</div>
											</div>

										</div>

									</div>
								</div>
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
														id="pickQuestionTempSaveBtn"> <input type="button"
														class="btn btn-theme04" data-dismiss="modal" value="취소">
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
				</div>
			</div>
		</div>
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/lib/tasks.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/lib/onet-js/examPaperMake.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script> <!-- layout.jsp 에서 cdn으로 걸은 jquery-3.3.1가 안 먹혀서 다시 걸음 -->