window.onload = function(){
  var ctx = document.getElementById("myChart");
  var myChart = new Chart(ctx, {
    type: 'radar',
    data: {
      labels: ["空の明るさ", "透明度", "空の広さ", "アクセス", "便利さ"],
      datasets: [{
        backgroundColor: "rgba(67, 133, 215, 0.5)",
        borderColor: "rgba(67, 133, 215, 1)",
        data: gon.rating_data
      }]
    },
    options: {
      responsive: false,
      plugins: {
        legend: {
          display: false,
        },
      },
      scales: {
        r: {
          min: 0,
          max: 5,
          backgroundColor: 'snow',
          grid: {
            color: 'blue',
          },
          angleLines: {
            color: 'blue',
          },
          pointLabels: {
            color: 'white',
          },
        },
      },
    }, 
  });
  };