<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/noticeView.css"
	rel="stylesheet">
<style>
#replyAddBtn{
	width:100%;
	height:100px;
}
#replyArea{
	width:100%;
	height:100px;
}
</style>

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
							<span></span>
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
						<div id="list1body">
						<c:forEach items="${comment}" var="comment">
						<c:choose>
						<c:when test="${comment.comment_group eq 0}">
						<div class="row noticeView_Comments_1 noticeContent comment_number" id="${comment.comment_num}">
							<div class="col-sm-3">
								<strong>${comment.member_id}</strong><br> ${comment.comment_date}
							</div>
							<div class="col-sm-6">${comment.comment_content}</div>
							<div class="col-sm-3">&nbsp;&nbsp;
								<a class="reply"><i class="fa fa-reply"></i>댓글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
								<c:when test="${name eq comment.member_id}">
								<a class="update"><i class="fa fa-pencil"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="delete"><i class="fa fa-trash-o"></i>삭제</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
								
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
								<c:choose>
								<c:when test="${name eq comment.member_id}">
								<a class="replyUpdate"><i class="fa fa-pencil"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="replyDelete"><i class="fa fa-trash-o"></i>삭제</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
							</div>
						</div>
						</c:when>
						</c:choose>
						</c:forEach>
						</c:forEach>
						</div>
						<br>
						<div class="row noticeView_Comments_2">
						<div class="col-sm-9">
						<textarea name="replyArea" cols="40" rows="3" id="replyArea"></textarea>
						</div>
						<div class="col-sm-2">
						<button type="button" class="btn btn-default" id="replyAddBtn">등록</button>
						</div> 
						</div>
						
						

						
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	var notice_num = "<c:out value='${result[0].notice_num}'/>";
	var class_name = "<c:out value='${result[0].class_name}'/>";
	var member_id = "${name}";
	
	$(document).on('click','.reply',function(){
		
		if($(this).text()=='댓글'){
			$(this).parent().parent().after("<div class='row noticeView_Comments_2 noticeContent'><div class='col-sm-3'>ㄴ <input type='text' class='replyInput' maxlength='40' required style=width:500px;><a class='replyAdd'><i class='fa fa-plus-square'></i>등록</a></div></div>");
			$(this).html('<i class="fa fa-share"></i>취소');	
		}else{
			$(this).parent().parent().next().remove();
			$(this).html('<i class="fa fa-reply"></i>댓글');
		}	
	});
	
	$(document).on('click','.replyAdd',function(){
		var replyInput = $(this).siblings('.replyInput').eq(0).val();
		var comment_num = $(this).parent().parent().prev().attr('id');
		$.ajax({
			 type : "post",
			 url : "${pageContext.request.contextPath}/teacher/commentReply.do",
			 data:"notice_num="+notice_num+"&class_name="+class_name+"&comment_num="+comment_num+"&replyInput="+replyInput,  
			 success : function(data){
			 	   	$.ajax({
			 	   		type : "post",
			 	   		url : "${pageContext.request.contextPath}/teacher/noticeDetailAjax.do",
			 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
			 	   		success: function(data){
			 	   				$('#list1body').html(data);
			 	   		}
			 	   	});
			 },
			 error: function(error){
			 alert("에러야!");
			 }
			 }); 
		
	});
	
	$(document).on('click','.replyReply',function(){
		
		if($(this).text()=='댓글'){
			$(this).parent().parent().after("<div class='row noticeView_Comments_2 noticeContent'><div class='col-sm-3'>ㄴ <input type='text' class='replyInput' style=width:500px;><a class='replyReplyAdd'><i class='fa fa-plus-square'></i>등록</a></div></div>");
			$(this).html('<i class="fa fa-share"></i>취소');	
		}else{
			$(this).parent().parent().next().remove();
			$(this).html('<i class="fa fa-reply"></i>댓글');
		}	
		});
	
	$(document).on('click','.replyReplyAdd',function(){
		var replyInput = $(this).siblings('.replyInput').eq(0).val();
		var comment_num = $(this).parent().parent().prev().attr('id');
		console.log(replyInput);
		console.log(comment_num);
		$.ajax({
			 type : "post",
			 url : "${pageContext.request.contextPath}/teacher/commentReply.do",
			 data:"notice_num="+notice_num+"&class_name="+class_name+"&comment_num="+comment_num+"&replyInput="+replyInput,  
			 success : function(data){
			 	   	$.ajax({
			 	   		type : "post",
			 	   		url : "${pageContext.request.contextPath}/teacher/noticeDetailAjax.do",
			 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
			 	   		success: function(data){
			 	   				$('#list1body').html(data);
			 	   		}
			 	   	});
			 },
			 error: function(error){
			  alert("에러야!"); 
			 }
			 });
					});

	
	$('#replyAddBtn').click(function(){
		var textarea = $('#replyArea').val();
		if(textarea == "" || textarea == null){
			swal("댓글을 입력하지 않았습니다", "글을 입력 후 다시 등록버튼을 누르세요", "error");
		}else{
		$.ajax({
			 type : "post",
			 url : "${pageContext.request.contextPath}/teacher/commentInsert.do",
			 data:"notice_num="+notice_num+"&class_name="+class_name+"&textarea="+textarea,  
			 success : function(data){
			 	   	$.ajax({
			 	   		type : "post",
			 	   		url : "${pageContext.request.contextPath}/teacher/noticeDetailAjax.do",
			 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
			 	   		success: function(data){
			 	   				$('#list1body').html(data);
			 	   				$('#replyArea').val("");
			 	   		}
			 	   	});
			 },
			 error: function(error){
			  alert("에러야!"); 
			 }
			 });
		}
		
	});
	
	
	
	
});
</script>
