<?php 
  require( "../include/SwiffChart.php" );
  
  $chart= new SwiffChart;

  // Fill the series and categories
  $categories= "USA;Germany;United Kingdom";
  $chart->SetCategoriesFromString($categories);

  $chart->SetSeriesValuesFromString( 0, "45;28;16" );

  // Set the chart title
  $chart->SetTitle("Geographical Distribution");

  // Apply a Pie style
  // The chart type is stored in the style file (*.scs)
  // Here the selected style is the predefined pie style "Honolulu"
  $chart->LoadStyle( "pie/Honolulu" );
      
  $chart->SetLooping( false );

  $chart_res= $chart->GetHTMLTag();
?>

<H1>Pie Chart</H1>
<br><?=$chart_res?>

