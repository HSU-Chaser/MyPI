// VERSION 9226
// This script works with IE 3.x

//************************** LOCALIZATION VARIABLES ***************************

//*************************** END LOCALIZATION ********************************

var baseUrl = jsPath; //jsPath comes from the dtuelink.js
var emailalias = "vsdocs";


//***************************** END VARIABLES *********************************

// ****************************************************************************
// *                             Expand-Collapse                              *
// ****************************************************************************

function makeExpandable(title, level){
	document.write("<P>" + L_Expand_TEXT + "<A href=\"" + L_Expand_URL + "\">" + L_Expand_URL + "</A>.</P>");
}


// ****************************************************************************
// *                            Graphic Animation                             *
// ****************************************************************************

function insertAnimation(name, number) {
	name = name + "1.gif";
	document.write("<img name=\"" + name + "\" src=\"" + name + "\">");
}

