<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link
	href="${pageContext.request.contextPath}/css/studentPastExam.css"
	rel="stylesheet">
<%-- <script
	src="${pageContext.request.contextPath}/lib/onet-js/pastExam.js"></script> --%> <!-- 일단은 주석처리, 나중에 script 파일로 빼기 -->
<script>
	$(document).ready(function(){
		
		$('#search_btn').click(function(){
			$.ajax({
				url : 'searchPastExamKeyword.do',
				type : 'get',
				data : { 'keyword': $('#search_input').val()}, 
				success : function(data) {	
					if(data.length == 0) {
						$('#last_exam_table').empty();
						var html = "";
						html += '<h3>검색 결과가 없습니다. </h3>';
						$('#last_exam_table').append(html);
						
						return false;
						
					} else {
						$('#last_exam_table').empty();
						$.each(data, function(index, entry){	
							var html = "";
							html += '<tr class="exam_line"><td class="pastExamTd">';
							html += '<h3>' + data[index].exam_info_name + '</h3>';
							html += '<span>'+ data[index].exam_info_desc +'</span></td><td class="pastExamTd"><div>시험 날짜 : ';
							html += data[index].exam_info_date;
							html += '</div><div>시험 시간 : ';
							html += data[index].exam_info_start +' ~ '+ data[index].exam_info_end;
							html += '</div><div>[' + data[index].exam_info_time + ']</div></td>';
							html += '<td class="btn_td">'; 
							html += '<button class="btn btn-theme" id="pastExamBtn" value="'+data[index].exam_info_num+'">다시 보기</button>';
							html += '</td></tr>';
							
							$('#last_exam_table').append(html);
						});  // foreach 반복문 끝	
					}
				} 
			});
		});  // keyword 검색 끝 
		
		$(document).on('click', '#pastExamBtn', function(){	//	ajax로 가져온 버튼이 안 먹을 때 click 이벤트
			
			var popUrl = "pastExamPaper.do?exam_info_num=" + $(this).val();
			var popOption = "width=1000px, resizable=no, location=no, left=50px, top=100px";
	
			window.open(popUrl, "지난 시험보기",popOption);
			
		});
		
	});	//	document.ready 끝 
</script> 

<!-- 학생 - 지난 시험 보기-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
		<div class="col-lg-12">
			<div class="row content-panel">
				<!-- /panel-heading -->
				<div class="panel-body">
					<div id="overview" class="all_class_div">
						<table class="title_table">
							<tr>
								<td class="title_table_fst_td">
									<p id="student_name">${member_name}</p>  
								</td>
							</tr>
							<tr>
								<td>
								<div class="search_box">
										<input type="text" class="form-control" id="search_input" placeholder="키워드를 입력하세요.">
										<button class="btn btn-theme" id="search_btn">검색</button>
									</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="last_exam_div">
							<table id="last_exam_table">
								<!-- 하나의 시험정보 시작 -->
								<c:forEach var="examInfo" items="${examInfoList}">
									<tr class="exam_line">
										<td class="pastExamTd">
											<h3>${examInfo.exam_info_name}</h3> 
											<span>${examInfo.exam_info_desc}</span>
										</td>
										<td class="pastExamTd">
											<div>시험 날짜 : ${examInfo.exam_info_date}</div>
											<div>시험 시간 : ${examInfo.exam_info_start} ~ ${examInfo.exam_info_end}</div>
											<div>[${examInfo.exam_info_time}]</div>
										</td>
										<td class="btn_td">
											<button class="btn btn-theme" id="pastExamBtn" value="${examInfo.exam_info_num}">다시 보기</button>
										</td>
									</tr>
								</c:forEach>
								<!-- 하나의 시험정보 끝 -->
							</table>
						</div>
					</div>
					<!-- /tab-content -->
				</div>
				<!-- /panel-body -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<!-- /col-lg-12 -->
		</div>
	</section>
	<!-- /wrapper -->
</section>