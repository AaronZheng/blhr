<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>banner管理</title>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.4.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/default/easyui.css"></link>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/icon.css"></link>

<script type="text/javascript">

  function submit1(){
	  if((document.getElementById("pic_link1").value == null || document.getElementById("pic_link1").value == "")||
			  (document.getElementById("pic_address1").value == null || document.getElementById("pic_address1").value == "")){
		  alert("请填写需要更新的信息！");
		  return ;
	  }
	  form1 = $('#form1').serialize();
	  formObj = $("#form1");
	  formObj.ajaxSubmit({
          type: 'post', // 提交方式 get/post
          url: '<%=request.getContextPath() %>/BannerServlet', // 需要提交的 url
          data: form1,
          error:function(request) {
  			alert("修改内容失败");
  		},
          success: function(data) { 
        	  alert("修改banner信息成功");
      		window.location.href = "<%=request.getContextPath()%>/initBannerPage";
          }
      });
  }
  function submit2(){
	  if((document.getElementById("pic_link2").value == null || document.getElementById("pic_link2").value == "")||
			  (document.getElementById("pic_address2").value == null || document.getElementById("pic_address2").value == "")){
		  alert("请填写需要更新的信息！");
		  return ;
	  }
		  form1 = $('#form2').serialize();
		  formObj = $("#form2");
		  formObj.ajaxSubmit({
	          type: 'post', // 提交方式 get/post
	          url: '<%=request.getContextPath() %>/BannerServlet', // 需要提交的 url
	          data: form1,
	          error:function(request) {
	  			alert("修改内容失败");
	  		},
	          success: function(data) { 
	        	  alert("修改banner信息成功");
	      		window.location.href = "<%=request.getContextPath()%>/initBannerPage";
	          }
	      });
  }
  
  function submit3(){
	  /* if((document.getElementById("pic_link3").value == null || document.getElementById("pic_link3").value == "")||
			  (document.getElementById("pic_address3").value == null || document.getElementById("pic_address3").value == "")){
		  alert("请填写需要更新的信息！");
		  return ;
	  } */
		  form1 = $('#form3').serialize();
		  formObj = $("#form3");
		  formObj.ajaxSubmit({
	          type: 'post', // 提交方式 get/post
	          url: '<%=request.getContextPath() %>/BannerServlet', // 需要提交的 url
	          data: form1,
	          error:function(request) {
	  			alert("修改内容失败");
	  		},
	          success: function(data) { 
	        	  alert("修改banner信息成功");
	      		window.location.href = "<%=request.getContextPath()%>/initBannerPage";
	          }
	      });
  }


</script>


</head>
<body>
<div>	
 		<form id ="form1" name="form1" action="<%=request.getContextPath()%>/BannerServlet" method="post"  enctype="multipart/form-data"  style="width: 90%; height: 90%">
			<table  class="panel-table" border="0" align="center" style="padding: 5px 5px">
				<tr>
					<td style="width:100px" align="right">第一张图像:</td>
					<td style="width:80px" align="right">上传图像:</td>
					<td style="width:80px"><input type="hidden" name="photoId" value = "1"><input type='file' id='pic_link1' name='photoPath' /></td>
					<td style="width:80px" align="right">链接:</td>
					<td style="width:140px"><input class="easyui-validatebox" type="text" id="pic_address1" name="link" value='${pic_address1}'/></td>
				  	<td><img id="pic_link1" alt="" style="width: 80px; hight: 50px;" src='<%=request.getContextPath()%>/${pic_link1}'></td>
				  	<td style="width:80px"><input type="button" onclick="submit1()" value ="修改"></td>
				
				</tr>
				</table>
	        </form>
			<form id="form2" name="form2" method="post" action="<%=request.getContextPath()%>/BannerServlet" enctype="multipart/form-data" style="width: 90%; height: 90%">
	         <table class="panel-table" border="0" align="center" style="padding: 5px 5px">
				<tr>
					<td style="width:100px" align="right">第二张图像:</td>
                    <td style="width:80px" align="right">上传图像:</td>
					<td style="width:80px"><input type="hidden" name="photoId" value="2"> <input type='file' id='pic_link2' name='photoPath' /></td>
					<td style="width:80px" align="right">链接:</td>
					<td style="width:140px"><input class="easyui-validatebox" type="text" id="pic_address2" name="link" value='${pic_address2}'/></td>
				    <td><img id="pic_link2" alt="" style="width: 80px; hight: 50px;" src='<%=request.getContextPath()%>/${pic_link2}'></td>
				    <td style="width:80px"><input type="button" onclick="submit2()" value ="修改"></td>
				</tr>
				</table>
				</form>
			<form id="form3" name="form3" method="post" action="<%=request.getContextPath()%>/BannerServlet" enctype="multipart/form-data" style="width: 90%; height: 90%">
		     <table class="panel-table" border="0" align="center" style="padding: 5px 5px">
				<tr>
					<td style="width:100px" align="right">第三张图像:</td>
                    <td style="width:80px" align="right">上传图像:</td>
					<td style="width:80px"><input type="hidden" name="photoId" value = "3"> <input type='file' id='pic_link3' name='photoPath' /></td>
					<td style="width:80px" align="right">链接:</td>
					<td style="width:140px"><input class="easyui-validatebox" type="text" id="pic_address3" name="link" value='${pic_address2}'/></td>
					<td><img id="pic_link3" alt="" style="width: 80px; hight: 50px;" src='<%=request.getContextPath()%>/${pic_link3}'></td>
				  	<td style="width:80px"><input type="button" onclick="submit3()" value ="修改"></td>
				</tr>
			</table>
		 </form>
			
  </div>
</body>
</html>