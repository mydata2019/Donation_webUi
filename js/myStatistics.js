var userNm="테스트";
var userId=1;

$(document).ready(function () {
	// var url = document.URL;
	//	parseURL(url);
	// var userId = document.getElementById("userId").value;
  //userId =  document.getElementById("userId").value;
  selectMainInfo(userId);
	selectStatistics(userId);

  //사용자명 맵핑
  document.getElementById("userNmSide").innerHTML=userNm;
});


// 사용자 정보
function selectMainInfo(userId){
	console.log("userId > "+JSON.stringify(userId));
/*
	$.ajax({
			url: 'http://'+ip+':8089/history/selectMain',
			type: 'POST',
			data: userId,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function (data) {

				data = JSON.stringify(data);
				data = JSON.parse(data);

        //기부내역 명세
        data["hstResultSpc"].forEach(function (rowSpc, i) {
          userNm = rowSpc['user_nm'];             //사용자명
					document.getElementById("userNmSide").innerHTML=userNm;

        }); //end of spc

			},
			error: function (data){
				console.log("통신Error OR 없는 고객");
			}
		});
*/
		return true;

};

//select My Statistics
function selectStatistics(userId){

	var userId = userId;
	console.log("userId "+userId);
  drawStatistics("");
  drawTaxStatistics("");

	// var data = userId;
/*
	$.ajax({
		url: 'http://'+ip+':8090/statistics/selectStatistics',
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
      drawTaxStatistics(data);

		},
		error: function (data){
			console.log("통신Error OR 없는 고객");
			return true;
		}
	});
*/
	return true;

}

// function to_back(){
//   console.log("back");
//   location.href="./mainMyDon.jsp?userId="+userId;
// }

//페이지 이동
function layerOpen(id) {
    console.log("id is "+id);
    location.href="./"+id+".jsp?userId="+userId;
};

function drawStatistics(result){
	// am4core.ready(function() {

	//totalAmt
	// var nData = AddComma(result.totalAmt);
	var nData = AddComma(577000);
	$('#totalAmtdiv').append(nData);

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var columnChart = am4core.create("columnChartdiv", am4charts.XYChart);

	// Add data
	// columnChart.data = result.colRslt;
	columnChart.data =
	[ {
	  "don_month": 01,
	  "org_category_nm0": 2,
	  "org_category_nm1": 7.5
	},{
    "don_month": 02,
	  "org_category_nm0": 2
	},{
	  "don_month": 03,
	  "org_category_nm0": 2
	},{
	  "don_month": 04,
	  "org_category_nm0": 2,
	  "org_category_nm4": 3
	},{
	  "don_month": 05,
	  "org_category_nm0": 2,
	  "org_category_nm3": 5
	},{
	  "don_month": 06,
	  "org_category_nm0": 3
	},{
	  "don_month": 07,
	  "org_category_nm0": 2,
	  "org_category_nm3": 2.5
	},{
	  "don_month": 08,
	  "org_category_nm0": 2,
	  "org_category_nm3": 9
	},{
	  "don_month": 09,
	  "org_category_nm0": 2,
	  "org_category_nm1": 10
	},{
	  "don_month": 10,
	  "org_category_nm0": 1.7
	} ];

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

	// for(var index in result.catRslt){
	//   createSeries("org_category_nm"+index, result.catRslt[index].org_category_nm, true);
	//   console.log(index, "org_category_nm"+index, result.catRslt[index].org_category_nm);
	// }

	createSeries("org_category_nm0", "해외구호", true);
	createSeries("org_category_nm1", "사회복지", true);
	createSeries("org_category_nm2", "인권", true);
	createSeries("org_category_nm3", "정치", true);
	createSeries("org_category_nm4", "환경", true);
	// createSeries("org_category_nm5", "환경", true);
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


	// pieChart.data = result.pieRslt;

	pieChart.data = [{
	  "don_amt": 20.70000,
	  "org_category_nm": "해외구호"
	},{
    "don_amt": 17.5000,
	  "org_category_nm": "사회복지"
	}, {
    "don_amt": 9.0000,
	  "org_category_nm": "인권"
	}, {
    "don_amt": 7.5000,
	  "org_category_nm": "정치"
	}, {
    "don_amt": 3.0000,
	  "org_category_nm": "환경"
	}];

}

function drawTaxStatistics(result){

	var totalAmt = 577000 / 10000;
  var taxFavor = 577000 * 15 /100 /10000;
  var taxFavorR = AddComma(577000 * 15 /100);
  $('#taxFavordiv').append(taxFavorR);

  // Themes begin
  am4core.useTheme(am4themes_animated);
  // Themes end

   // Create chart instance
  var chart = am4core.create("barChartdiv", am4charts.XYChart);

  chart.data = [
    {
      "region": "B",
      "category": "세제혜택",
      "totalAmt": taxFavor
    },
    {
      "region": "A",
      "category": "기부금액",
      "totalAmt": totalAmt
    }
  ];

  // Create axes
  var yAxis = chart.yAxes.push(new am4charts.CategoryAxis());
  yAxis.dataFields.category = "category";
  yAxis.renderer.grid.template.location = 0;
  yAxis.renderer.labels.template.fontSize = 10;
  yAxis.renderer.minGridDistance = 10;

  var xAxis = chart.xAxes.push(new am4charts.ValueAxis());

  // Create series
  var series = chart.series.push(new am4charts.ColumnSeries());
  series.dataFields.valueX = "totalAmt";
  series.dataFields.categoryY = "category";
  series.columns.template.tooltipText = "{categoryY}: [bold]{valueX}[/]";
  series.columns.template.strokeWidth = 0;
  series.columns.template.adapter.add("fill", function(fill, target) {
    if (target.dataItem) {
      switch(target.dataItem.dataContext.region) {
        case "A":
          return chart.colors.getIndex(0);
          break;
        case "B":
          return chart.colors.getIndex(1);
          break;
      }
    }
    return fill;
  });

}


function AddComma(num)
{
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}
