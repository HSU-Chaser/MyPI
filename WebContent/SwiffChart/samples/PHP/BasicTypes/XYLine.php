<?php 
  require( "../include/SwiffChart.php" );
  
  $chart= new SwiffChart;

  // Fill the first series named "Measure 1"
  $chart->SetSeriesXValuesFromString( 0, "0.5;2.3;8.9;15.4" );
  $chart->SetSeriesYValuesFromString( 0, "8;15;2;19" );
  $chart->SetSeriesCaption( 0, "Measure 1" );

  // Fill the second series named "Measure 2"
  $chart->SetSeriesXValuesFromString( 1, "4;7;11.5;9.2" );
  $chart->SetSeriesYValuesFromString( 1, "23;8;12;20" );
  $chart->SetSeriesCaption( 1, "Measure 2" );

  // Set the chart title
  $chart->SetTitle("Experimental Results");

  // Apply a XY Line style
  // The chart type is stored in the style file (*.scs)
  // Here the selected style is the predefined XY line style "Honolulu"
  $chart->LoadStyle( "xy/Honolulu" );
      
  $chart->SetLooping( false );

  $chart_res= $chart->GetHTMLTag();
?>

<H1>XY Line Chart</H1>
<br><?=$chart_res?>

