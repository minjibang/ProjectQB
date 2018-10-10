<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
        #totalCheckbox 
        {
            height: -10px;
            vertical-align:text-top
        }
        #totalCheckLabel
        {
            font-size:1.2em;
        }
        .myQuestionImg{
            width:300px; height: 200px;
        }
        
        .myQuestionSelectCategory {
            width: 10%;
            margin-right: 5px;
            margin-bottom: 5px;
            display: inline-block;
        }
        
        .myQuestionSelectCategory2{
            width: 37%;
            margin-right: 5px;
            margin-bottom: 5px;
            display: inline-block;
        }
        
        .myQuestionFont{
            font-size: 15px;
        }
        
        .myQuestionSelectBtn {
            width: 10%;
        }
        
        .myQuestionDiv { 
            margin-bottom: 30px;
        }
        
        
        #h3id{
            text-align: center;
        }
        
        #myQuestionPanel{
            height: 500px;
            overflow-x: hidden;
            overflow-y: scroll;
        }
        .myQuestionCheck{
            padding-left: 30px;
        }
        .hr{
            width:98%;
        }
        .btnDeIn{
            text-align: center;
        }
        .myQuestionCategory{
            background: #eaeaea;
            font-size:15px;
        }
        .hrRow{
            margin-top: -20px;
        }
        .btnUpDe{
            margin-top: 60px;
        }
    </style>
	
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper site-min-height">
			<div class="row mt">
				<div class="col-lg-12">
					<!-- /col-lg-12 -->
					<div class="col-lg-12 mt">
						<div class="row content-panel">
							<div class="panel-heading">
								<ul class="nav nav-tabs nav-justified">
									<li class="active"><a data-toggle="tab" href="#overview">내
											문제함</a></li>
									<li><a data-toggle="tab" href="#contact"
										class="contact-map">새로운 문제 만들기</a></li>
								</ul>
							</div>
							<!-- /panel-heading -->
							<div class="panel-body">
								<div class="tab-content">
									<div id="overview" class="tab-pane active">
										<div class="row">
											<div class="col-lg-12">

												<h3 id="h3id">내가 만든 문제</h3>
												<hr>
												<select class="form-control myQuestionSelectCategory"
													name="">
													<option value="">대분류</option>
													<option value="">언어</option>
													<option value="">시험</option>
												</select> <select class="form-control myQuestionSelectCategory"
													name="">
													<option value="">중분류</option>
													<option value="">자바</option>
													<option value="">C</option>
													<option value="">C++</option>
												</select> <select class="form-control myQuestionSelectCategory"
													name="">
													<option value="">소분류</option>
													<option value="">변수</option>
													<option value="">배열</option>
													<option value="">객체</option>
												</select> <select class="form-control myQuestionSelectCategory"
													name="">
													<option value="">난이도</option>
													<option value="">기초</option>
													<option value="">기본</option>
													<option value="">심화</option>
												</select> <input type="text"
													class="form-control myQuestionSelectCategory2"
													placeholder="키워드를 입력하세요."> <input type="button"
													class="btn btn-theme myQuestionSelectBtn" value="검색">
												<input type="button"
													class="btn btn-theme myQuestionSelectBtn" value="전체조회">
											</div>
											<a href=""></a>
											<!-- /detailed -->
										</div>
										<div class="row mt hrRow">
											<div class="col-lg-2 mt">
												<label class="checkbox-inline" id="totalCheckLabel">
													<input type="checkbox" id="totalCheckbox" value="option1">
													&nbsp;전체선택
												</label>
											</div>
										</div>


										<hr>

										<!-- /col-md-6 -->
										<div class="row content-panel" id="myQuestionPanel">
											<div class="myQuestionDiv">
												<div class="row mt">

													<div class="col-lg-1 myQuestionCheck">
														<input type="checkbox" value="" name="" id="checkLa">
														<!-- value에 문제고유번호 들어간다 -->
													</div>
													<div class="col-lg-2 myQuestionCategory">
														Java<br>
														<br> 메서드와 변수<br>
														<br> 난이도: 중<br>
														<br> 정답:3<br>
														<br> 정답률:72%<br>
														<br> 출제자:서정원<br>
														<br>
													</div>
													<div class="col-lg-3 myQuestionFont">
														<div>
															<b>문제 : </b>
														</div>
														<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br>
														<br> <img src="${pageContext.request.contextPath}/img/500.png" class="myQuestionImg">
														<br>

													</div>
													<div class="col-lg-4 myQuestionFont">
														<div>
															<b>보기 : </b>
														</div>
														<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br>
														<br> 2. static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그
														영역이 고정된다.<br>
														<br> 3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br>
														<br> 4. static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>


													</div>
													<div class="col-lg-2 btnUpDe">
														<br> <br>
														<button type="button" class="btn btn-theme">수정</button>
														&nbsp;&nbsp;
														<button type="button" class="btn btn-theme04">삭제</button>

													</div>

												</div>
												<!-- /col-md-6 -->
											</div>



											<hr class="hr">

											<!-- /col-md-6 -->
											<div class="row mt">
												<div class="myQuestionDiv">
													<div class="col-lg-1 myQuestionCheck">
														<input type="checkbox" value="" name="">
														<!-- value에 문제고유번호 들어간다 -->
													</div>
													<div class="col-lg-2 myQuestionCategory">
														Java<br>
														<br> 메서드와 변수<br>
														<br> 난이도: 중<br>
														<br> 정답:3<br>
														<br> 정답률:72%<br>
														<br> 출제자:서정원<br>
														<br>
													</div>
													<div class="col-lg-3 myQuestionFont">
														<div>
															<b>문제 : </b>
														</div>
														<b>다음은 static에 대한 설명이다. 틀린 것은?</b><br>
														<br> <img src="${pageContext.request.contextPath}/img/404.png" class="myQuestionImg">
														<br>

													</div>
													<div class="col-lg-4 myQuestionFont">
														<div>
															<b>보기 : </b>
														</div>
														<br> 1. 멤버 변수와 메서드에 static을 지정할 수 있다<br>
														<br> 2. static 형 변수는 클래스 로딩시에 메모리가 할당되어 프로그램 종료까지 그
														영역이 고정된다.<br>
														<br> 3. static 메서드 안에 선언되는 변수들은 모두 static 변수이다.<br>
														<br> 4. static 메서드 안에서는 this 나 super를 사용할 수 있다.<br>


													</div>
													<div class="col-lg-2 btnUpDe">
														<br> <br>
														<button type="button" class="btn btn-theme">수정</button>
														&nbsp;&nbsp;
														<button type="button" class="btn btn-theme04">삭제</button>

													</div>

												</div>
												<!-- /col-md-6 -->
											</div>




										</div>
										<br>
										<div class="btnDeIn">
											<button type="button" class="btn btn-theme">선택 문제 삭제</button>
											<button type="button" class="btn btn-theme">새 문제 등록</button>
										</div>


										<!-- /OVERVIEW -->
									</div>
									<!-- /tab-pane -->
									<div id="contact" class="tab-pane">
										<div class="row">
											<div class="col-md-6"></div>
											<!-- /col-md-6 -->

											<!-- /col-md-6 -->
										</div>
										<!-- /row -->
									</div>
									<!-- /tab-pane -->

									<!-- /tab-pane -->
								</div>
								<!-- /tab-content -->
							</div>
							<!-- /panel-body -->
						</div>
						<!-- /col-lg-12 -->
					</div>
					<!-- /row -->
				</div>
				</div>
				<!-- /container -->
		</section>
		<!-- /wrapper -->
	</section>
	<!-- /MAIN CONTENT -->
	<!--main content end-->