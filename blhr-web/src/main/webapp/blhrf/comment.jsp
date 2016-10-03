<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>课程题目</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
<style type="text/css">
    #divcss5{ margin:10px auto} 
    #divcss5 img{ border-radius:50%}
</style>
</head>

<body style="background-color: #E8E8E8;">
	<div class="bodybox">
		<div class="ke_tgd ke_te_tgd">
			<ul>
				<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_2.png);"><span>用户评论</span>
					<span> 
				</span></li>
			</ul>
		</div>
		<div class="ke_backoone">

			<ul class="comment">
				<c:forEach items="${comments }" var="list">
                   
					<li>
					<div  id="divcss5">
				    	<c:if test="${list.category==1}">
							<img id="divcss5" class="myIcon" src="${list.photo}"></img>
						</c:if> 
						<c:if test="${list.category==2}">
							<img class="myIcon"
								src="<%=request.getContextPath() %>/${list.photo }"></img>
						</c:if>
						<div class="text">
							<span>${list.wechatname }</span>
							<p>${list.content }</p>
						</div>
						 </div>
						</li>
				</c:forEach>
				
				<div id="commentExtend" class="commentExtend"></div>
			</ul>
			

			<div>
				<div class="foot_foot">
				   <button class="send" onclick="sendText()">发送</button>
					<div class="fuzhi_box">
						<input type="text" name="comment" id="commentContent"  />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
  
function sendText(){
	
	var commentContent = document.getElementById("commentContent").value;
	if(commentContent == null || commentContent == "")
		return ;
	
	$.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/saveCommentToDB",
		data : {
			"courseId" : '${courseId}',
			"userId" : '${userId}',
			"comment" : commentContent
		},
		error : function(request) {
			alert("内容发送失败!");
		},
		success : function(data) {
			if("1" != data)
				alert("内容发送失败!");
			else{
				$(".comment").append(getTextPanel(commentContent));
				document.getElementById("commentContent").value = "";
			}
				
		}
	});
}

  function getTextPanel(content){
	  
		return "<li><img class=\"myIcon\" src=\"${list.photo}\"></img>"+
			"<div class=\"text\">"+
				"<span>${wechatname }</span>"+
				"<p>"+content+"</p>"+
			"</div></li>";
  }

</script>
</html>