/*
	@JSP:teacherStudentInfo.js
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 & 성적 관리 js(스토리보드 20 of 41), chartjs, datatable
*/

//ChartJS

// 각 시험평균 막대 차트 시작
$(document).ready(function(){


//점수별 학생 분포 차트 시작(표준편차)
var index;

// 시험문제 목록 선택 시작
$("#searchExam2").change(function(){
	$("#searchExam2 option:selected").each(function(){
		index = $("#searchExam2 option").index($("#searchExam2 option:selected"));
		var examInfoName=$("#searchExam2 option:selected").text();
		
		console.log("선택된 시험문제 번호: " + index);
		console.log("선택된 시험문제 : " + examInfoName);
		
		// 비동기 실행
		$.ajax({
			type:"post",
			url:"studentStdChart.do",
			data:{"exam_info_name":examInfoName},
			dataType:"json",
			success:function(data){
				console.log("성공" + data);
				console.log(JSON.stringify(data));
			},
			error:function(error){
				console.log("실패..." +status);
			}
			
		});
	});
});
	})


//점수별 학생 분포 차트 끝