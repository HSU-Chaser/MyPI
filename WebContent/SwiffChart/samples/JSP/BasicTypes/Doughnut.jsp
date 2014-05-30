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

  // Fill the categories
  String categories= "Q1" + sep + "Q2" + sep + "Q3" + sep + "Q4";
  chart.SetCategoriesFromString(categories);

  // Fill the first series named "Sales Y1"
  String series1= "9" + sep + "6" + sep + "11" + sep + "12";
  chart.SetSeriesValuesFromString(0, series1);
  chart.SetSeriesCaption(0, "Sales Y1");

  // Fill the second series named "Sales Y2"
  String series2= "11" + sep + "8" + sep +  "12" + sep + "23";
  chart.SetSeriesValuesFromString(1, series2);
  chart.SetSeriesCaption(1, "Sales Y2");

  // Set the chart title
  chart.SetTitle("Financial Results");
  chart.SetSubtitle("(Values in M$ - Year to year results)");

  // Apply a Doughnut style
  // The chart type is stored in the style file (*.scs)
  // Here the selected style is the predefined column style "Honolulu"
  String style = "doughnut/Honolulu";
  chart.LoadStyle( style );
      
  chart.SetLooping( false );

  String chart_res= chart.GetHTMLTag();

  chart.Release();
%>

<H1>Doughnut Chart</H1>
<br><% out.println( chart_res ); %>
