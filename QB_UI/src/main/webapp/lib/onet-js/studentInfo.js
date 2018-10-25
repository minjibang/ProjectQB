/*
	@JSP:teacherStudentInfo.js
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 & 성적 관리 js(스토리보드 20 of 41), chartjs, datatable
*/

//ChartJS

// 각 시험평균 막대 차트 시작
$(document).ready(function(){

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