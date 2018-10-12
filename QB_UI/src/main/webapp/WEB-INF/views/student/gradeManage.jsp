<%--
	@JSP:studentGradeManage.jsp
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 - 성적관리 (스토리보드 37 of 41)	
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath}/css/studentGradeManage.css"
	rel="stylesheet">

<!--main content start-->
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
									<div class="col-md-offset-1 col-md-5">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 각 시험 성적
											</h4>
											<div class="panel-body text-center">
												<canvas id="studentBar" height="300" width="400"></canvas>
											</div>
										</div>
									</div>
									<div class="col-md-5">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 반/학생 평균 비교
											</h4>
											<div class="panel-body text-center">
												<canvas id="studentLine" height="300" width="400"></canvas>
											</div>
										</div>
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 등수 보기
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
											<div class="panel-body">
												<h1>
													나의 등수는? <b>2등</b>
												</h1>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- tab test -->
				</div>
			</div>
		</div>
		</div>
		<!-- /MAIN CONTENT -->
		<!--main content end-->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<!--ChartJS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script
	src="${pageContext.request.contextPath}/lib/onet-js/studentGradeManage.js"
	type="text/javascript"></script>