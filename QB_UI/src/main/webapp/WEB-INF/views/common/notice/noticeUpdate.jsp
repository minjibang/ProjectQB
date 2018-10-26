<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.sub{
	text-align: center;
}
.img{
	width:100px;
	height:100px;
}
#txtFile1{
	display:inline;
}
#txtFile2{
	display:inline;
}
</style>
<!-- 강사 공지사항 글쓰기 -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="fluid-container">
				<div class="col-lg-12"></div>
				<!-- /col-lg-12 -->
				<div class="col-lg-12 mt">
					<div class="row content-panel div_table">
						<!-- 클래스 공지사항 -->
						<div id="noticeWrite_div" class="col-md-12">
							<form action="noticeRealUpdate.do" method="post" enctype="multipart/form-data" onsubmit="return check();">
								<table class="table">
									<tr>
										<td class="fst_td">제목</td>
										<td class="scd_td"><input type="text" id="notice_name" name="notice_name"
											class="notice_input" value="${result[0].notice_name}"/></td>
									</tr>
									<tr>
										<td class="fst_td">내용</td>
										<td class="sec_td"><textarea id="notice_content" name="notice_content" class="summernote1 notice_input" 
												rows="20" >${result[0].notice_content}</textarea></td>
									</tr>
									<tr>
										<td class="fst_td">파일 첨부</td>
										<td>
											<c:choose>
												<c:when test="${empty result[0].notice_file1 && empty result[0].notice_file2}">
													<span><i class="fa fa-paperclip"></i> 첨부된 파일이 없습니다.</span><br>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${not empty result[0].notice_file1 ||	not empty result[0].notice_file2}">
													<span><i class="fa fa-paperclip"></i> 기존 첨부파일</span><br>
												</c:when>
											</c:choose>
											<div class="col-sm-4">
											<c:choose>
												<c:when test="${not empty result[0].notice_file1}">
													<img src="${pageContext.request.contextPath}/upload/notice/${result[0].notice_file1}" class="img" onerror="this.src='${pageContext.request.contextPath}/upload/notice/error.jpg'">
													<br>
													<span class="span">${originFileName1}</span>
													<br>
													<input type="file" id="txtFile1" class="file" name="files1" />
												</c:when>
											</c:choose>
											</div>
											<div class="col-sm-4">
											<c:choose>
												<c:when test="${not empty result[0].notice_file2}">
													<img src="${pageContext.request.contextPath}/upload/notice/${result[0].notice_file2}" class="img" onerror="this.src='${pageContext.request.contextPath}/upload/notice/error.jpg'">
													<br>
													<span class="span">${originFileName2}</span>
													<br>
													<input type="file" id="txtFile2" class="file" name="files2" />
												</c:when>
											</c:choose>
											</div>
											<br>
											<input type="hidden" id="class_name" name="class_name" value="${result[0].class_name}">
											<input type="hidden" id="notice_num" name="notice_num" value="${result[0].notice_num}">
											<c:choose>
												<c:when test="${empty result[0].notice_file1 && empty result[0].notice_file2}">
												<input type="file" id="txtFile1" class="file" name="files1" />
												<input type="file" id="txtFile2" class="file" name="files2" />
												</c:when>
											</c:choose>	
										</td>
									</tr>
									<tr>
										<td colspan="2" class="sub">
											<button type="submit" id="btnupdate" class="btn btn-info">수정</button>&nbsp;&nbsp;
											<a href="teacherMain.do"><input type="button" class="btn btn-info" value="취소" /></a>
											<!-- <button class="btn btn-info">취소</button> -->
										</td>
									</tr>
								</table>
							</form>
						</div>
						<!-- /클래스 공지사항 -->

					</div>
					<!-- /col-lg-12 -->
				</div>
				<!-- /row -->

			<!-- /container -->
		</div>
	</section>
	<!-- /wrapper -->
</section>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	function check(){
		var a = $('#notice_content').val();
		var b = a.replace("<p>","");
		var c = b.replace("<br>","");
		var d = c.replace("</p>","");

		if(d == "" || d == null){
			swal("글 내용을 반드시 입력해주세요", "글내용을 입력하지 않으면 등록할 수 없습니다", "error");
		return false;
		}else{
		return true;	
	}
	}


</script>
