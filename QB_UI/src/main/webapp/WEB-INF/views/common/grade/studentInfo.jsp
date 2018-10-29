<%--
	@JSP:studentInfo.jsp
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 & 성적 관리(스토리보드 20 of 41)	
 --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/studentInfo.css" rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel">
					<%-- 탭 머리 시작 --%>
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
          					<li class="active">
            					<a data-toggle="tab" href="#studentInfo">학생정보</a>
          					</li>
          					<li>
            					<a data-toggle="tab" href="#studentChart">학생 개인 성적확인</a>
          					</li>
          					<li>
            					<a data-toggle="tab" href="#classChart">클래스 통계</a>
          					</li>
        				</ul>
					</div><!-- panel-heading -->
					<%-- 탭 머리 종료 --%>
					
					<%-- 탭 본문 영역 시작--%>
					<div class="panel-body">
						<div class="tab-content">
							<%-- 학생 정보 탭 시작 --%>
							<div id="studentInfo" class="tab-pane active">
								<div class="row">
								<%-- 학생 목록 시작 --%>
								<div class="col-lg-2">
									<section class="panel">
										<div class="panel-body">																					
											<table id="studentList" class="table table-hover">
												<h4>${studentList[0].class_name}</h4>
									                <thead>
									                  <tr>
									                    <th><i class="fa fa-bullhorn"></i> 학생목록</th>
									                  </tr>
									                </thead>
									                <tbody>									                
												<c:forEach items="${studentList}" var="studentList">												
								                  <tr>
								                    <td id="${studentList.member_id}" class="studentListMembers">
								                      <img src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
															class="img-circle" width="25"> ${studentList.member_name}
								                    </td>
								                   </tr>												
												</c:forEach>
											</tbody>
											</table>
										</div>
									</section>
								</div>
								<%-- 학생 목록 끝 --%>
								
								
								<%-- 선택 학생 정보 영역 시작 --%>
								<div class="col-lg-10">
									<h3 id="studentListName">${studentList[0].member_name}</h3>
									<h4 id="studentListEmail">이메일 : ${studentList[0].member_email}</h4>
									<h4 id="studentListPhone">핸드폰 : ${studentList[0].member_phone}</h4>

										<!-- page start-->
										<div class="tab-pane" id="chartjs">
											<div class="row mt">
												<%--각 시험 성적 바 차트 --%>
												<div class="col-lg-6">
													<div class="content-panel">
														<h4>
															<i class="fa fa-angle-right"></i> 각 시험 성적
														</h4>
														<div class="panel-body text-center">
															<canvas id="bar1" height="300" width="400"></canvas>
														</div>
													</div>
												</div>
											
											<%-- 반/학생 평균 선 차트 --%>
											<div class="col-lg-6">
												<div class="content-panel">
													<h4>
														<i class="fa fa-angle-right"></i> 반/학생 평균 비교
													</h4>
													<div class="panel-body text-center">
														<canvas id="line1" height="300" width="400"></canvas>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%-- 선택 학생 정보 영역 끝 --%>
								
								
								</div><!-- row -->
							</div><!-- studentInfo -->
							<%-- 학생 정보 탭 끝 --%>
							
							<%-- 학생 개인 성적확인 탭 시작 --%>
						<div id="studentChart" class="tab-pane">
							<div class="row">
								<div class="col-lg-2">
									<section class="panel">
										<div class="panel-body">
											<table id="studentList" class="table table-hover">
												<h4 id="tab2_className">${studentList[0].class_name}</h4>
									                <thead>
									                  <tr>
									                    <th><i class="fa fa-bullhorn"></i> 학생목록</th>
									                  </tr>
									                </thead>
									                <tbody>									                
												<c:forEach items="${studentList}" var="studentList">												
								                  <tr>
								                    <td id="${studentList.member_id}" class="tab2studentListMembers">
								                      <img src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
															class="img-circle" width="25"> ${studentList.member_name}
								                    </td>
								                   </tr>												
												</c:forEach>
											</tbody>
											</table>
										</div>
									</section>
								</div>
								<div class="col-lg-10 unread">
									<section class="panel">
										<header class="panel-heading wht-bg">
											<h4 class="gen-case">
												<span id="tab2_studentName">${studentList[0].member_name}</span>
												<form action="#" class="pull-right mail-src-position">
													<div class="input-append">
														<input type="text" id="searchExamValue"class="form-control "
															placeholder="Search Test" onkeydown="searchStudentExamList()">
													</div>
												</form>
											</h4>
										</header>
										<div class="panel-body minimal">
											<div class="table-inbox-wrap">
												<table class="table table-inbox table-hover">
													<tbody id="studentExamTable">
														<c:forEach items="${studentExamScoreInfo}" var="studentExamScoreInfo">
														<tr class="unread">															
															<td class="view-message  dont-show"><img
																	src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																	class="img-thumbnail" width="150"></td>
															<td class="view-message "><h3 class="tab2_examPaper">${studentExamScoreInfo.exam_info_name}</h3>
																	<p><c:forEach items="${studentExamScoreInfo.smCtgrName}" var="test">${test}&nbsp;&nbsp;</c:forEach></p></td>
															<td class="view-message  text-right"><p class="tab2_examDate">시험 날짜 :
																	${studentExamScoreInfo.exam_info_date }</p>
																<p class="tab2_examTime">
																시험 시간 : ${studentExamScoreInfo.exam_info_start}~${studentExamScoreInfo.exam_info_end }</p>
																<p>(${studentExamScoreInfo.exam_info_time })</p></td>
															<td class="view-message  inbox-small-cells">
																<button type="button" class="btn btn-round btn-info">성적확인</button>
																<button type="button" class="btn btn-round btn-danger">삭제</button>
															</td>
														</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<div class="mail-option">
												<ul class="unstyled inbox-pagination">
													<li><span>1-50 of 99</span></li>
													<li><a class="np-btn" href="#"><i
															class="fa fa-angle-left  pagination-left"></i></a></li>
													<li><a class="np-btn" href="#"><i
															class="fa fa-angle-right pagination-right"></i></a></li>
												</ul>
											</div>
										</div>
									</section>
								</div>
							</div>
							<!-- /row -->
						</div>
						<%-- 학생 개인 성적 탭 끝 --%>
						
						<%-- 클래스 통계 탭 시작 --%>
						<div id="classChart" class="tab-pane">
							<div class="row">
								<%-- 클래스 학생 목록 시작--%>
								<div class="col-lg-2">
									<section class="panel">
										<div class="panel-body">
											<table id="studentList" class="table table-hover">
									                <thead>
									                  <tr>
									                    <th><i class="fa fa-bullhorn"></i> 학생목록</th>
									                  </tr>
									                </thead>
									                <tbody>									                
												<c:forEach items="${studentList}" var="studentList">												
								                  <tr>
								                    <td id="${studentList.member_id}" class="studentListMembers">
								                      <img src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
															class="img-circle" width="25"> ${studentList.member_name}
								                    </td>
								                   </tr>												
												</c:forEach>
											</tbody>
											</table>
										</div>
									</section>
								</div>
								<%-- 클래스 학생 목록 끝 --%>
								
								<%-- 클래스 학생 표/차트 시작 --%>
								<div class="col-lg-10">
									<h3>${studentList[0].class_name}</h3>
									<!-- page start-->
									<div class="tab-pane" id="chartjs">
										<div class="row mt">
											<%-- 반평균 막대 차트 --%>
											<div class="col-lg-6">
												<div class="content-panel pnHeight">
													<h4>
														<i class="fa fa-angle-right"></i> 각 시험 평균
													</h4>
													<div class="panel-body text-center">
														<canvas id="bar2" height="240"></canvas>
													</div>
												</div>
											</div>
											<%-- 반 등수 표 --%>
											<div class="col-lg-6">
												<div class="content-panel pnHeight">
													<h4>
														<i class="fa fa-angle-right"></i> 반 등수
													</h4>
													<div class="btn-group pull-right">
														<select id="searchExam" class="form-control searchControl"
																name="searchExam">
															<option value="" >시험 목록</option>		
															<c:forEach items="${classChart}" var="classChart">
																<option value="exam_info_name">${classChart.exam_info_name}</option>		
															</c:forEach>
														</select>
													</div>
													<br><br>
													<div class="panel-body text-center">
														<div class="table-inbox-wrap">
															<table id="classRankTable"
																class="table table-bordered table-striped table-condensed">
																<thead>
																	<tr>
																		<th class="member_name">이름</th>									
																		<th class="score_chart_rank">순위</th>
																	</tr>
																</thead>
																<tbody id="classRankView">
																	<c:forEach items="${classRank}" var="classRank">
																	
																	<tr>
																		<td id="member_name" class="member_name">${classRank.member_name}</td>																		
																		<td id="score_chart_rank" class="score_chart_rank">${classRank.score_chart_rank}</td>
																	
																	</tr>
																	
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row mt">
											<%-- 점수별 학생 분포 차트 --%>
											<div class="col-lg-12">
												<div class="content-panel">
													<h4>
														<i class="fa fa-angle-right"></i> 점수별 학생 분포
													</h4>
													<div class="btn-group pull-right">
														<select id="searchExam2" class="form-control searchControl"
																name="searchExam2">
															<option value="">시험 목록</option>		
															<c:forEach items="${classChart}" var="classChart">
																<option value="exam_info_name">${classChart.exam_info_name}</option>		
															</c:forEach>
														</select>
													</div>
													<div class="panel-body text-center">
														<canvas id="line2" height=75%></canvas>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row mt">
											<%-- 학생별 성적표 시작--%>
											<div class="col-lg-12">
												<div class="content-panel">
													<h4>
														<i class="fa fa-angle-right"></i> 학생별 성적표
													</h4>
													<div class="panel-body text-center">
														<table id="studentPerGrade" class="display"
															style="width: 100%">
															<thead>
																<tr>
																	<td>학생 이름</td>
																	<td>Java</td>
																	<td>Oracle</td>
																	<td>Python</td>
																	<td>평균</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>김하나</td>
																	<td>56</td>
																	<td>76</td>
																	<td>56</td>
																	<td>89</td>
																</tr>
																<tr>
																	<td>방민지</td>
																	<td>89</td>
																	<td>76</td>
																	<td>89</td>
																	<td>89</td>
																</tr>
																<tr>
																	<td>서정원</td>
																	<td>89</td>
																	<td>78</td>
																	<td>78</td>
																	<td>89</td>
																</tr>
															</tbody>
														</table>

													</div>
												</div>
											</div>
											<%-- 학생별 성적표 끝--%>
										</div>
									</div>
								</div>
								<%-- 클래스 학생 표/차트 끝 --%>
							</div>
							<!-- /row -->
							</div>
							<%-- 클래스 통계 탭 끝 --%>
						
						</div> <!-- tab-content -->
					</div> <!-- panel-body -->
				</div><!-- /row content-panel-->
			</div><!-- /col-lg-12 -->
		</div><!-- /row mt -->
	</section><!-- /wrapper -->
