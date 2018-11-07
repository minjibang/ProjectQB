<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<c:forEach items="${classList}" var="classlist">
	<form action="" method="post" id="pickExamScheduleForm">
		<div class="col-lg-12">
			<!-- 시험 일정 하나의 div 시작 -->
			<div id="examScheduleDiv">
			
					<div class="exam_info_name">
						<h4 class="miri">
							<strong>${classlist.exam_info_name}</strong>
							<se:authorize access="hasRole('ROLE_ADMIN')">
							<span> ( ${classlist.class_name } )</span>
							</se:authorize>
						</h4>
						<div class="view-schedule text-center">
							<p>시험 날짜 : ${classlist.exam_info_date}</p>
							<p>시험 시간 : ${classlist.exam_info_start} ~
								${classlist.exam_info_end}</p>
							<p>[${classlist.exam_info_time}]</p>
							<p>응시 대상 : ${classlist.exam_info_member}</p>
							<p>클래스명 : ${classlist.class_name}</p>
							<button type="button" id="${classlist.exam_info_num}"
								name="deleteExamScheduleBtn" class="btn btn-theme04 buttonGroup"
								onclick="deleteExamInfo()"
								value="${classlist.exam_info_date}">삭제</button>
							<button type="button" class="btn btn-theme buttonGroup"
								onclick="location.href='examScheduleUpdate.do?exam_info_num=${classlist.exam_info_num}&exam_info_name=${classlist.exam_info_name}'">시험
								일정 수정</button>
							<input type="hidden" id="hidden_class_num"
								value='${param.class_num}'>
						</div>
						<br> <br>
						<hr>
					</div>
			

			</div>
		</div>
	</form>
</c:forEach>