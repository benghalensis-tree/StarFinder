window.onload = function(){
  var ctx = document.getElementById("myChart");
  var myChart = new Chart(ctx, {
    type: 'radar',
    data: {
      labels: ["空の明るさ", "透明度", "空の広さ", "アクセス", "便利さ"],
      datasets: [{
        label: 'ユーザーの評価',
        backgroundColor: "rgba(0,0,80,0.4)",
        borderColor: "rgba(0,0,80,1)",
        data: gon.rating_data
      }]
    }
  });
  };