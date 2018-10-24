/*
	@JSP:teacherStudentInfo.js
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 & 성적 관리 js(스토리보드 20 of 41), chartjs, datatable
*/

//ChartJS




// 각 시험평균 막대 차트 시작
$(document).ready(function(){
	// 차트 데이터를 담을 배열
	/*var chartClassDatas = new Array();
	var chartLabels = new Array();
	
	
	
		chartClassDatas = [];
		chartLabels = [];
		
		$.ajax({
			type:"post",
			url:"studentChartInfo.do",
			data:{"chartClassDatas":chartClassDatas,
				  "chartLabels":chartLabels
			},
		    dataType:"json",
		    success:function(data, status){
		    	$(data).each(function(index, element){
		    		chartLabels.push(element.exam_info_name);
		    		chartClassDatas.push(element.class_chart_avg);
		    	});
		    	functionChart();
		    },
		    error:function(error, status){
		    	console.log("실패했음 :" + status);
		    }
		});

	function functionChart(){	
	var ctx = document.getElementById('bar2').getContext('2d');
	var myBarChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ["테스트1", "테스트2", "테스트3"],
			datasets: [
				{
					label: "각 시험 평균",
					backgroundColor: 'rgb(255, 99, 132)',
					borderColor: 'rgb(255, 99, 132)',
					data: [40, 60, 70],
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
	});*/

//반 평균 막대 차트 끝

//점수별 학생 분포 차트
var ctx = document.getElementById('line2').getContext('2d');
var myBarChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["10", "20", "30", "40", "50", "60", "70", "80", "90", "100"],
      datasets: [
        {
          label: "JAVA",
          backgroundColor: 'rgb(196, 128, 96)',
          borderColor: 'rgb(255, 99, 132)',
          fill : false,
          data: [0, 0, 2, 3, 6, 5, 4, 3, 1, 0],
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
      }
    }
});

	})


//점수별 학생 분포 차트 끝

//DataTable - 있으면 alert 출력 이유를 모르겠다
	/*$(document).ready(function() {
		$("#studentPerGrade").DataTable();
	});*/