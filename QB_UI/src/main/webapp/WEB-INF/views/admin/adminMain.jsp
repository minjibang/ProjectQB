<%-- 
	@JSP:adminMain.jsp
	@DATE:2018-10-06
	@Author:양회준
	@Desc:클래스 목록 페이지(스토리보드 7 of 41)
 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<link href="${pageContext.request.contextPath}/css/adminMain.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/lib/onet-js/adminMain.js"></script>



<section id="main-content">
	<section class="wrapper">
		<div class="row mt">

			<!--  DATE PICKERS -->
			<div class="col-lg-12">
				<div class="row content-panel">
					<div class="panel-heading">
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;강의 목록
							</h4>
						</header>

					</div>
					<div class="panel-body">
						<div class="row searchRowDiv">
							<div class="col-lg-4">
								<button class="btn btn-theme" data-toggle="modal"
									data-target="#myModal" id="makeNewClassBtn">새 클래스 개설하기</button>
							</div>
							<div class="col-lg-8 searchRowRightDiv">
								<select class="form-control searchRightBtnDiv">
									<option>클래스명</option>
									<option>강사</option>
									<option>교육과목</option>
								</select> <input type="text" class="form-control searchRightBtnDiv"
									placeholder="검색어를 입력">
								<button class="btn btn-theme searchRightBtnDiv" id="classSearchBtn">검색</button>
							</div>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<form action="classInsert.do" class="form-horizontal style-form" method="post">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">클래스 개설</h4>
									</div>
									<div class="modal-body">
										<div class="form-panel">
											
												<div class="form-group">
													<label class="col-sm-2 col-sm-2 control-label">클래스명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															placeholder="클래스 명을 입력해주세요." id="class_name" name="class_name">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 col-sm-2 control-label">수강기간</label>
													<div class="col-md-10">
														<div class="input-group input-large">
															<input type="text" class="form-control dpd1" name="class_start_date" id="class_start_date">
															<span class="input-group-addon"> 에서 </span> <input
																type="text" class="form-control dpd2" name="class_end_date" id="class_end_date">
														</div>
														<span class="help-block">기간을 선택하세요.</span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 col-sm-2 control-label">강사명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															placeholder="강사님 이름을 입력해주세요." id="teacher_name" name="teacher_name">
													</div>
												</div>
										</div>
										<!-- /col-lg-12 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">생성</button>
									</div>
									</form>
								</div>
							</div>
						</div>

						<div class="row mt">
							<div class="col-lg-12">
							
							
								<c:forEach items="${classlist}" var="classlist">
								<!-- weather-4 PANEL -->
								<div class="col-lg-3 col-md-3 col-sm-3 mb">
									<div class="project-wrapper">
										<div class="project">
											<div class="photo-wrapper">
												<div class="photo">
													<a class="fancybox" href="adminClassMain.do">
														<div class="weather-4 pn-big centered">
															<i class="fa fa-desktop"></i>
															<h1>JAVA</h1>
															<div class="info">
																<div class="row">
																	<h5 class="centered">클래스:비트캠프 - ${classlist.class_name}</h5>
																	<h5 class="centered">교육기간:${classlist.class_start_date}-${classlist.class_end_date}</h5>
																	<h5 class="centered">강사:${classlist.teacher_name}</h5>
																	<div class="col-sm-6 col-xs-6 pull-right">
																		<p class="goright">
																			<i class="fa fa-users"></i> 25명
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</a>
												</div>
												<div class="overlay"></div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>

					</div>
				</div>
	</section>
	<!-- /wrapper-low -->
</section>