</section><!-- /MAIN CONTENT -->


<%--ChartJS--%>
<%--ChartJS CDN--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%--ChartJS 차트 경로--%>
<script src="${pageContext.request.contextPath}/lib/onet-js/studentInfo.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	//차트 데이터 담을 배열
	var chartStudentDatas = new Array();
	var chartClassDatas = new Array();
	var chartLabels = new Array();	
	//학생목록 배열에 jstl값 담기
	<c:forEach items="${studentChart}" var="studentChart">
		chartStudentDatas.push("${studentChart.score_chart_score}");
	</c:forEach>
	<c:forEach items="${classChart}" var="classChart">
		chartClassDatas.push("${classChart.class_chart_avg}");
		chartLabels.push("${classChart.exam_info_name}");
	</c:forEach>
	
	//첫 화면 차트	
	functionChart();
	//두번째 화면 차트
	functionChart2();
	//학생&성적관리 학생목록 데이터 담은 배열
	var studentArr= new Array();
	//학생목록 배열에 jstl값 담기		
	<c:forEach items="${studentList}" var="studentList">
		var json=new Object();
		json.member_id="${studentList.member_id}";
		json.member_email="${studentList.member_email}";
		json.member_name="${studentList.member_name}";
		json.member_phone="${studentList.member_phone}";
		json.class_name="${studentList.class_name}";
		studentArr.push(json);
	</c:forEach>
	
	//학생 목록 선택 이벤트-tab1
	$(".studentListMembers").click(function(){		
		//가져온 차트데이터 담을 배열(학생점수, 반평균, 과목)	
		chartStudentDatas = [];
		chartClassDatas = [];
		chartLabels = [];		
		//클릭한 목록의 학생이름 가져오기 & 출력
		var memberName=$(this).text().trim();
		console.log("tab1:"+memberName);
		$("#studentListName").text(memberName);
		//학생 목록의 인덱스 가져오기
		var memberIndex=$(".studentListMembers").index(this);
		//선택한 학생의 이메일과 핸드폰 값 가져와 출력하기
		$("#studentListEmail").text("이메일 : "+studentArr[memberIndex].member_email);
		$("#studentListPhone").text("핸드폰 : "+studentArr[memberIndex].member_phone);
		//ajax 차트 요청할 parameter
		var memberId=studentArr[memberIndex].member_id;
		var className=studentArr[memberIndex].class_name;
		//비동기 실행
		$.ajax({
			type:"post",
			url:"studentChartInfo.do",
			data:{"member_id":memberId,
				"class_name":className
				},
			datatype:"json",
			success:function(data, status){
				//넘어온 map객체의 학생차트정보
				$(data.studentName).each(function(index, element){					
					chartStudentDatas.push(element.score_chart_score);
				});
				//넘어온 map객체의 클래스차트정보
				$(data.className).each(function(index, element){
					chartLabels.push(element.exam_info_name);
					chartClassDatas.push(element.class_chart_avg);					
				});
				functionChart();
				functionChart2();
			},
			error:function(error, status){
				console.log("실패:"+status);
			}
		});		
	});
	//학생목록 이벤트 종료
	
	//학생 목록 선택 이벤트-tab2
	$(".tab2studentListMembers").click(function(){
		$("#searchExamValue").val("");
		//클릭한 목록의 학생이름 가져오기 & 출력
		var memberName=$(this).text().trim();
		var className=$("#tab2_className").text().trim();
		$("#tab2_studentName").text(memberName);
		//학생 목록의 인덱스 가져오기
		var memberIndex=$(".tab2studentListMembers").index(this);
		//ajax 시험 정보 요청할 parameter
		var memberId=studentArr[memberIndex].member_id;
		var className=studentArr[memberIndex].class_name;
		console.log(memberId);
		console.log(className);
		//비동기 실행
		$.ajax({
			type:"post",
			url:"studentExamScoreInfo.do",
			data:{"member_id":memberId,
				"class_name":className
				},
			datatype:"json",
			success:function(data, status){
				console.log("성공");
				console.log(data);
				var studentExamScoreSrc = "";				
				$("#studentExamTable").empty();
				$(data).each(function(index, element){
					var smCtgr="";
					$(element.smCtgrName).each(function(index, name){ //소분류 추출
						smCtgr += name+'&nbsp;&nbsp;';
					});
					console.log("소분류:"+smCtgr);
					studentExamScoreSrc += '<tr class="unread"><td class="view-message">';
					studentExamScoreSrc += '<img src="${pageContext.request.contextPath}/img/friends/fr-05.jpg" class="img-thumbnail" width="150"></td>';
					studentExamScoreSrc += '<td class="view-message "><h3 class="tab2_examPaper">'+element.exam_info_name+'</h3>';
					studentExamScoreSrc += '<p>'+smCtgr+'</p></td>';
					studentExamScoreSrc += '<td class="view-message  text-right"><p class="tab2_examDate">시험 날짜 : '+element.exam_info_date+'</p>';
					studentExamScoreSrc += '<p class="tab2_examTime">시험 시간 : '+element.exam_info_start+'~'+element.exam_info_end+'</p><p>('+element.exam_info_time+')</p></td>';
					studentExamScoreSrc += '<td class="view-message  inbox-small-cells">';
					studentExamScoreSrc += '<button type="button" class="btn btn-round btn-info">성적확인</button>';
					studentExamScoreSrc += '<button type="button" class="btn btn-round btn-danger">삭제</button></td></tr>';					
				});
				$("#studentExamTable").append(studentExamScoreSrc);			
			},
			error:function(error, status){
				console.log("실패:"+status);
			}
		});		
	});
	//학생목록 이벤트 종료
	function searchStudentExamList();
	function searchStudentExamList(){
		
	}
	
	//첫화면 차트
	function functionChart(){
		//각 시험 성적 바 차트 시작				
		var ctx = document.getElementById('bar1').getContext('2d');
		var myBarChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		      labels: chartLabels,
		      datasets: [
		        {
		          label: "반 평균",
		          backgroundColor: 'rgb(255, 99, 132)',
		          borderColor: 'rgb(255, 99, 132)',
		          data: chartClassDatas
		        }
		      ]
		    },
		    options:{
		      layout: {
		          padding: {
		              left: 10,
		              right: 10,
		              top: 10,
		              bottom: 10
		          }
		      },
		      scales: {
		        yAxes: [{
		         ticks: {
		             max: 100,
		             min: 0,
		             stepSize: 10
		         }
		     }]
		       }
		    }
		});
		//각 시험 성적 바 차트 끝
		
		//반/학생 평균 선 차트 시작
		var ctx = document.getElementById('line1').getContext('2d');
		var chart = new Chart(ctx, {
		  // The type of chart we want to create
		  type: 'line',
		  // The data for our dataset
		  data: {
		      labels: chartLabels,
		      datasets: [
		        {
		          label: "반 평균 성적",
		          backgroundColor: 'rgb(255, 99, 132)',
		          borderColor: 'rgb(255, 99, 132)',
		          fill : false,
		          lineTension : 0,
		          data: chartClassDatas,
		      },
		      {
		          label: "학생 성적",
		          backgroundColor: 'rgb(122, 99, 132)',
		          borderColor: 'rgb(122, 99, 132)',
		          fill : false,
		          lineTension : 0,
		          data: chartStudentDatas,
		        }
		      ]
		    },
		    options: {
		        scale: {
		            ticks: {
		              beginAtZero:true,
		                min:0,
		                max:100
		            }
		        },
		        layout: {
		            padding: {
		                left: 10,
		                right: 10,
		                top: 10,
		                bottom: 10
		            }
		        },
		        scales: {
		          yAxes: [{
		           ticks: {
		               max: 100,
		               min: 0,
		               stepSize: 10
		           }
		       }]
		         }
		    }
		});
		//반/학생 평균 선 차트 끝
	}
	//첫화면 차트
	
	//클래스 통계화면 첫 차트 시작
	function functionChart2(){
		var ctx = document.getElementById('bar2').getContext('2d');
		var myBarChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: chartLabels,
				datasets: [
					{
						label: "각 시험 평균",
						backgroundColor: 'rgb(255, 99, 132)',
						borderColor: 'rgb(255, 99, 132)',
						data: chartClassDatas,
					}
					]
			},
			options:{
				layout: {
					padding: {
						left: 10,
						right: 10,
						top: 10,
						bottom: 10
					}
				},
				scales: {
					yAxes: [{
						ticks: {
							max: 100,
							min: 0,
							stepSize: 10
						}
					}]
				}
			}
		});
	} //클래스 통계화면 첫 차트 끝
	
	
	// 반 등수 - 시험목록 선택 시 해당 시험 등수 시작 
	var index;

	// 시험문제 목록 선택 시작
	$("#searchExam").change(function() {
		var html = "";
		$("#searchExam option:selected").each(function () {
			index = $("#searchExam option").index($("#searchExam option:selected"));
			var examInfoName=$("#searchExam option:selected").text();
			
			console.log("선택된 시험문제 번호: " + index);
			console.log("선택된 시험문제 : " + examInfoName);
			
		//비동기 실행
		$.ajax({
			type:"post",
			url:"classRank.do",
			data:{"exam_info_name":examInfoName
				  
				},
			datatype:"json",
			success:function(data){
				if(data.length!=0){
					$(data).each(function(index, element){
						console.log(index + " : " + element.exam_info_name);
						html += "<tr><td id='member_name' class='member_name'>" + element.member_name+"</td>";																		
						html +=	"<td id='score_chart_rank' class='score_chart_rank'>" + element.score_chart_rank+"</td></tr>";
					
						$("#classRankView").empty().append(html);
					});
				} else{
					swal("Error!", "응시한 학생이 없습니다.", "error");
				}							
			},
			error:function(error){
				console.log("실패:"+status);
			}
		});	
		});
	});
})
</script>