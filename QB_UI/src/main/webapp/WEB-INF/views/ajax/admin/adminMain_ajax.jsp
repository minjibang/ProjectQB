<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:forEach items="${classList}" var="classlist">
		<!-- weather-4 PANEL -->
		<div class="col-lg-3 col-md-3 col-sm-3 mb">
			<div class="project-wrapper">
				<div class="project">
					<!-- <div class="photo-wrapper"> -->
						<!-- <div class="photo"> -->
								<div class="weather-4 pn-big centered classDivSize">
									<a class="fancybox" href="adminClassMain.do?class_num=${classlist.class_num}&class_name=${classlist.class_name}">
										<input type="hidden" id="class_name" name="class_name" value="${classlist.class_name}"/>
										<!-- <h1>JAVA</h1> -->
										<div class="row classDiv">
											<i class="fa fa-desktop"></i>
											<div class="classDivOverFlow">
												${classlist.class_name}
											</div>
										</div>
									</a>
									<div class="info">
										<!-- <div class="row"> -->
											<%-- <h5 class="centered">클래스:비트캠프 - ${classlist.class_name}</h5> --%>
											<h5 class="centered">기간 : ${classlist.class_start_date} ~ ${classlist.class_end_date}</h5>
											<h5 class="centered">강사 : ${classlist.teacher_name}</h5>
											<div class="classBtnDiv">
												<p class="goright">
													<button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#classModify" id="modifyClass"><i class="fa fa-pencil btnIcon"></i></button>
													<button class="btn btn-danger btn-xs"><i class="fa fa-trash-o btnIcon"></i></button>
													<i class="fa fa-users classUsersIcon"></i> ${classlist.class_student_count}명
												</p>
											</div>
										<!-- </div> -->
									</div>
								</div>
							
						<!-- </div> -->
						<!-- <div class="overlay"></div> -->
					<!-- </div> -->
				</div>
			</div>
		</div>
	</c:forEach>