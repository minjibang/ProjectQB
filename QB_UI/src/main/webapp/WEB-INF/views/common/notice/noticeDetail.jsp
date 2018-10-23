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
								<span><i class="fa fa-paperclip"></i> 첨부된 파일 - 2 </span> <a
									href="#">모두 다운로드</a>
							</p>
							<ul>
								<li><a class="name" href="#"><img src="${pageContext.request.contextPath}/resources/upload/board/${result[0].notice_file1}"><span>20KB</span>
								</a>
									<div class="links">
										<a href="#">미리보기</a> - <a href="${pageContext.request.contextPath}/file/${result[0].notice_file1}.do">다운로드</a>
									</div></li>
								<li><a class="atch-thumb" href="#"> 
								</a> <a class="name" href="#"><img src="${pageContext.request.contextPath}/resources/upload/board/${result[0].notice_file2}"><span>20KB</span>
								</a>
									<div class="links">
										<a href="#">미리보기</a> - <a href="${pageContext.request.contextPath}/file/${result[0].notice_file2}.do">다운로드</a>
									</div></li>
							</ul>
						</div>
						

						<div class="row noticeView_Comments_1 noticeContent">
							<div class="col-sm-3">
								<strong>양회준</strong> <br> 2018.10.08 &nbsp;&nbsp; 12:02:33
								pm
							</div>
							<div class="col-sm-8">댓글번호 1번 댓글내용이 들어가는 자리입니다. 이자리는
								댓글내용자리! 내용테스트를 위한 글 길이 늘이기1 내용테스트를 위한 글 길이 늘이기2 내용테스트를 위한 글 길이
								늘이기3 내용테스트를 위한 글 길이 늘이기4 내용테스트를 위한 글 길이 늘이기5 내용테스트를 위한 글 길이 늘이기6
								내용테스트를 위한 글 길이 늘이기7 내용테스트를 위한 글 길이 늘이기8 내용테스트를 위한 글 길이 늘이기9
								내용테스트를 위한 글 길이 늘이기10 내용테스트를 위한 글 길이 늘이기11</div>
							<div class="col-sm-1">
								<a href=""><i class="fa fa-reply"></i>답글달기</a>
							</div>

						</div>
						<br>
						<div class="row noticeView_Comments_2 noticeContent">
							<div class="col-sm-3">
								<strong>우한결</strong> <br> 2018.10.08 &nbsp;&nbsp; 12:12:11
								pm
							</div>
							<div class="col-sm-8">ㄴ 대댓글번호 1번 내용이 들어가는 자리입니다. 이자리는
								대댓글내용자리!</div>
							<div class="col-sm-1">
								<a href=""><i class="fa fa-reply"></i>답글달기</a>
							</div>
						</div>
						<br>
						<div class="row noticeView_Comments_1 noticeContent">
							<div class="col-sm-3">
								<strong>조재훈 </strong><br> 2018.10.08 &nbsp;&nbsp; 12:35:09
								pm
							</div>
							<div class="col-sm-8">댓글번호 2번 댓글내용이 들어가는 자리입니다. 이자리는
								댓글내용자리! 내용테스트를 위한 글 길이 늘이기1 내용테스트를 위한 글 길이 늘이기2 내용테스트를 위한 글 길이
								늘이기3 내용테스트를 위한 글 길이 늘이기4 내용테스트를 위한 글 길이 늘이기5 내용테스트를 위한 글 길이 늘이기6
								내용테스트를 위한 글 길이 늘이기7 내용테스트를 위한 글 길이 늘이기8 내용테스트를 위한 글 길이 늘이기9
								내용테스트를 위한 글 길이 늘이기10 내용테스트를 위한 글 길이 늘이기11</div>
							<div class="col-sm-1">
								<a href=""><i class="fa fa-reply"></i>답글달기</a> &nbsp;&nbsp; <a
									href=""><i class="fa fa-trash-o"></i>삭제</a>
							</div>
						</div>
						<br>
						<div class="row noticeView_Comments_1 noticeContent">
							<div class="col-sm-3">
								<strong>강사 홍길동</strong> <br> 2018.10.08 &nbsp;&nbsp;
								12:35:09 pm
							</div>
							<div class="col-sm-8">댓글번호 3번 댓글내용이 들어가는 자리입니다. 이자리는
								댓글내용자리! 내용테스트를 위한 글 길이 늘이기1 내용테스트를 위한 글 길이 늘이기2 내용테스트를 위한 글 길이
								늘이기3 내용테스트를 위한 글 길이 늘이기4 내용테스트를 위한 글 길이 늘이기5 내용테스트를 위한 글 길이 늘이기6
								내용테스트를 위한 글 길이 늘이기7 내용테스트를 위한 글 길이 늘이기8 내용테스트를 위한 글 길이 늘이기9
								내용테스트를 위한 글 길이 늘이기10 내용테스트를 위한 글 길이 늘이기11</div>
							<div class="col-sm-1">
								<a href=""><i class="fa fa-reply"></i>답글달기</a>
							</div>
						</div>
						<br>

						<div class="row noticeView_CommentsWrite noticeContent">

							<div class="form-group">
								<label id="commentWriter" class="col-sm-2 control-label"><strong>조재훈</strong></label>
								<div class="col-sm-8">
									<textarea class="wysihtml5 form-control" rows="2"></textarea>
								</div>
								<div class="col-sm-1">
									<button type="button" id="commentSubmit" class="btn btn-theme">
										댓글 등록</button>
								</div>

							</div>

						</div>
						<div class="row noticeDetailBtnDiv">
							<button type="button" class="btn btn-theme">글 목록</button>
							<button type="button" class="btn btn-theme">글 수정</button>
							<button type="button" class="btn btn-theme04">글 삭제</button>
						</div>

					</div>

				</div>
			</div>
		</div>
	</section>
</section>
