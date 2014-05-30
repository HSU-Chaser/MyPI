<%@ page import="com.globfx.swiffchart.SwiffChart"
%><%
  ///////////////////////////////////////////////////////////////////////////
  //WARNING: Do not modify the lines above
  //         no carriage return, no character, no blank line
  ///////////////////////////////////////////////////////////////////////////

  // Your configuration
  String installation_dir= "C:\\Program Files\\GlobFX\\Swiff Chart Generator 3";
  String web_root= "C:\\tomcat\\webapps\\ROOT";

  String cmds= request.getParameter("args");
  if( cmds == null )
    cmds= "";

  // Create a new Swiff Chart object
  SwiffChart chart= new SwiffChart(installation_dir);

  // JSP Init
  chart.SetServletInfo(request,response);
  chart.SetDocumentRoot(web_root);

  chart.SetDebugMode(2);
  chart.BatchCommands(cmds);

  chart.ExportAsResponse();

  response.setStatus(response.SC_OK);
  response.flushBuffer();
%>