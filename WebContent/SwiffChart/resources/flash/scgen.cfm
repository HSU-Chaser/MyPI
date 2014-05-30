<CFSETTING ENABLECFOUTPUTONLY="Yes" SHOWDEBUGOUTPUT="No">
<CFHEADER NAME= "Expires" VALUE="#Now()#">

<CFOBJECT TYPE="COM" 
          NAME="chart" 
          CLASS="SwiffChartObject.ChartObj" 
          ACTION="CREATE">

<CFSCRIPT> 

  // Your configuration
  web_root= "C:\Program Files\Apache Group\Apache\htdocs";

  chart.SetDocumentRoot(web_root);

  cmds= "";
  try 
    { 
    cmds= Form.args;
    }
  catch(any e) 
    {}

  chart.BatchCommands( cmds );

  filename= chart.GetOutputLocation();
  filename= web_root & filename;

</CFSCRIPT> 

<CFCONTENT TYPE="application/x-shockwave-flash" 
           FILE="#filename#">   
