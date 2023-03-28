Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

$(document).ready(function() {
	var ctx1 = document.getElementById("myBarChartToday");
	$.ajax({
		url: "/admin/StatisticsDay", //데이터를 가져올 URL
		type: "GET",
		dataType: "json",
		success: function(data) {
			var day = [];//label
			var visitor = [];
				
			$.each(data, function(index, value) {
				day.push(value.day);
				visitor.push(value.visitors);
			});
			
			var myLineChart1 = new Chart(ctx1, {
				type: 'bar',
				data: {
					labels: day,
					datasets: [{
						label: "방문자",
						backgroundColor: "rgba(2,117,216,1)",
						borderColor: "rgba(2,117,216,1)",
						data: visitor
					}],
				},
				options: {
					scales: {
						xAxes: [{
							time: {
								unit: 'day'
	 						},
							gridLines: {
								display: false
							},
							ticks: {
							}
						}],
						yAxes: [{
							ticks: {
								beginAtZero: true,
								min: 0,
								max: 5,
								stepSize: 1
							},
							gridLines: {
								display: true
							}
						}],
					},
					legend: {
						display: false
					}
				}
			});
		},
		error: function(xhr, status, error) {
		//에러처리
		}
	});
});