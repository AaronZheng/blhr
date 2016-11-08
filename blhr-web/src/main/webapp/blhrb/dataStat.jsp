<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据统计</title>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.4.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/default/easyui.css"></link>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/icon.css"></link>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/echarts/echarts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/timelineOption.js"></script>
 --%></head>
<body>

<div>
        <div>
	        <input type="button" value="订单" onclick = "ordersStat()">
	        <input type="button" value="会员" onclick = "usersStat()">
        </div>
        <!-- <div>
        	<input type="button" value="7天" onclick = "">
	        <input type="button" value="1个月" onclick = "dataStatUsers()">
	        <input type="button" value="6个月" onclick = "dataStatUsers()">
        </div> -->
       <div id="main" style="height:400px;width:800px"></div>
</div>

<script type="text/javascript">
function usersStat(){
	$.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/dataStat",
		data : {"fre" : "days", "type" : "user"},
		error : function(request) {
			
		},
		success : function(data) {
			console.log(data);
			usersDays(data)
		}
	});
}

function ordersStat(){
	$.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/dataStat",
		data : {"fre" : "days", "type" : "order"},
		error : function(request) {
			
		},
		success : function(data) {
			console.log(data);
			ordersDays(data)
		}
	});
}

function usersDays(data){
	var webroot = document.location.href;
	webroot = webroot.substring(0, webroot.indexOf("/blhrb"));
	
	require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
	require(
	        ['echarts','echarts/chart/bar','echarts/chart/line'],
	        function (ec) {

	            // 基于准备好的dom，初始化echarts图表
	            var myChart = ec.init(document.getElementById('main')); 
	            
	             var option = {
	            	    title : {
	            	        text: '会员统计',
	            	       
	            	    },
	            	    tooltip : {
	            	        trigger: 'axis',
	            	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	            	        }
	            	    },
	            	    legend: {
						        data:['新增用户数量','原有用户数量','用户总数']
						 },
	            	 
	            	    grid: {
	            	        left: '3%',
	            	        right: '4%',
	            	        bottom: '3%',
	            	        containLabel: true
	            	    },
	            	    toolbox: {
	            	        show : true,
	            	        feature : {
	            	            mark : {show: true},
	            	            dataView : {show: true, readOnly: false},
	            	            magicType : {show: true, type: ['line', 'bar']},
	            	            restore : {show: true},
	            	            saveAsImage : {show: true}
	            	        }
	            	    },
	            	    calculable : true,
	            	    xAxis : [
	            	        {
	            	        	// 种类
	            	            type : 'category',
	            	            data : [data[6].lrrq,data[5].lrrq, data[4].lrrq, data[3].lrrq, data[2].lrrq, data[1].lrrq, data[0].lrrq]
	            	        }
	            	    ],
	            	    yAxis : [
	            	        {
	            	            type : 'value',
	            	            splitArea: {show: true}
	            	        }
	            	    ],
	            	    series : [
	            	        
	            	        {
	            	        	name:'原有用户数量',
	            	        	type:'bar',
	            	        	stack: '用户',
	            	        	data:[data[6].total-data[6].add,data[5].total-data[5].add, data[4].total-data[4].add, data[3].total-data[3].add, data[2].total-data[2].add, data[1].total-data[1].add, data[0].total-data[0].add]
	            	        },
	            	        {
	            	        	name:'新增用户数量',
	            	            type:'bar',
	            	            stack: '用户',
	            	            data:[data[6].add,data[5].add, data[4].add, data[3].add, data[2].add, data[1].add, data[0].add]
	            	        },
	            	        {
	            	        	name:'用户总数',
	            	        	type:'bar',
	            	        	data:[data[6].total,data[5].total, data[4].total, data[3].total, data[2].total, data[1].total, data[0].total]
	            	        }
	            	    ]
	            	};
	            

	            myChart.setOption(option); 
		        
	        } 
    );
}

function test(data){
	return [4,4, 5, 5, 6, data[1].count, data[0].count]
}
function ordersDays(data){
	var webroot = document.location.href;
	webroot = webroot.substring(0, webroot.indexOf("/blhrb"));
	
	 require.config({
         paths: {
             echarts: 'http://echarts.baidu.com/build/dist'
         }
     });
	
	require(
	        ['echarts','echarts/chart/bar','echarts/chart/line'],
	        function (ec) {

	            // 基于准备好的dom，初始化echarts图表
	            var myChart = ec.init(document.getElementById('main')); 
	            
	             var option = {
	            	    title : {
	            	        text: '订单统计',
	            	       
	            	    },
	            	    tooltip : {
	            	        trigger: 'axis',
	            	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	            	        }
	            	    },
	            	    legend: {
						        data:['新增订单数量','原有订单数量','订单总数']
						 },
	            	 
	            	    grid: {
	            	        left: '3%',
	            	        right: '4%',
	            	        bottom: '3%',
	            	        containLabel: true
	            	    },
	            	    toolbox: {
	            	        show : true,
	            	        feature : {
	            	            mark : {show: true},
	            	            dataView : {show: true, readOnly: false},
	            	            magicType : {show: true, type: ['line', 'bar']},
	            	            restore : {show: true},
	            	            saveAsImage : {show: true}
	            	        }
	            	    },
	            	    calculable : true,
	            	    xAxis : [
	            	        {
	            	        	// 种类
	            	            type : 'category',
	            	            
	            	            data : [data[6].lrrq,data[5].lrrq, data[4].lrrq, data[3].lrrq, data[2].lrrq, data[1].lrrq, data[0].lrrq]
	            	        }
	            	    ],
	            	    yAxis : [
	            	        {
	            	            type : 'value',
	            	            splitArea: {show: true}
	            	        }
	            	    ],
	            	    //legend 's data
	            	    series : [
								{
									name:'原有订单数量',
									type:'bar',
									stack: '订单',
									data:[data[6].total-data[6].add,data[5].total-data[5].add, data[4].total-data[4].add, data[3].total-data[3].add, data[2].total-data[2].add, data[1].total-data[1].add, data[0].total-data[0].add]
								},
								{
									name:'新增订单数量',
								    type:'bar',
								    stack: '订单',
								    data:[data[6].add,data[5].add, data[4].add, data[3].add, data[2].add, data[1].add, data[0].add]
								},
								{
									name:'订单总数',
									type:'bar',
									data:[data[6].total,data[5].total, data[4].total, data[3].total, data[2].total, data[1].total, data[0].total]
								}
	            	    ]
	            	};
	            

	            myChart.setOption(option); 
		        
	        } 
    );
}

function test(data){
	 // 路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('main')); 
            option = {
            	    title : {
            	        text: '会员统计',
            	        //subtext: '纯属虚构'
            	    },
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    /* legend: {
            	        data:['蒸发量','降水量']
            	    }, */
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {show: true, type: ['line', 'bar']},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    xAxis : [
            	        {
            	            type : 'category',
            	            data : [data[6].lrrq,data[5].lrrq, data[4].lrrq, data[3].lrrq, data[2].lrrq, data[1].lrrq, data[0].lrrq]
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'会员统计',
            	            type:'bar',
            	            
            	            data:[data[6].count,data[5].count, data[4].count, data[3].count, data[2].count, data[1].count, data[0].count]
            	            
            	            
            	        }
            	        
            	    ]
            	};
            	                    
            	                    
            	                    
            // 为echarts对象加载数据 
            myChart.setOption(option); 
        }
    );
}
</script>
</body>
</html>