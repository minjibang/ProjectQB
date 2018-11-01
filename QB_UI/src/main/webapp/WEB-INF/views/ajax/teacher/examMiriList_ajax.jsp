<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style>
#page{
	width: 793px;
  	height: 1122px;
	column-count : 2;
	column-rule-style: solid;
	column-rule-width: 1px;
	background: white;
	/* margin: 1cm auto; */
	padding: 2cm;
	border-radius: 5px;
}
#page table {
	margin-bottom : 50px;
	margin-right : 20px;
}
td {
	vertical-align : top;
	padding : 2px;
}
th {
	vertical-align : top;
	padding-bottom : 15px;
}
#all{
	column-span : all;
}
.endline{
	page-break-before:always;
}
</style>

</head>
<body>	
	<c:forEach items="${examquestion}" var="examquestion" varStatus="status">	
	<c:if test="${status.index eq 0 || status.index%8 eq 0}">
		<div id="page">
		<c:if test="${status.index eq 0 }">
			<div id="all">
				<h1>${examquestion.exam_paper_name }</h1>
				<hr>
			</div>
		</c:if>
	</c:if>
		<table>
			<tr>
				<th>${examquestion.exam_question_seq}. &nbsp;&nbsp;&nbsp;</th>
				<th>${examquestion.question_name } (${examquestion.exam_question_score }점)</th>
			</tr>
			<c:if test="${examquestion.question_img ne null }">
			<tr>
				<td colspan="2"><img src="${pageContext.request.contextPath }/resources/upload/question/${examquestion.question_img}" title="questionIMG" alt="${examquestion.question_img}" class="questionImg"/></td>
				
			</tr>
			</c:if>
			<c:forEach items="${question_choice }" var="question_choice">
				<c:if test="${question_choice.question_num eq examquestion.question_num }">
				<tr>
					<td>${question_choice.question_choice_num})</td>
					<td>${question_choice.question_choice_content}
					<%-- <c:if test="${question_choice.question_choice_image ne null }">
					<br><img src="${pageContext.request.contextPath }/resources/upload/question/${question_choice.question_choice_image}" title="questionIMG" alt="${question_choice.question_choice_image}" class="questionImg"/>
					</c:if>  --%>
					</td>
				<tr>
				</c:if>
			</c:forEach>				
		</table>
	<c:if test="${status.index%8 eq 7 }">
	</div><div class="endline"></div><br style="height:0; line-height:0">
	</c:if>
	</c:forEach>
</body>
</html>
