<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

						
						<c:forEach items="${comment}" var="comment">
						<c:choose>
						<c:when test="${comment.comment_group eq 0}">
						<div class="row noticeView_Comments_1 noticeContent" id="${comment.comment_num}">
							<div class="col-sm-3">
								<strong>${comment.member_id}</strong><br> ${comment.comment_date}
							</div>
							<div class="col-sm-6">${comment.comment_content}</div>
							<div class="col-sm-3">&nbsp;&nbsp;
								<a class="reply"><i class="fa fa-reply"></i>댓글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="update"><i class="fa fa-pencil"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="delete"><i class="fa fa-trash-o"></i>삭제</a>
							</div>
							
						</div>
						</c:when>
						</c:choose>
						
						<c:forEach items="${commentGroup}" var="commentGroup">
						<c:choose>
						<c:when test="${commentGroup.comment_group eq comment.comment_num}">
						<div class="row noticeView_Comments_2 noticeContent" id="${commentGroup.comment_group}">
							<div class="col-sm-3">
								<strong>ㄴ ${commentGroup.member_id}</strong><br>${commentGroup.comment_date}
							</div>
							<div class="col-sm-6">${commentGroup.comment_content}</div>
							<div class="col-sm-3">
								<a class="replyReply"><i class="fa fa-reply"></i>댓글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="replyUpdate"><i class="fa fa-pencil"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="replyDelete"><i class="fa fa-trash-o"></i>삭제</a>
							</div>
						</div>
						</c:when>
						</c:choose>
						</c:forEach>
						</c:forEach>
						

						