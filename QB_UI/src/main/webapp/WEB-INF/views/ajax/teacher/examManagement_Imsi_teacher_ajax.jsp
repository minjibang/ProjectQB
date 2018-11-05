<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${myTempExamList}" var="myTempExamList">
	<!-- 시험지 한 개 시작 -->
	<div class="exam-paper-name">
		<h4 id="exam_paper_name">
			<strong>${myTempExamList.exam_paper_name}</strong>
		</h4>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${myTempExamList.exam_paper_desc}




		
		<div class="pdf_download text-right">
			<a href="#">PDF 다운로드 <img src="../img/file-download.png"></a>
			<button type="button" id="${myTempExamList.exam_paper_num}"
				class="btn btn-theme04 buttonGroup" onclick="deleteTempExamCheck()">삭제</button>
			<button type="button" class="btn btn-theme buttonGroup"
				onclick="location.href='tempUpdateExamView.do?exam_paper_num=${myTempExamList.exam_paper_num}&exam_paper_name=${myTempExamList.exam_paper_name}'">시험지
				수정</button>
			<input type="hidden" id="hidden_class_num" value='${param.class_num}'>
		</div>
		<hr>
	</div>
</c:forEach>