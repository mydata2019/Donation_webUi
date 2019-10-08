
$(document).ready(function () {
	var url = document.URL;
	//	parseURL(url);
	// var userId = document.getElementById("userId").value;
  var userId = '2';
	selectStatistics(userId);
});

//select My Statistics
function selectStatistics(userId){

	var userId = userId;
	console.log("userId "+userId);

	// var data = userId;

	$.ajax({
		//url: 'http://localhost:8083/charging/selectHst',
		//url: 'http://localhost:8000/core/charging/selectHst',	//local
		//url: 'http://a75b30f27972711e9a5260241e1ca044-1071553545.ap-northeast-2.elb.amazonaws.com:8000/core/charging/selectHst',
		// url: 'http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/core/charging/selectHst',
		url: 'http://localhost:8090/statistics/selectStatistics',
		type: 'POST',
		data: JSON.stringify(userId),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		async: false,
		success: function (data) {
			data = JSON.stringify(data);
			data = JSON.parse(data);
			console.log("data > " + data.totalAmt);
      drawStatistics(data);

		},
		error: function (data){
			console.log("통신Error OR 없는 고객");
			return false;
		}
	});

	return true;

}

function drawStatistics(result){
	// am4core.ready(function() {

	//totalAmt
	var nData = AddComma(result.totalAmt);
	$('#totalAmtdiv').append(nData);

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var columnChart = am4core.create("columnChartdiv", am4charts.XYChart);

	// Add data
	columnChart.data = result.colRslt;
	// [ {
	//   "month": "1",
	//   "A": result.colRslt[0].donAmt,
	//   "노인": 2.5,
	//   "기업": 2.1,
	//   "정치": 1.2,
	//   "종교": 0.2,
	//   "기타": 0.1
	// },{
	//   "month": "2",
	//   "A": 2.5,
	//   "노인": 2.5,
	//
	//   "정치": 1.2,
	//   "종교": 0.2,
	//   "기타": 0.1
	// } ];

	// Create axes
	var categoryAxis = columnChart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "don_month";
	categoryAxis.title.text = "나의 기부내역 (월)";
	categoryAxis.renderer.grid.template.location = 0;
	categoryAxis.renderer.minGridDistance = 20;
	categoryAxis.renderer.cellStartLocation = 0.1;
	categoryAxis.renderer.cellEndLocation = 0.9;

	var  valueAxis = columnChart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.min = 0;
	valueAxis.title.text = "기부금액 (만원)";

	// Create series
	function createSeries(field, name, stacked) {
	  var series = columnChart.series.push(new am4charts.ColumnSeries());
	  series.dataFields.valueY = field;
	  series.dataFields.categoryX = "don_month";
	  series.name = name;
	  series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
	  series.stacked = stacked;
	  series.columns.template.width = am4core.percent(95);
	}

	for(var index in result.catRslt){
	  createSeries("org_category_nm"+index, result.catRslt[index].org_category_nm, true);
	  console.log(index, "org_category_nm"+index, result.catRslt[index].org_category_nm);
	}

	// createSeries("org_category_nm1", result.catRslt[0].org_category_nm, true);
	// createSeries("org_category_nm2", result.catRslt[1].org_category_nm, true);
	// createSeries("org_category_nm3", result.catRslt[2].org_category_nm, true);
	// createSeries("org_category_nm4", result.catRslt[3].org_category_nm, true);
	// createSeries("org_category_nm5", result.catRslt[4].org_category_nm, true);
	// createSeries("org_category_nm6", result.catRslt[5].org_category_nm, true);

	// Add legend
	columnChart.legend = new am4charts.Legend();



	// Create chart instance
	var pieChart = am4core.create("pieChartdiv", am4charts.PieChart);

	// Add and configure Series
	var pieSeries = pieChart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.category = "org_category_nm";
	pieSeries.dataFields.value = "don_amt";

	// Let's cut a hole in our Pie chart the size of 30% the radius
	pieChart.innerRadius = am4core.percent(30);

	// Put a thick white border around each Slice
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;
	pieSeries.slices.template
	  // change the cursor on hover to make it apparent the object can be interacted with
	  .cursorOverStyle = [
	    {
	      "property": "cursor",
	      "value": "pointer"
	    }
	  ];

	pieSeries.alignLabels = false;
	pieSeries.labels.template.bent = true;
	pieSeries.labels.template.radius = 7;
	pieSeries.labels.template.padding(0,0,0,0);

	pieSeries.ticks.template.disabled = true;

	// Create a base filter effect (as if it's not there) for the hover to return to
	var shadow = pieSeries.slices.template.filters.push(new am4core.DropShadowFilter);
	shadow.opacity = 0;

	// Create hover state
	var hoverState = pieSeries.slices.template.states.getKey("hover"); // normally we have to create the hover state, in this case it already exists

	// Slightly shift the shadow and make it more prominent on hover
	var hoverShadow = hoverState.filters.push(new am4core.DropShadowFilter);
	hoverShadow.opacity = 0.7;
	hoverShadow.blur = 5;

	// Add a legend
	pieChart.legend = new am4charts.Legend();


	pieChart.data = result.pieRslt;

	// pieChart.data = [{
	//   "category": pieCategory,
	//   "money": donAmt
	// },{
	//   "category": "노인",
	//   "money": 300000
	// }, {
	//   "category": "기업",
	//   "money": 200000
	// }, {
	//   "category": "정치",
	//   "money": 100000
	// }, {
	//   "category": "종교",
	//   "money": 100000
	// }, {
	//   "category": "기타",
	//   "money": 150000
	// }];

}

function AddComma(num)
{
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}
