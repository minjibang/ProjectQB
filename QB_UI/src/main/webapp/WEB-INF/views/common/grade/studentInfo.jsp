<%--
	@JSP:studentInfo.jsp
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 & 성적 관리(스토리보드 20 of 41)	
 --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/studentInfo.css" rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
			
				<%-- 탭 머리 시작 --%>
				<div class="panel-heading">
       				<ul class="nav nav-tabs nav-justified">
          				<li class="active">
            				<a data-toggle="tab" href="#studentInfo">학생정보</a>
          				</li>
          				<li>
            				<a data-toggle="tab" href="#studentChart">학생 개인 성적확인</a>
          				</li>
          				<li>
            				<a data-toggle="tab" href="#classChart">클래스 통계</a>
          				</li>
        			</ul>
      			</div>
      			<%-- 탭 머리 종료 --%>
			
				<%-- 탭 본문 영역 시작--%>
				<div class="panel-body">
					<div class="tab-content">
						<%-- 학생 정보 탭 시작 --%>
						<div id="studentInfo" class="tab-pane active">
							<div class="row">
								<%-- 학생 목록 시작 --%>
								<div class="col-lg-2">
									<section class="panel">
										<div class="panel-body grey-panel">
											<a href="mail_compose.html" class="btn btn-compose"> <i
												class="fa fa-pencil"></i> 자바 109기
											</a>
											<ul class="nav nav-pills nav-stacked mail-nav">
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 김현이
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 서정원
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 방민지
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 조재훈
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 우한결
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 양회준
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 유영준
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 성태용
												</a></li>
											</ul>
										</div>
									</section>
								</div>
								<%-- 학생 목록 끝 --%>
								<%-- 선택 학생 정보 영역 시작 --%>
								<div class="col-lg-10">
									<h3>김하나</h3>
									<h4>이메일 :</h4>
									<h4>핸드폰 :</h4>

									<!-- page start-->
									<div class="tab-pane" id="chartjs">
										<div class="row mt">
											<%--각 시험 성적 바 차트 --%>
											<div class="col-lg-6">
												<div class="content-panel">
													<h4>
														<i class="fa fa-angle-right"></i> 각 시험 성적
													</h4>
													<div class="panel-body text-center">
														<canvas id="bar1" height="300" width="400"></canvas>
													</div>
												</div>
											</div>
											
											<%-- 반/학생 평균 선 차트 --%>
											<div class="col-lg-6">
												<div class="content-panel">
													<h4>
														<i class="fa fa-angle-right"></i> 반/학생 평균 비교
													</h4>
													<div class="panel-body text-center">
														<canvas id="line1" height="300" width="400"></canvas>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%-- 선택 학생 정보 영역 끝 --%>
							</div>
						</div>
						<%-- 학생정보 탭 종료 --%>
						
						<%-- 학생 개인 성적 탭 시작 --%>
						<div id="studentChart" class="tab-pane">
							<div class="row">
								<div class="col-lg-2">
									<section class="panel">
										<div class="panel-body grey-panel">
											<a href="mail_compose.html" class="btn btn-compose"> <i
												class="fa fa-pencil"></i> 자바 109기
											</a>
											<ul class="nav nav-pills nav-stacked mail-nav">
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 김현이
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 서정원
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 방민지
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 조재훈
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 우한결
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 양회준
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 유영준
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 성태용
												</a></li>
											</ul>
										</div>
									</section>
								</div>
								<div class="col-lg-10 unread">
									<section class="panel">
										<header class="panel-heading wht-bg">
											<h4 class="gen-case">
												김현이
												<form action="#" class="pull-right mail-src-position">
													<div class="input-append">
														<input type="text" class="form-control "
															placeholder="Search Test">
													</div>
												</form>
											</h4>
										</header>
										<div class="panel-body minimal">
											<div class="table-inbox-wrap">
												<table class="table table-inbox table-hover">
													<tbody>
														<tr class="unread">
															<td class="view-message  dont-show"><a
																href="mail_view.html"><img
																	src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																	class="img-thumbnail" width="150"></a></td>

															<td class="view-message "><a href="mail_view.html"><h3>JAVA
																		기본</h3>
																	<p>변수 | 배열 | for문 | if문</p></a></td>
															<td class="view-message  text-right"><p>시험 날짜 :
																	2018.08.15</p>
																<p>시험 시간 : 14:00~15:00[60분]</p></td>
															<td class="view-message  inbox-small-cells">
																<button type="button" class="btn btn-round btn-info">성적확인</button>
																<button type="button" class="btn btn-round btn-danger">삭제</button>
															</td>
														</tr>
														<tr class="">
															<td class="view-message  dont-show"><a
																href="mail_view.html"><img
																	src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																	class="img-thumbnail" width="150"></a></td>

															<td class="view-message "><a href="mail_view.html"><h3>JAVA
																		기본</h3>
																	<p>변수 | 배열 | for문 | if문</p></a></td>
															<td class="view-message  text-right"><p>시험 날짜 :
																	2018.08.15</p>
																<p>시험 시간 : 14:00~15:00[60분]</p></td>
															<td class="view-message  inbox-small-cells">
																<button type="button" class="btn btn-round btn-info">성적확인</button>
																<button type="button" class="btn btn-round btn-danger">삭제</button>
															</td>
														</tr>
														<tr class="">
															<td class="view-message  dont-show"><a
																href="mail_view.html"><img
																	src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																	class="img-thumbnail" width="150"></a></td>

															<td class="view-message "><a href="mail_view.html"><h3>JAVA
																		기본</h3>
																	<p>변수 | 배열 | for문 | if문</p></a></td>
															<td class="view-message  text-right"><p>시험 날짜 :
																	2018.08.15</p>
																<p>시험 시간 : 14:00~15:00[60분]</p></td>
															<td class="view-message  inbox-small-cells">
																<button type="button" class="btn btn-round btn-info">성적확인</button>
																<button type="button" class="btn btn-round btn-danger">삭제</button>
															</td>
														</tr>

													</tbody>
												</table>
											</div>
											<div class="mail-option">
												<ul class="unstyled inbox-pagination">
													<li><span>1-50 of 99</span></li>
													<li><a class="np-btn" href="#"><i
															class="fa fa-angle-left  pagination-left"></i></a></li>
													<li><a class="np-btn" href="#"><i
															class="fa fa-angle-right pagination-right"></i></a></li>
												</ul>
											</div>
										</div>
									</section>
								</div>
							</div>
							<!-- /row -->
						</div>
						<%-- 학생 개인 성적 탭 끝 --%>
						
						<%-- 클래스 통계 탭 시작 --%>
						<div id="classChart" class="tab-pane">
							<div class="row">
								<%-- 클래스 학생 목록 시작--%>
								<div class="col-lg-2">
									<section class="panel">
										<div class="panel-body grey-panel">
											<a href="mail_compose.html" class="btn btn-compose"> <i
												class="fa fa-pencil"></i> 자바 109기
											</a>
											<ul class="nav nav-pills nav-stacked mail-nav">
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 김현이
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 서정원
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 방민지
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 조재훈
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 우한결
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 양회준
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 유영준
												</a></li>
												<li><a href="inbox.html"> <img
														src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
														class="img-circle" width="25"> 성태용
												</a></li>
											</ul>
										</div>
									</section>
								</div>
								<%-- 클래스 학생 목록 끝 --%>
								
								<%-- 클래스 학생 표/차트 시작 --%>
								<div class="col-lg-10">
									<h3>109기</h3>
									<h4>JAVA 웹 프로그래밍 과정</h4>
									<!-- page start-->
									<div class="tab-pane" id="chartjs">
										<div class="row mt">
											<%-- 반평균 막대 차트 --%>
											<div class="col-lg-6">
												<div class="content-panel pnHeight">
													<h4>
														<i class="fa fa-angle-right"></i> 반 평균
													</h4>
													<div class="panel-body text-center">
														<canvas id="bar2"></canvas>
													</div>
												</div>
											</div>
											<%-- 반 등수 표 --%>
											<div class="col-lg-6">
												<div class="content-panel pnHeight">
													<h4>
														<i class="fa fa-angle-right"></i> 반 등수
													</h4>
													<div class="btn-group pull-right">
														<button type="button"
															class="btn btn-theme-right dropdown-toggle"
															data-toggle="dropdown">
															시험 목록 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#">Java</a></li>
															<li><a href="#">Oracle</a></li>
															<li><a href="#">Web</a></li>
															<li><a href="#">Spring</a></li>
														</ul>
													</div>
													<div class="panel-body text-center">
														<div class="table-inbox-wrap">
															<table
																class="table table-bordered table-striped table-condensed">
																<tbody>
																	<tr class="unread">
																		<td>1등</td>
																		<td>2등</td>
																		<td>3등</td>
																		<td>4등</td>
																		<td>5등</td>
																	</tr>
																	<tr>
																		<td>나일등</td>
																		<td>나이등</td>
																		<td>나삼등</td>
																		<td>나사등</td>
																		<td>나오등</td>
																	</tr>
																	<tr class="unread">
																		<td>6등</td>
																		<td>7등</td>
																		<td>8등</td>
																		<td>9등</td>
																		<td>10등</td>
																	</tr>
																	<tr>
																		<td>나육등</td>
																		<td>나칠등</td>
																		<td>나팔등</td>
																		<td>나구등</td>
																		<td>나십등</td>
																	</tr>
																	<tr class="unread">
																		<td>11등</td>
																		<td>12등</td>
																		<td>13등</td>
																		<td>14등</td>
																		<td>15등</td>
																	</tr>
																	<tr>
																		<td>나육등</td>
																		<td>나칠등</td>
																		<td>나팔등</td>
																		<td>나구등</td>
																		<td>나십등</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row mt">
											<%-- 점수별 학생 분포 차트 --%>
											<div class="col-lg-12">
												<div class="content-panel">
													<h4>
														<i class="fa fa-angle-right"></i> 점수별 학생 분포
													</h4>
													<div class="btn-group pull-right">
														<button type="button"
															class="btn btn-theme-right dropdown-toggle"
															data-toggle="dropdown">
															시험 목록 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#">Java</a></li>
															<li><a href="#">Oracle</a></li>
															<li><a href="#">Web</a></li>
															<li><a href="#">Spring</a></li>
														</ul>
													</div>
													<div class="panel-body text-center">
														<canvas id="line2" height=75%></canvas>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row mt">
											<%-- 학생별 성적표 시작--%>
											<div class="col-lg-12">
												<div class="content-panel">
													<h4>
														<i class="fa fa-angle-right"></i> 학생별 성적표
													</h4>
													<div class="panel-body text-center">
														<table id="studentPerGrade" class="display"
															style="width: 100%">
															<thead>
																<tr>
																	<td>학생 이름</td>
																	<td>Java</td>
																	<td>Oracle</td>
																	<td>Python</td>
																	<td>평균</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>김하나</td>
																	<td>56</td>
																	<td>76</td>
																	<td>56</td>
																	<td>89</td>
																</tr>
																<tr>
																	<td>방민지</td>
																	<td>89</td>
																	<td>76</td>
																	<td>89</td>
																	<td>89</td>
																</tr>
																<tr>
																	<td>서정원</td>
																	<td>89</td>
																	<td>78</td>
																	<td>78</td>
																	<td>89</td>
																</tr>
															</tbody>
														</table>

													</div>
												</div>
											</div>
											<%-- 학생별 성적표 끝--%>
										</div>
									</div>
								</div>
								<%-- 클래스 학생 표/차트 끝 --%>
							</div>
							<!-- /row -->
						</div>
						<%-- 클래스 통계 탭 끝 --%>
					</div>
				</div>
				<%-- 탭 본문 영역 끝 --%>
			</div> <!-- row content-panel -->
		</div>	<!-- row mt -->
		
	</section> 	<!-- wrapper -->
</section>	<!-- /main-content -->

<%--ChartJS--%>
<%--ChartJS CDN--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%--ChartJS 차트 경로--%>
<script src="${pageContext.request.contextPath}/lib/onet-js/studentInfo.js" type="text/javascript"></script>