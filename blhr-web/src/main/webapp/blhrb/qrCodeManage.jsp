<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>企业推广的交互</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/icon.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/demo/demo.css"></link>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.min.js"></script>
<script type="text/javascript" src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

function createPush(){
  $('#createBroadcastPanel').dialog('open');

}

function createChildPush(){
	
}

function queryPushUser(){
	
}

function deletePush(){
	
	if(!window.confirm("你确定要删除该推广企业。注意删除当前推广企业，下级推广企业会被级联删除？"));
		return;
	
}

function canned(){
	$('#createBroadcastPanel').dialog('close');
}

function savePushCompany(){
	
	jQuery.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/savePushCompany",
		data:{
			companyName : document.getElementById("companyName").value
		},
		error : function(request) {
		},
		success : function(data) {
			$("#rqCode_grid").datagrid("reload",data);
			$('#createBroadcastPanel').dialog('close');

		}
});

	
}

</script>


</head>
<body>

<table id="rqCode_grid" class="easyui-datagrid" title="二维码推广维护"
	style="width: 100%; height: 380px" toolbar="#tb2" 
	 url='<%=request.getContextPath()%>/queryQRCodeInfo'
	 singleSelect=true pagination="true">
	<thead>
		<tr>
		    <th field="company_id" hidden="true"></th>
			<th field="company_name" width="25%" align="center">企业名称</th>
			<th field="company_qrcode" width="20%" align="center">二维码</th>
			<th field="create_time" width="20%" align="center">下线企业数</th>
			<th field="courseState" width="15%" align="center">累计推广交易用户数</th>
			<th field="available" width="20%" align="center">累计推广交易总金额</th>
		</tr>
	</thead>
</table>

<div id="tb2">
	<a href="#" class="easyui-linkbutton" iconCls="icon-save"
	plain="true" onclick="createPush()">创建推广企业</a> 
	<a href="#" class="easyui-linkbutton" iconCls="icon-save"
	plain="true" onclick="createChildPush()">创建下线推广企业</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" 
    onclick="deletePush()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" 
    onclick="queryPushUser()">查看推广用户</a>
</div>


<div id="createBroadcastPanel" class="easyui-dialog" title="创建推广企业" style="width:600px;height:200px; left:0,
            top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    <center><h3>创建推广企业</h3>
   <table align="center" style="width: 100%; height: 100%" border="0px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
    <tr><td  colspan="1">企业名称</td><td colspan="3"><input id="companyName" style="width: 400px;"  type="text" class="easyui-validatebox" name="companyName"/></td></tr>
    </table>
    <div>
    <input type="button" value="创建" onclick="savePushCompany()">
    <input type="button" value="取消" onclick="canned()">
    </div>
    </center>
</div>



</body>
</html>