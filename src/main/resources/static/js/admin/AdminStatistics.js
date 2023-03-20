Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

$(document).ready(function() {
	var ctx1 = document.getElementById("myBarChart1");
	$.ajax({
		url: "/admin/visitor", // 데이터를 가져올 URL
		type: "GET",
		dataType: "json",
		success: function(data) {
			var date = [];//label
			var visitor = [];
				
				$.each(data, function(index, value) {
					date.push(value.date);
					visitor.push(value.visitor_count);
				});
				
				var myLineChart1 = new Chart(ctx1, {
					type: 'bar',
					data: {
						labels: date,
						datasets: [{
							label: "date",
							backgroundColor: "rgba(2,117,216,1)",
							borderColor: "rgba(2,117,216,1)",
							data: visitor,
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
				
			/*};*/
		},
		error: function(xhr, status, error) {
		//에러처리
		}
	});
});