var is_ie = (navigator.appName == "Microsoft Internet Explorer");

function scriptPath()
{
  var scripts = null;
  if( is_ie )
    scripts= document.scripts;
   else
    scripts= document.getElementsByTagName("script");

  var spath= scripts[scripts.length - 1].src;
  spath= spath.replace("dtuelink2.js", "");

  return spath;
}

var jsPath = scriptPath();

if ( is_ie )
  {
  document.writeln('<SCRIPT SRC="' + jsPath + 'ie.js"></SCRIPT>');
  document.writeln('<SCRIPT FOR="reftip" EVENT="onclick">window.event.cancelBubble = true;</SCRIPT>');
  document.writeln('<SCRIPT FOR="cmd_lang" EVENT="onclick">langClick(this);</SCRIPT>');
  document.writeln('<SCRIPT FOR="cmd_filter" EVENT=onclick>filterClick(this);</SCRIPT>');

  var HxLink = "HxLink.css";
  var HxLinkPath = "ms-help://Hx/HxRuntime/";
  document.writeln('<LINK REL="stylesheet" HREF="' + HxLinkPath + HxLink + '">');

  document.writeln('<LINK REL="stylesheet" HREF="' + jsPath + 'ie.css">');
  }
 else
  {
  // not IE

  document.writeln('<SCRIPT SRC="' + jsPath + 'ff.js"></SCRIPT>');
  document.writeln('<LINK REL="stylesheet" HREF="' + jsPath + 'ff.css">');
  }

document.writeln('<TITLE>' + page_title + '</TITLE>' );

