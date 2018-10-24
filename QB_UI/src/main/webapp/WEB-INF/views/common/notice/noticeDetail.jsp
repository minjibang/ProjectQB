<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/noticeView.css"
	rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel">
					<div class="panel-body ">
						<div class="mail-header row">
							<div class="col-md-8 noticeContent">
								<h4 class="pull-left">${result[0].notice_name}</h4>
							</div>
							<div class="col-md-4">
								<div class="compose-btn pull-right"></div>
							</div>
						</div>
						<div class="mail-sender">
							<div class="row">
								<div class="col-md-8"></div>
								<div class="col-md-4 pull-right noticeDetailWriterDiv">
									<p class="date">
										<strong>${result[0].member_id}</strong>&nbsp; &nbsp; ${result[0].notice_date} &nbsp; &nbsp;
										
									</p>
								</div>
							</div>
						</div>

						<div class="view-mail noticeContent">
							${result[0].notice_content}
						</div>
						<div class="attachment-mail noticeContent">
							<p>
								<span><i class="fa fa-paperclip"></i> 첨부된 파일</span>
							</p>
							<ul>
								<c:choose>
								<c:when test="${not empty result[0].notice_file1}">
								<li><a class="name" href="#">
								<img src="${pageContext.request.contextPath}/resources/upload/board/${result[0].notice_file1}">
								</a>
									<div class="links">
										<a href="${pageContext.request.contextPath}/file/${result[0].notice_file1}.do">다운로드</a>
									</div></li>
								</c:when>
								</c:choose>
								<c:choose>
								<c:when test="${not empty result[0].notice_file2}">
								<li><a class="atch-thumb" href="#"> 
								</a> <a class="name" href="#"><img src="${pageContext.request.contextPath}/resources/upload/board/${result[0].notice_file2}">
								</a>
									<div class="links">
										<a href="${pageContext.request.contextPath}/file/${result[0].notice_file2}.do">다운로드</a>
									</div></li>
								</c:when>
								</c:choose>
							</ul>
						</div>
						
						<c:forEach items="${comment}" var="comment">
						<c:choose>
						<c:when test="${comment.comment_group eq 0}">
						<div class="row noticeView_Comments_1 noticeContent" id="${comment.comment_num}">
							<div class="col-sm-3">
								<strong>${comment.member_id}</strong><br> ${comment.comment_date}
							</div>
							<div class="col-sm-8">${comment.comment_content}</div>
							<div class="col-sm-1">
								<a class="gg"><i class="fa fa-reply"></i>답글</a> 
							</div>
							
						</div>
						</c:when>
						</c:choose>
						
						<c:forEach items="${commentGroup}" var="commentGroup">
						<c:choose>
						<c:when test="${commentGroup.comment_group eq comment.comment_num}">
						<div class="row noticeView_Comments_2 noticeContent">
							<div class="col-sm-3">
								<strong>ㄴ ${commentGroup.member_id}</strong><br>${commentGroup.comment_date}
							</div>
							<div class="col-sm-8">${commentGroup.comment_content}</div>
							<div class="col-sm-1">
								<a href=""><i class="fa fa-reply"></i>답글</a>
							</div>
						</div>
						</c:when>
						</c:choose>
						</c:forEach>
						</c:forEach>
						
						<br>
						
						

						
						<div class="row noticeDetailBtnDiv">
							<a href="teacherMain.do" class="btn btn-theme">글 목록</a>
							<button type="button" class="btn btn-theme">글 수정</button>
							<button type="button" class="btn btn-theme04">글 삭제</button>
						</div>

					</div>

				</div>
			</div>
		</div>
	</section>
</section>

<script>
$(document).ready(function(){
	
	$('.gg').click(function (){
		
		if($(this).text()=='답글'){
			$(this).parent().parent().after("<div class='row noticeView_Comments_2 noticeContent'><div class='col-sm-3'>ㄴ <input type='text'></div></div>");
			$(this).html('답글취소');	
		}else{
			$(this).parent().parent().next().remove();
			$(this).html('<i class="fa fa-reply"></i>답글');
		}	
		});
					});

	/* $.ajax({
	 type : "post",
	 url : "${pageContext.request.contextPath}/teacher/commentReply.do",
	 data:{lgCatCode:$('#lgCode').val(), lgCatName:$('#lgName').val(), lgBeforeName:$('#updateLgBtn').val()},  
	 success : function(data){
	 if(data.result =="Notnull"){
	 swal("중복된 이름이 있습니다", "다른 이름을 사용하여 수정해주세요", "error");
	 }else{
	 swal({
	 title: "대분류 정보가 수정되었습니다",
	 text: "",
	 icon:"success"
	 }).then(function() {
	 window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
	 });
	 }	   			 
	 },
	 error: function(error){
	 alert("에러야!");
	 }
	 }); */
</script>
