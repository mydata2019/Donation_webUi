var totalAmt = 5248600;

$(document).ready(function () {
	// var url = document.URL;
	//	parseURL(url);
	var userId = document.getElementById("userId").value;
  viewTotalAmt(totalAmt);
	drawSocialVenture(userId);
});

//총 기부금액
function viewTotalAmt(totalAmt){

  var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',');

  $('#totalAamt').animateNumber(
    {
      number: totalAmt,
      numberStep: comma_separator_number_step
    },  1000
  );
};


function drawSocialVenture() {
// Themes begin
  am4core.useTheme(am4themes_material);
  // am4core.useTheme(am4themes_dataviz);
  am4core.useTheme(am4themes_animated);
  // Themes end

  var iconPath = "M24.85,10.126c2.018-4.783,6.628-8.125,11.99-8.125c7.223,0,12.425,6.179,13.079,13.543	c0,0,0.353,1.828-0.424,5.119c-1.058,4.482-3.545,8.464-6.898,11.503L24.85,48L7.402,32.165c-3.353-3.038-5.84-7.021-6.898-11.503	c-0.777-3.291-0.424-5.119-0.424-5.119C0.734,8.179,5.936,2,13.159,2C18.522,2,22.832,5.343,24.85,10.126z"

  var chart = am4core.create("chartdiv", am4charts.SlicedChart);
  chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect
  chart.paddingLeft = 15;

  chart.data = [{
      "name": "목표까지",
      "value": 10000000-totalAmt,
      "disabled":true
  }, {
      "name": "현재　",
      "value": totalAmt
  }];

  var series = chart.series.push(new am4charts.PictorialStackedSeries());
  series.dataFields.value = "value";
  series.dataFields.category = "name";
  series.alignLabels = false;
  // this makes only A label to be visible
  series.labels.template.propertyFields.disabled = "disabled";
  series.ticks.template.propertyFields.disabled = "disabled";


  series.maskSprite.path = iconPath;
  series.ticks.template.locationX = 1;
  series.ticks.template.locationY = 0;

  series.labelsContainer.width = 0;

  chart.legend = new am4charts.Legend();
  chart.legend.position = "bottom";
  chart.legend.paddingRight = 0;
  chart.legend.paddingBottom = 10;
  let marker = chart.legend.markers.template.children.getIndex(0);
  chart.legend.markers.template.width = 20;
  chart.legend.markers.template.height = 10;
  marker.cornerRadius(20,20,20,20);
}


// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {

  // Get the Sidebar
  var mySidebar = document.getElementById("mySidebar");
  // Get the DIV with overlay effect
  var overlayBg = document.getElementById("myOverlay");

  if (mySidebar.style.display == 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  // Get the Sidebar
  var mySidebar = document.getElementById("mySidebar");
  // Get the DIV with overlay effect
  var overlayBg = document.getElementById("myOverlay");

  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
