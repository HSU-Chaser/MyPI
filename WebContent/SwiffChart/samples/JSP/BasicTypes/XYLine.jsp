<%@ page import="com.globfx.swiffchart.SwiffChart" %>
<%
  // Test init
  String installation_dir= "C:\\Program Files\\GlobFX\\Swiff Chart Generator 3";
  String web_root= "C:\\tomcat\\webapps\\ROOT";

  // Create a new Swiff Chart object
  SwiffChart chart= new SwiffChart(installation_dir);

  // JSP Init
  chart.SetServletInfo(request,response);
  chart.SetDocumentRoot(web_root);

  String sep= ";";
  boolean ignoremultseparators= true;
  chart.SetSeparators(sep, ignoremultseparators);

  // Fill the first series named "Measure 1"
  String seriesx1= "0.5" + sep + "2.3" + sep + "8.9" + sep + "15.4";
  String seriesy1= "8" + sep + "15" + sep + "2" + sep + "19";
  chart.SetSeriesXValuesFromString(0, seriesx1);
  chart.SetSeriesYValuesFromString(0, seriesy1);
  chart.SetSeriesCaption(0, "Measure 1");

  // Fill the second series named "Measure 2"
  String seriesx2= "4" + sep + "7" + sep + "11.5" + sep + "9.2";
  String seriesy2= "23" + sep + "8" + sep +  "12" + sep + "20";
  chart.SetSeriesXValuesFromString(1, seriesx2);
  chart.SetSeriesYValuesFromString(1, seriesy2);
  chart.SetSeriesCaption(1, "Measure 2");

  // Set the chart title
  chart.SetTitle("Experimental Results");

  // Apply a XY (Scatter) style
  // The chart type is stored in the style file (*.scs)
  // Here the selected style is the predefined column style "Honolulu"
  String style = "xy/Honolulu";
  chart.LoadStyle( style );
      
  chart.SetLooping( false );

  String chart_res= chart.GetHTMLTag();

  chart.Release();
%>

<H1>XY Line Chart</H1>
<br><% out.println( chart_res ); %>
