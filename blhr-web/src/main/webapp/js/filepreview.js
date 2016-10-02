function getwebroot() {
	var webroot = document.location.href;
	webroot = webroot.substring(0, webroot.indexOf("tscp?action"));
	return webroot;
}
var zmlj;
var weblj;
function ckfj(rowIndex, rowData) {
	weblj = getwebroot();
	if (rowData) {
		var zmwc = rowData.name;
		var zmwc = zmwc.substring(zmwc.lastIndexOf("."), zmwc.length);

		if (zmwc == ".uot" || zmwc == ".UOT") {
			initjs();
			weblj += "upload/" + rowData.weblj;
			$('#yozo').dialog({
				title : '详细附件',
				closed : false,
				modal : true,
				width:750,
				height:510
			});
			if (IsIE()) {
				openDocumentRemote(weblj);
			} else {
			}

		} else if (zmwc == ".ofd" || zmwc == ".OFD") {
			initObject();
			weblj += "SKServlet?path=" + rowData.zwlj;
			$('#OFDActiveXDIV').dialog({
				title : '详细附件',
				closed : false,
				modal : true,
				width:750,
				height:510
			});
			openFileWeb(weblj);
		}else if(zmwc == ".jpg" || zmwc == ".JPG"){
			/*$('#JPGActiveXDIV').dialog({
				title : '详细附件',
				closed : false,
				modal : true,
			});
			var webroot = getwebroot();
			document.getElementById("showJpg").src = webroot+ "/" +"upload/" + rowData.weblj;*/
			//$("#JPGActiveXDIV").dialog('open');
			var webroot = getwebroot();
			//document.getElementById("showJpg").src = webroot+ "/" +row.weblj;
			window.open(webroot+ "/" +"upload/" + rowData.weblj);
		}else if(zmwc == ".bmp" || zmwc == ".BMP"){
			/*$('#JPGActiveXDIV').dialog({
				title : '详细附件',
				closed : false,
				modal : true,
			});
			var webroot = getwebroot();
			document.getElementById("showJpg").src = webroot+ "/" +"upload/" + rowData.weblj;*/

			//$("#JPGActiveXDIV").dialog('open');
			var webroot = getwebroot();
			//document.getElementById("showJpg").src = webroot+ "/" +row.weblj;
			window.open(webroot+ "/" +"upload/" + rowData.weblj);
		}else if(zmwc == ".gif"  ||  zmwc == ".GIF"){
			/*$('#JPGActiveXDIV').dialog({
				title : '详细附件',
				closed : false,
				modal : true,
			});
			var webroot = getwebroot();
			document.getElementById("showJpg").src = webroot+ "/" +"upload/" + rowData.weblj;*/
			//$("#JPGActiveXDIV").dialog('open');
			var webroot = getwebroot();
			//document.getElementById("showJpg").src = webroot+ "/" +row.weblj;
			window.open(webroot+ "/" +"upload/" + rowData.weblj);
		}else if(zmwc == ".png"  ||  zmwc == ".PNG"){
			/*$('#JPGActiveXDIV').dialog({
				title : '详细附件',
				closed : false,
				modal : true,
			});
			var webroot = getwebroot();
			document.getElementById("showJpg").src = webroot+ "/" +"upload/" + rowData.weblj;*/

			//$("#JPGActiveXDIV").dialog('open');
			var webroot = getwebroot();
			//document.getElementById("showJpg").src = webroot+ "/" +row.weblj;
			window.open(webroot+ "/" +"upload/" + rowData.weblj);
		}else if(zmwc == ".JPEG"  ||  zmwc == ".jpeg"){
			/*$('#JPGActiveXDIV').dialog({
				title : '详细附件',
				closed : false,
				modal : true,
			});
			var webroot = getwebroot();
			document.getElementById("showJpg").src = webroot+ "/" +"upload/" + rowData.weblj;*/

			//$("#JPGActiveXDIV").dialog('open');
			var webroot = getwebroot();
			//document.getElementById("showJpg").src = webroot+ "/" +row.weblj;
			window.open(webroot+ "/" +"upload/" + rowData.weblj);
		}
	} else {
		$.messager.alert('警告', '请选择一个文件！', 'error');
		return false;
	}

}
// /////////////////////////////////////////////
function initjs() {
	DocFrame = init("yozo", "100%", "700");
}
/**
 * 永中Office对象加载完毕回调函数
 */
function afterLaunchOffice() {
	if (!IsIE()) {
		openDocumentRemote(weblj);
	} else {
		openDocumentRemote(weblj);			
	}
}
function afterOpenWorkbook() {
	filemax();
}
function IsIE() {
	if (navigator.userAgent.indexOf("MSIE") != -1) { // IE
		return true;
	}
	if (navigator.userAgent.indexOf("Firefox") != -1
			|| navigator.userAgent.indexOf("Mozilla") != -1) {// firefox
		return false;
	}
}
function openDocumentRemote(realpath) {
	var a = DocFrame.openDocumentRemote(realpath, false);
}
// 调用最大化
function filemax() {
	var windows = document.getElementById("EIOWebOffice").getApp().getWindows();
	var allWindows = windows.getAllWindows();
	for (var i = 0; i < allWindows.length; i++) {
		allWindows[i].setState(2);// 2最大化 1取消最大化
	}
}
// /////////////////////////////////////////////数科
function openFileWeb(realpath) {
	var hh = ocx.openFile(realpath);// 打开本地文件
}
var ocx;
function initObject() {
	ocx = suwell.ofdReaderInit("OFDActiveXDIV", "auto", "auto");
	if (ocx) {
		ocx.setCompositeVisible([ "menu" ], false);// ,"navigator"
	}
	ocx.registListener("print", "printPerforming", false);// 执行回调函数 true事后调用
	// false事前调用
}
// ///////////////////////////////
