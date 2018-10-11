/*
	@JSP:teacherStudentInfo.js
	@DATE:2018-10-11
	@Author:양회준
	@Desc:학생 & 성적 관리 js(스토리보드 20 of 41), chartjs, datatable
*/

//ChartJS
var ctx = document.getElementById('bar1').getContext('2d');
var myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["Java", "Oracle", "MySQL", "Web기초", "Jqery&Ajax", "Spring", "MyBatis"],
      datasets: [
        {
          label: "반 평균",
          backgroundColor: 'rgb(255, 99, 132)',
          borderColor: 'rgb(255, 99, 132)',
          data: [40, 30, 85, 72, 10, 30, 45],
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

var ctx = document.getElementById('line1').getContext('2d');
var chart = new Chart(ctx, {
  // The type of chart we want to create
  type: 'line',
  // The data for our dataset
  data: {
      labels: ["Java", "Oracle", "MySQL", "Web기초", "Jqery&Ajax", "Spring", "MyBatis"],
      datasets: [
        {
          label: "반 평균 성적",
          backgroundColor: 'rgb(255, 99, 132)',
          borderColor: 'rgb(255, 99, 132)',
          fill : false,
          lineTension : 0,
          data: [30, 10, 5, 2, 20, 30, 45],
      },
      {
          label: "학생 성적",
          backgroundColor: 'rgb(122, 99, 132)',
          borderColor: 'rgb(122, 99, 132)',
          fill : false,
          lineTension : 0,
          data: [20, 10, 25, 32, 44, 12, 77],
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

var ctx = document.getElementById('bar2').getContext('2d');
var myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["Java", "Oracle", "MySQL", "Web기초", "Jqery&Ajax", "Spring", "MyBatis"],
      datasets: [
        {
          label: "각 시험 평균",
          backgroundColor: 'rgb(255, 99, 132)',
          borderColor: 'rgb(255, 99, 132)',
          data: [40, 30, 85, 72, 10, 30, 45],
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

//DataTable - 있으면 alert 출력 이유를 모르겠다
	/*$(document).ready(function() {
		$("#studentPerGrade").DataTable();
	});*/