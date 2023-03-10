// 바 데이터
var bardata1 = [10, 8, 5, 7, 6, 11, 20];
var bardata2 = [3, 5, 2, 8, 10];
var bardata3 = [6, 2, 7, 9, 4];
var bardata4 = [8, 4, 3, 6, 9];

// 각각의 캔버스 요소
var canvas1 = document.getElementById("myBarChart1");
var canvas2 = document.getElementById("myBarChart2");
var canvas3 = document.getElementById("myBarChart3");
var canvas4 = document.getElementById("myBarChart4");

// 각각의 그래프 그리기
var chartHeight1 = canvas1.height - 20;
var chartWidth1 = canvas1.width / bardata1.length;
var barWidth1 = chartWidth1 / bardata1.length;
var barMargin1 = 10;

var chartHeight2 = canvas2.height - 20;
var chartWidth2 = canvas2.width / bardata2.length;
var barWidth2 = chartWidth2 / bardata2.length;
var barMargin2 = 10;

var chartHeight3 = canvas3.height - 20;
var chartWidth3 = canvas3.width / bardata3.length;
var barWidth3 = chartWidth3 / bardata3.length;
var barMargin3 = 10;

var chartHeight4 = canvas4.height - 20;
var chartWidth4 = canvas4.width / bardata4.length;
var barWidth4 = chartWidth4 / bardata4.length;
var barMargin4 = 10;

// 바 그래프 함수
var ctx1 = canvas1.getContext("2d");
ctx1.fillStyle = "#009688";
for (var i = 0; i < bardata1.length; i++) {
	var barHeight = (bardata1[i] / Math.max(...bardata1)) * chartHeight1;
	var x = i * (barWidth1 + barMargin1) + 10;
	var y = canvas1.height - barHeight - 10;
	ctx1.fillRect(x, y, barWidth1, barHeight);
}

var ctx2 = canvas2.getContext("2d");
ctx2.fillStyle = "#009688";
for (var i = 0; i < bardata2.length; i++) {
	var barHeight = (bardata2[i] / Math.max(...bardata2)) * chartHeight2;
	var x = i * (barWidth2 + barMargin2) + 10;
	var y = canvas2.height - barHeight - 10;
	ctx2.fillRect(x, y, barWidth2, barHeight);
}

var ctx3 = canvas3.getContext("2d");
ctx3.fillStyle = "#009688";
for (var i = 0; i < bardata3.length; i++) {
	var barHeight = (bardata3[i] / Math.max(...bardata3)) * chartHeight3;
	var x = i * (barWidth3 + barMargin3) + 10;
	var y = canvas3.height - barHeight - 10;
	ctx3.fillRect(x, y, barWidth3, barHeight);
}

var ctx4 = canvas4.getContext("2d");
ctx4.fillStyle = "#009688";
for (var i = 0; i < bardata4.length; i++) {
	var barHeight = (bardata4[i] / Math.max(...bardata4)) * chartHeight4;
	var x = i * (barWidth4 + barMargin4) + 10;
	var y = canvas4.height - barHeight - 10;
	ctx4.fillRect(x, y, barWidth4, barHeight);
}