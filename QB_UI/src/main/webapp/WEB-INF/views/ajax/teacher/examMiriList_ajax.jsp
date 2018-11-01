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
	<c:forEach items="${examquestion}" var="examquestion" varStatus="status">
	<c:if test="${status.index eq 0 || status.index%8 eq 0}">
		<div id="page">
	</c:if>
		<table>
			<tr>
				<th>${examquestion.exam_question_seq}. &nbsp;&nbsp;&nbsp;</th>
				<th>${examquestion.question_name } (${examquestion.exam_question_score }점)</th>
			</tr>
			<c:forEach items="${question_choice }" var="question_choice">
				<c:if test="${question_choice.question_num eq examquestion.question_num }">
				<tr>
					<td>${question_choice.question_choice_num})</td>
					<td>${question_choice.question_choice_content}</td>
				<tr>
				</c:if>
			</c:forEach>				
		</table>
	<c:if test="${status.index%8 eq 7 }">
	</div>
	</c:if>
	</c:forEach>
</body>
</html>
