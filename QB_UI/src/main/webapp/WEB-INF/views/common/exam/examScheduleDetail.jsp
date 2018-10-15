<%-- 
	@JSP:examDetailView.jsp 
	@DATE:2018-10-08
	@Author:김현이
	@Desc:클래스 목록 페이지(스토리보드 30, 38 of 41)
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="${pageContext.request.contextPath}/css/examScheduleDetail.css"
	rel="stylesheet">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#examBtn')
								.click(
										function() {
											var popUrl = "examPaperDo.do";
											var popOption = "width=1000px, resizable=no, location=no, left=50px, top=100px";

											window.open(popUrl, "지난 시험보기",
													popOption);
										});
					});
</script>

<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel panelControl">

					<div class="row">

						<div class="col-lg-5 examImgDiv">
							<img id="examImg"
								src="${pageContext.request.contextPath}/img/friends/fr-02.jpg">
							<h3>자바 기초 시험</h3>
							<br> <br> <br>
						</div>
						<div class="col-lg-7">
							<div class="row">
								<table class="table examScheduleTable">
									<tbody>
										<tr>
											<td>시험 일시</td>
											<td>2018.08.15 &nbsp;&nbsp;&nbsp; 14:00:00 ~ 15:30:00</td>
										</tr>
										<tr>
											<td>시험 시간</td>
											<td>1시간 30분</td>
										</tr>
										<tr>
											<td>종료 알림</td>
											<td>5분 전</td>
										</tr>
										<tr>
											<td>응시 대상</td>
											<td>전체</td>
										</tr>
										<tr>
											<td>설명</td>
											<td>자바 기초에 대한 시험입니다. 화이팅하세요!</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-lg-3 clockImgDiv">
									<img id="clockImg"
										src="${pageContext.request.contextPath}/img/clock2.png">
								</div>
								<div class="col-lg-7">
									<br> 시험 시작까지 <b>03:20:17</b> 남았습니다. <br> 시험 시작 시간이 되면
									시험 감독 버튼이 활성화됩니다.<br>
								</div>
							</div>
							<div class="row examBtnDiv">
								<br> <br> <br> <br>
							</div>
						</div>
					</div>
					<div class="row examScheduleBtnDiv">
						<div class="col-lg-5">
							<button type="button" class="btn btn-default">뒤로 가기</button>
						</div>
						<!-- 강사일 경우 버튼이 "시험 시작" / 학생일 경우 버튼이 "시험 응시"-->
						<div class="col-lg-7">
							<button class="btn btn-theme03" id="examBtn">시험시작</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- /wrapper -->
</section>
