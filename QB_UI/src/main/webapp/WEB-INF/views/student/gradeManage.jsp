<%--
	@JSP:studentGradeManage.jsp
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 - 성적관리 (스토리보드 37 of 41)	
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/GradeManage.css"
	rel="stylesheet">

<!--메인 컨텐츠 시작-->
<section id="main-content">
	<section class="wrapper">
	
		<div class="row mt">
			<!-- tab test -->
			<div class="row">
			
			
				<div class="col-md-12">
					<div class="content-panel">
						<div class="panel-body">
							<header class="panel-heading wht-bg">
								<h4 class="gen-case">
									<i class="fa fa-angle-right"></i>&nbsp;&nbsp;성적 관리
								</h4>
								
								<c:forEach items="${studentId}" var="studentId">
									<input type="hidden" name="member_id" id="studentId" value="${studentId}" >
								</c:forEach>
			
							</header>
							<!-- page start-->
							<div id="chartjs">
								<div class="row mt">
									<%-- 각 시험 성적 막대차트 시작--%>
									<div class="col-lg-6">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 각 시험 성적
											</h4>
											<div class="panel-body text-center">
												<canvas id="bar1" height="300" width="400"></canvas>
											</div>
										</div>
									</div>
									<%-- 각 시험 성적 막대차트 끝--%>
									<%-- 반/학생 평균 비교 선 차트 시작--%>
									<div class="col-lg-6">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 반/학생 평균 비교
											</h4>
											<div class="panel-body text-center">
												<canvas id="line1" height="300" width="400"></canvas>
											</div>
										</div>										
									</div>
									<%-- 반/학생 평균 비교 선 차트 끝--%>
									<%-- 내 등수 보기 패널 시작 --%>
									<div class="col-lg-12">
										<div class="content-panel-lightgray">
											<h4>
												<i class="fa fa-angle-right"></i> 나의 등수 보기
											</h4>
											<div class="btn-group pull-right">
												<select id="searchExam" class="form-control searchControl"
													name="searchExam">
												<option value="" >시험 목록</option>		
												<c:forEach items="${classChart}" var="classChart">
													<option value="${classChart.exam_info_num}">${classChart.exam_info_name}</option>		
												</c:forEach>
												</select>
											</div>
											
											<div class="panel-body text-center">
														<div class="table-inbox-wrap">
															
														</div>
													</div>
											
											<div class="panel-body">
												<h3>
											
													<b id="myRank">등수 확인을 원하는 시험을 선택해주세요.</b>
												
												</h3>
											
											</div>
										</div>
									</div>
									<%-- 내 등수 보기 패널 끝 --%>									
								</div>
							</div>
						</div>
					</div>
					<!-- tab test -->
				</div>
			</div>
		</div>
		</div>
		
	</section>
	<!-- /wrapper -->
</section>
<!--메인 컨텐츠 끝-->

<%--ChartJS--%>
<%-- ChartJS CDN --%>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%-- --%>
<script	src="${pageContext.request.contextPath}/lib/onet-js/GradeManage.js"	type="text/javascript"></script>

<script>
$(document).ready(function(){
	//차트 데이터 담을 배열
	var chartStudentDatas = new Array();
	var chartClassDatas = new Array();
	var chartLabels = new Array();
	var chartMyRank = new Array();

	//학생목록 배열에 jstl값 담기
	<c:forEach items="${studentChart}" var="studentChart">
		chartStudentDatas.push("${studentChart.score_chart_score}");
	</c:forEach>
	<c:forEach items="${classChart}" var="classChart">
		chartClassDatas.push("${classChart.class_chart_avg}");
		chartLabels.push("${classChart.exam_info_name}");
	</c:forEach>
	
	<c:forEach items="${studentChart}" var="studentChart">
	chartMyRank.push("${studentChart.member_id}");
	chartMyRank.push("${studentChart.exam_info_num}");
	chartMyRank.push("${studentChart.score_chart_rank}");
	</c:forEach>
	
	console.log("1:" + chartStudentDatas);
	console.log("2:" + chartClassDatas);
	console.log("3:" + chartLabels);
	console.log("4:" + chartMyRank);
	
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
	var memberId=studentArr[0].member_id;
	var className=studentArr[0].class_name;
	
	//첫 화면 차트	
	functionChart();

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
		          label: "내 성적",
		          backgroundColor: 'rgb(255, 99, 132)',
		          borderColor: 'rgb(255, 99, 132)',
		          data: chartStudentDatas,
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
		          label: "내 성적",
		          backgroundColor: 'rgb(255, 99, 132)',
		          borderColor: 'rgb(255, 99, 132)',
		          fill : false,
		          lineTension : 0,
		          data: chartStudentDatas,
		      },
		      {
		          label: "반 평균 성적",
		          backgroundColor: 'rgb(122, 99, 132)',
		          borderColor: 'rgb(122, 99, 132)',
		          fill : false,
		          lineTension : 0,
		          data: chartClassDatas,
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
	
	
	// 반 등수 - 시험목록 선택 시 해당 시험 등수 시작 
	var index;

	// 시험문제 목록 선택 시작
	$("#searchExam").change(function() {
		var html = "";
		$("#searchExam option:selected").each(function () {
			index = $("#searchExam option").index($("#searchExam option:selected"));
			var examInfoNum=$("#searchExam option:selected").val();
			var examInfoName=$("#searchExam option:selected").text();
			var member_id=$("#studentId").val();
			console.log("index:" + index);
			console.log("학생아이디: " + member_id);
			console.log("선택된 시험번호 : " + examInfoNum);
			console.log("선택된 시험이름 : " + examInfoName);
		//비동기 실행
		
		$.ajax({
			type:"post",
			url:"myRank.do",
			data:{ 
				"exam_info_num" : examInfoNum,
				"member_id" : member_id
				},
			datatype:"json",
			success:function(data){
				if(data.length!=0){
					$(data).each(function(index, element){
						html += examInfoName + "&nbsp;&nbsp; 시험에서 &nbsp;&nbsp;"+ element.member_name+"&nbsp;&nbsp; 님의 등수는 &nbsp; &nbsp;";																		
						html += element.score_chart_rank +"&nbsp; 등 입니다.";
					
						$("#myRank").empty().append(html);
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