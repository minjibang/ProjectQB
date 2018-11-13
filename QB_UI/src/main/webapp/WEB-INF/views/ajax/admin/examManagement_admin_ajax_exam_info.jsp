<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>


<c:forEach items="${classList}" var="classlist">
	<div class="col-lg-12 deleteline">
		<div class="div-left">
			<img src="" class="testIcon">
		</div>
		<div class="exam_info_name">
			<h4>
				<strong>${classlist.exam_info_name}</strong>
				<se:authorize access="hasRole('ROLE_ADMIN')">
					<span> ( ${classlist.class_name } )</span>
				</se:authorize>
			</h4>				
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-tag"></i><b> ${classlist.class_name}</b>
			</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 시험 날짜 :
				${classlist.exam_info_date} ( ${classlist.exam_info_start} ~
				${classlist.exam_info_end})</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 응시 대상 :
				${classlist.exam_info_member}</p>			
		</div>
		<div class="div-right">
			<button type="button" id="${classlist.exam_info_num}"
				name="deleteExamScheduleBtn" class="btn btn-theme04 buttonGroup"
				onclick="deleteExamInfo()" value="${classlist.exam_info_date}">삭제</button>
			<button type="button" class="btn btn-theme buttonGroup"
				onclick="location.href='examScheduleUpdate.do?exam_info_num=${classlist.exam_info_num}&exam_info_name=${classlist.exam_info_name}'">시험
				일정 수정</button>
			<input type="hidden" id="hidden_class_num"
				value='${param.class_num}'>
		</div>
	</div>
</c:forEach>

<script>
$(document).ready(function(){
	$(".testIcon").each(function(){
		var testIcon = $(this);	
		var code= testIcon.parents().children('.exam_info_name').children('h4').children('strong').eq(0).text().charCodeAt(1)%6;
		for(var i=0;i<6;i++){
			switch(code){
				case i: testIcon.attr("src","${pageContext.request.contextPath}/img/testIcon/exam"+i+".png"); break;
			}
		}
	});
});
</script>