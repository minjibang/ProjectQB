<%--
	@JSP:studentGradeManage.jsp
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 - 성적관리 (스토리보드 37 of 41)	
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/GradeManage.css"
	rel="stylesheet">

<!--메인 컨텐츠 시작-->
<section id="main-content">
	<section class="wrapper">
	
		<div class="row mt">
			<!-- tab test -->
			<div class="row">
			
				<div class="col-md-12">
					<div class="content-panel">
						<div class="panel-body">
							<header class="panel-heading wht-bg">
								<h4 class="gen-case">
									<i class="fa fa-angle-right"></i>&nbsp;&nbsp;성적 관리
								</h4>
							</header>
							<!-- page start-->
							<div id="chartjs">
								<div class="row mt">
									<%-- 각 시험 성적 막대차트 시작--%>
									<div class="col-lg-6">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 각 시험 성적
											</h4>
											<div class="panel-body text-center">
												<canvas id="studentBar" height="300" width="400"></canvas>
											</div>
										</div>
									</div>
									<%-- 각 시험 성적 막대차트 끝--%>
									<%-- 반/학생 평균 비교 선 차트 시작--%>
									<div class="col-lg-6">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 반/학생 평균 비교
											</h4>
											<div class="panel-body text-center">
												<canvas id="studentLine" height="300" width="400"></canvas>
											</div>
										</div>										
									</div>
									<%-- 반/학생 평균 비교 선 차트 끝--%>
									<%-- 내 등수 보기 패널 시작 --%>
									<div class="col-lg-12">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 나의 등수 보기
											</h4>
											<div class="btn-group pull-right">
												<button type="button"
													class="btn btn-theme-right dropdown-toggle"
													data-toggle="dropdown">
													시험 별 나의 등수 확인 <span class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">Java</a></li>
													<li><a href="#">Oracle</a></li>
													<li><a href="#">Web</a></li>
													<li><a href="#">Spring</a></li>
												</ul>
											</div>
											<div class="panel-body">
												<h3>
													<b>현재 ___님의 ___ 시험 등수는 __등 입니다.</b>
												</h3>
											</div>
										</div>
									</div>
									<%-- 내 등수 보기 패널 끝 --%>									
								</div>
							</div>
						</div>
					</div>
					<!-- tab test -->
				</div>
			</div>
		</div>
		</div>
		
	</section>
	<!-- /wrapper -->
</section>
<!--메인 컨텐츠 끝-->

<%--ChartJS--%>
<%-- ChartJS CDN --%>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%-- --%>
<script	src="${pageContext.request.contextPath}/lib/onet-js/GradeManage.js"	type="text/javascript"></script>