<%-- 
	@JSP:noticeWrite.jsp
	@DATE:2018-10-10
	@Author:우한결
	@Desc:강사 공지사항 글쓰기 페이지(스토리보드 18 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
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
							<form action="noticeView.do" method="post" enctype="multipart/form-data" onsubmit="return check();">
								<table class="table">
									<tr>
										<td class="fst_td">제목</td>
										<td class="scd_td"><input type="text" id="notice_title" name="notice_name"
											class="notice_input" placeholder="제목을 입력해주세요" required /></td>
									</tr>
									<tr>
										<td class="fst_td">내용</td>
										<td class="sec_td"><textarea id="notice_content" name="notice_content" class="summernote1 notice_input" 
												rows="20" placeholder="내용을 입력해주세요"></textarea></td>
									</tr>
									<tr>
										<td class="fst_td">파일 첨부</td>
										<td>
											<input type="file" id="txtFile1" name="files1" /><br><br>
											<input type="file" id="txtFile2" name="files2" />
											<input type="hidden" id="class_name" name="class_name" value="${class_name}"> 
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<button type="submit" id="notice_submit" class="btn btn-info">글 등록</button>
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
		if($('#notice_content').val() == "" || $('#notice_content').val() == null){
			swal("글 내용을 반드시 입력해주세요", "글내용을 입력하지 않으면 등록할 수 없습니다", "error");
		return false;
		}else{
		return true;	
	}
	}

</script>
