<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>直播课程</title>
		<link rel="stylesheet" href="css/style.css" />
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="laydate/laydate.js" ></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="[fallback css]" /></noscript>
		<![endif]-->

	</head>

	<body style="background-color: #E8E8E8;">
		<div class="bodybox">
			<form>
				<div class="log_one">
					<div class="log_name log_namonee">
						<div class="log_name_list">
							<label>课程名称</label>
							<input type=" text" placeholder="最多输入16个字符" />
						</div>
						<div class="log_name_dec">
							<label>课程介绍</label>
							<textarea placeholder="最多输入42个字符"></textarea>
						</div>
					</div>
				</div>
				<div class="ke_allkc">
					<ul>
						<li>
							<label for="myDate">开播时间</label>
							<input class="laydate-icon" id="demo" type="text " readonly placeholder="请选择时间">

						</li>
					</ul>
				</div>
				<div class="ke_sf">
					本次直播课堂有200位学员
				</div>
				<div class="log_tj log_tjone">
					<input type="submit" value="发布预告" />
				</div>
			</form>

		</div>
		
         <script>
			! function() {
				laydate.skin('molv'); //切换皮肤，请查看skins下面皮肤库
				laydate({
					elem: '#demo'
				}); //绑定元素
			}();
			//日期范围限制
			var start = {
				elem: '#start',
				format: 'YYYY-MM-DD',
				min: laydate.now(), //设定最小日期为当前日期
				max: '2099-06-16', //最大日期
				istime: true,
				istoday: false,
				choose: function(datas) {
					end.min = datas; //开始日选好后，重置结束日的最小日期
					end.start = datas //将结束日的初始值设定为开始日
				}
			};
			var end = {
				elem: '#end',
				format: 'YYYY-MM-DD',
				min: laydate.now(),
				max: '2099-06-16',
				istime: true,
				istoday: false,
				choose: function(datas) {
					start.max = datas; //结束日选好后，充值开始日的最大日期
				}
			};
			laydate(start);
			laydate(end);
			//自定义日期格式
			laydate({
				elem: '#test1',
				format: 'YYYY年MM月DD日',
				festival: true, //显示节日
				choose: function(datas) { //选择日期完毕的回调
					alert('得到：' + datas);
				}
			});
			//日期范围限定在昨天到明天
			laydate({
				elem: '#hello3',
				min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
				max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
			});
		</script>
	</body>

</html>