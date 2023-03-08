//첫번째 막대바 시작
var bardata = [10, 8, 5, 7, 6];
		
// 캔버스 요소
var canvas = document.getElementById("myBarChart");
var ctx = canvas.getContext("2d");

// 그래프 그리기
var chartHeight = canvas.height - 20;
var chartWidth = canvas.width - 20;
var barWidth = chartWidth / bardata.length;
var barMargin = 10;

ctx.fillStyle = "#009688"; // 막대 색상
for (var i = 0; i < bardata.length; i++) {
	var barHeight = (bardata[i] / Math.max(...bardata)) * chartHeight;
	var x = i * (barWidth + barMargin) + 10;
	var y = canvas.height - barHeight - 10;
	ctx.fillRect(x, y, barWidth, barHeight);
}
//막대바 끝

//
