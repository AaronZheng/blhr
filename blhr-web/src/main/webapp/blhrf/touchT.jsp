<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>录制课程</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>

<script type="text/javascript">

var timeout = undefined;
var obj = document.getElementsByClassName('touch');
for (var i = 0; i < obj.length; i++) {
    obj[i].addEventListener('touchstart', function(event) {  
        timeout = setTimeout(function() {
        var type = $(obj[i]).find('.AtFlag_s').val();
        var info = "";
        if (type == "0") {
            info = "您确定取消关注？"
        } else {
            info = "您即将关注该班级！";
        }
       AppDaliog.confirm(info, "", function() {

            update_Attention(obj[i]);
        });
  }, 1500);

    }, false);
    obj[i].addEventListener('touchend', function(event) {//  
        clearTimeout(timeout);
     }, false);
}

</script>

</head>
<body>

  <div id="touch" class="touch" style="font-size: 100px;">touch this</div>

</body>
</html>