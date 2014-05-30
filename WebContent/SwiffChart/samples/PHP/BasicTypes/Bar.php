<?php 
  require( "../include/SwiffChart.php" );
  
  $chart= new SwiffChart;

  // Fill the categories
  $chart->SetCategoriesFromString( "Q1;Q2;Q3;Q4" );

  // Fill the first series named "Sales Y1"
  $chart->SetSeriesValuesFromString( 0, "8;15;6;19" );
  $chart->SetSeriesCaption( 0, "Sales Y1" );

  // Fill the second series named "Sales Y2"
  $chart->SetSeriesValuesFromString( 1, "23;8;12;14" );
  $chart->SetSeriesCaption( 1, "Sales Y2" );

  // Set the chart title
  $chart->SetTitle("Financial Results");
  $chart->SetSubtitle("(Values in M$ - Year to year results)");

  // Apply a Bar style
  // The chart type is stored in the style file (*.scs)
  // Here the selected style is the predefined bar style "SanFrancisco"
  $chart->LoadStyle( "bar/SanFrancisco" );
      
  $chart->SetLooping( false );

  $chart_res= $chart->GetHTMLTag();
?>

<H1>Bar Chart</H1>
<br><?=$chart_res?>

