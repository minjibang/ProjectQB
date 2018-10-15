<%-- 
	@JSP:noticeWrite.jsp
	@DATE:2018-10-10
	@Author:우한결
	@Desc:강사 공지사항 글쓰기 페이지(스토리보드 18 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<form action="noticeView.do" method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td class="fst_td">제목</td>
										<td class="scd_td"><input type="text" id="notice_title"
											class="notice_input" placeholder="제목을 입력해주세요" required /></td>
									</tr>
									<tr>
										<td class="fst_td">내용</td>
										<td class="sec_td"><textarea id="notice_content" class="summernote1 notice_input" 
												rows="20" placeholder="내용을 입력해주세요" required></textarea></td>
									</tr>
									<tr>
										<td class="fst_td">파일 첨부</td>
										<td>
											<input type="file" id="txtFile" name="files[0]" />
											<input type="file" id="txtFile" name="files[1]" />
											<input type="file" id="txtFile" name="files[2]" />
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<button id="notice_submit" class="btn btn-info">글 등록</button>
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