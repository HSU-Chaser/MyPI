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

  // Fill the series and categories
  String categories= "USA" + sep + "Germany" + sep + "United Kingdom";
  chart.SetCategoriesFromString(categories);

  String series= "45" + sep + "28" + sep + "16";

  chart.SetSeriesValuesFromString(0, series);

  // Set the chart title
  chart.SetTitle("Geographical Distribution");

  // Apply a Pie style
  // The chart type is stored in the style file (*.scs)
  // Here the selected style is the predefined column style "Honolulu"
  String style = "pie/Honolulu";
  chart.LoadStyle( style );
      
  chart.SetLooping( false );

  String chart_res= chart.GetHTMLTag();

  chart.Release();
%>

<H1>Pie Chart</H1>
<br><% out.println( chart_res ); %>
