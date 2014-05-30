function write_header(title,titleID,lang)
{
  var help_title= "Swiff&nbsp;Chart&nbsp;Generator&nbsp;3";

document.write(

 "<div id='scrbanner'>"
+"<div id='bannerrow1'>"
+"<TABLE CLASS='bannerparthead' CELLSPACING=0>"
+"<TR ID='hdr'>"
+"<TD CLASS='runninghead' nowrap>" + help_title + "</TD>"
+"<TD CLASS='product' nowrap>&nbsp;</TD>"
+"</TR>"
+"</TABLE>"
+"</div>"

);

if( lang == "" )
  {
  document.write(

   "<div id='TitleRow'>"
  +"<H1 class='dtH1'><A NAME='" + titleID + "'></A><B>" + title + "</B></H1>"
  +"<H5></H5>"
  +"</div></div>"

  );
  }
else
  {
  document.write(

   "<div id='TitleRow'>"
  +"<H1 class='dtH1'><A NAME='" + titleID + "'></A><B>" + title + "</B>&nbsp;&nbsp;&nbsp;<font size=-7 color=#0000FF>[language:" + lang + "]</font></H1>"
  +"<H5></H5>"
  +"</div></div>"

  );
  }


}


function write_footer()
{
// GBXCPRGHT
document.write(
 "<DIV CLASS='footer'>"
+"<br>"
+"<HR>"
+"<p>&copy; 2008 GlobFX Technologies. All rights reserved.</p>"
+"</div>"
+"</div>"

);

}
