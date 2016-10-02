<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<title>SwfObject2.2Demo</title> 
</head>
<body>
<div id="div1"></div>
<input type="button" value="立即" onclick="play_click(this,'http://www.bolihaiwe.com/blhr-web/upload/20160828/4471be51c9b84f3a8e2abd866929da81.mp3');">
<div id="div2"></div>
<script language="javascript">
function play_click(sef,url){
var div = document.getElementById('div1');
div.innerHTML = '<embed src="'+url+'" loop="0" autostart="true" hidden="true"></embed>';
}


</script></body> 
</html> 