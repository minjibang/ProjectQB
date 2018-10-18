<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${classList}" var="classlist">
		<!-- weather-4 PANEL -->
		<div class="col-lg-3 col-md-3 col-sm-3 mb">
			<div class="project-wrapper">
				<div class="project">
					<div class="photo-wrapper">
						<div class="photo">
							<a class="fancybox"
								href="adminClassMain.do?class_num=${classlist.class_num}">
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
</body>
</html>