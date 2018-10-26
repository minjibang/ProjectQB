<%-- 
	@JSP:notice.jsp
	@DATE:2018-10-06
	@Author:우한결
	@Desc:강사, 학생 메인 페이지(스토리보드 17, 35 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/notice.css" rel="stylesheet">
<!-- 강사, 학생 - 메인페이지 (클래스 공지사항, 시험일정) -->

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel noticePageContent">
					<div class="panel-content">
						<div class="panel-heading">
							<header class="panel-heading wht-bg">
								<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;공지사항</h4>
							</header>
						</div>
					
						<div class="panel-body">
					
							<table class="table table-inbox-notice table-hover" id="noticetable">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>첨부파일</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${notice}" var="notice">
										<tr class="notice_tr" onClick="location.href='noticeDetail.do?class_name=${notice.class_name}&notice_num=${notice.notice_num}'">
											<td class="notice_num">${notice.notice_num}</td>
											<td class="notice_name">${notice.notice_name}</td>
											<td class="notice_file"><i class="fa fa-paperclip"></i></td>
											<td class="notice_member_id">${notice.member_id}</td>
											<td class="notice_date">${notice.notice_date}</td>
										</tr>
									</c:forEach>	
										<c:forEach items="${boardNull}" var="boardNull">
											<input type="hidden" class="notice_classname" value="${boardNull.class_name}">
										</c:forEach>
								</tbody>
							</table>
							<div>
								<button id="noticeWrite_btn" class="btn btn-theme" value="">글쓰기</button>
							</div>
						</div><!-- panel-body -->
						
						
					</div><!-- panel-content -->
				</div><!-- row content-panel -->
				
				<div class="row content-panel noticePageContent">
					<div class="panel-content">
						<div class="panel-heading">
							<header class="panel-heading wht-bg">
								<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;시험 일정</h4>
							</header>
						</div>
						<div class="panel-body">
							<table class="table table-inbox-exam table-hover" id="noticetable2">
								<thead>
									<tr>
										<th>시험번호</th>
										<th>시험 이름</th>
										<th>시험 시간</th>
										<th>응시 대상</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${exam_info}" var="exam_info">
										<tr class="" onClick="location.href='examScheduleDetail.do?exam_info_num=${exam_info.exam_info_num}'">
											<td class="exam_info_num">${exam_info.exam_info_num }</td>
											<td class="exam_info_name">${exam_info.exam_info_name }</td>
											<td class="exam_info_date">${exam_info.exam_info_date }<br>
											${exam_info.exam_info_start } ~ ${exam_info.exam_info_end }<br>
											${exam_info.exam_info_time } 분</td>
											<td class="exam_info_member">${exam_info.exam_info_member }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						
						</div>
					</div>
				</div>
			</div><!-- /col-lg-12 -->
		</div><!-- /row mt -->
	</section><!-- /wrapper -->
</section> <!-- /main-content -->


<script>
$(document).ready(function(){
	var class_name1 = $('.notice_classname').val();
	document.getElementById('noticeWrite_btn').setAttribute('value', class_name1);
	
	$('#noticeWrite_btn').click(function(){
		var class_name2 = $('#noticeWrite_btn').val();
		location.href="noticeWrite.do?class_name=" + class_name2;
		 
	});
	
});


</script>

<!-- /MAIN CONTENT -->
<!--main content end-->