function correctPNG()
{
	for(var i=0; i<document.images.length; i++)
	{
		var img = document.images[i];
		var imgName = img.src;
		if ( imgName.substring(imgName.length-3, imgName.length).toUpperCase() == "PNG" )
		{
			var imgID = (img.id) ? "id='" + img.id + "' " : "";
			var imgTitle = (img.title) ? "title='" + img.alt + "' " : "";
			var imgStyle = "display:inline;" + img.style.cssText ;
			if (img.align == "left") imgStyle = "float:left;" + imgStyle;
			if (img.align == "right") imgStyle = "float:right;" + imgStyle;
			if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle;
			var strNewHTML = "<span " + imgID + imgTitle	+ " style=\"" + "width: 30px;height:30px;" + imgStyle + ";" + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader" + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>";
			img.outerHTML = strNewHTML;
			i = i-1;
		}
	}
}

function calDate( value )
{
    if ( value == "" || value == undefined )
    {
	    var oDate = new Date();
	    sCurYear = oDate.getFullYear().toString();
	    sCurMonth = (oDate.getMonth() + 1).toString();
	    if ( sCurMonth.length < 2 )
	        sCurMonth = "0" + sCurMonth;
	    sCurDay = oDate.getDate().toString();
	    if ( sCurDay.length < 2 )
	        sCurDay = "0" + sCurDay;
	    sDate = sCurYear + "-" + sCurMonth + "-" + sCurDay;
	    return sDate;
	}
	else
	{
		return value.substr( 0, 16 );
	}
}

function calTime( value )
{
	var oDate = new Date();
	sCurHours = oDate.getHours().toString();
	if ( sCurHours.length < 2 )
		sCurHours = "0" + sCurHours;
	
	sCurMinutes = parseInt( oDate.getMinutes() );
	if ( ( sCurMinutes % 5 ) != 0 )
		sCurMinutes = ( parseInt(sCurMinutes / 5) + 1 ) * 5;
	

	if ( sCurMinutes == 60 )
	{
		sCurMinutes = "00";
		sCurHours++;
		if ( sCurHours == 24 )
			sCurHours = "00";
	}
	if ( sCurMinutes.toString().length < 2 )
	{
		sCurMinutes = "0" + sCurMinutes.toString();
	}
	
	sTime = sCurHours + ":" + sCurMinutes;
	return sTime;
}

function gotoPage(sUrl)
{
    window.location = sUrl;
}

function returnPage(sUrl)
{
    window.location = basePath + sUrl;
}

function openDialog(url, args, width, height) {
	if (!width) width = 600;
	if (!height) height = 400;
    var returnVal = window.showModalDialog(url, args, "dialogWidth=" + width + "px; dialogHeight=" + height + "px; status=yes;scroll=yes;help=no;");

    return returnVal;
}

function closeDialog(parentReload){
	window.returnValue = parentReload;
	window.close();
}
function openWin(sURL, target, width, height)
{
	if (!width) width = 600;
	if (!height) height = 400;
	var padLeft = (window.screen.width - width)/2;
	var padTop  = (window.screen.height - height)/2;
	var win = window.open(sURL, target, "width=" + width + ",height=" + height + ", top=" + padTop + " , left=" + padLeft + " ,scrollbars=yes , resizable = yes ,status=yes,toolbar=no,menubar=no,location=no");
}

function printWin()
{
	window.print();
}

function hideContent( eltID )
{
	var objImg = event.srcElement;
	var objElt = document.getElementById( eltID );
	if ( objElt.style.display == "none" )
	{
		objElt.style.display = "inline";
		objImg.src = skinPath + "/images/shrink.gif";
		objImg.alt = "";
	}
	else
	{
		objElt.style.display = "none";
		objImg.src = skinPath + "/images/expand.gif";
		objImg.alt = "";
		
	}
}