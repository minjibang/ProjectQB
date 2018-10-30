/*var ctx = document.getElementById('studentBar').getContext('2d');
var myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["Java", "Oracle", "MySQL", "Web기초", "Jqery&Ajax", "Spring", "MyBatis"],
      datasets: [
        {
          label: "내 성적",
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

var ctx = document.getElementById('studentLine').getContext('2d');
var chart = new Chart(ctx, {
  // The type of chart we want to create
  type: 'line',
  // The data for our dataset
  data: {
      labels: ["Java", "Oracle", "MySQL", "Web기초", "Jqery&Ajax", "Spring", "MyBatis"],
      datasets: [
        {
          label: "내 성적",
          backgroundColor: 'rgb(255, 99, 132)',
          borderColor: 'rgb(255, 99, 132)',
          fill : false,
          lineTension : 0,
          data: [30, 10, 5, 2, 20, 30, 45],
      },
      {
          label: "반 평균 성적",
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
});*/