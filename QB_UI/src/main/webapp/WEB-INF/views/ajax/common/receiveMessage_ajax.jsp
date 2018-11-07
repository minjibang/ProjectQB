<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach items="${receiveMessage}" var="receiveMessage">
	<c:choose>
		<c:when test="${receiveMessage.message_check == 0}">
			<li>
			<a href='${pageContext.request.contextPath}/admin/myMessage.do'>
			<span class='subject'>
			<span class='from'></span>
			<span class='time'></span>
			<span class='message' id='headermessagecontent'>${receiveMessage.message_content}</span>
			</span>
			</a>
			</li>
		</c:when>
	</c:choose>
</c:forEach>
				
				
				
				
				
			