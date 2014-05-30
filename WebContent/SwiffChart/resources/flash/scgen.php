<?php

  // Your configuration
  $installation_dir= "C:\\Program Files\\GlobFX\\Swiff Chart Generator 3";

  require( "$installation_dir/resources/php/SwiffChart.php" );

  $cmds= "";
  if( isset($HTTP_POST_VARS['args']) )
    $cmds= $HTTP_POST_VARS['args'];
   else
    $cmds= $_POST['args'];

  $chart= new SwiffChart($installation_dir);

  $chart->SetDebugMode(2);
  $chart->BatchCommands($cmds);

  $chart->ExportAsResponse();

?>