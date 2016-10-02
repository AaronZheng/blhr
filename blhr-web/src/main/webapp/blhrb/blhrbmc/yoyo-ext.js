/**
 * Created by wenjie on 16/6/3.
 */
(function (document, window, $) {
    'use strict';
    yoyoExtend($);
    var Site = window.Site;
    $(document).ready(function () {
        Site.run();

        $.fn.datepicker.dates['zh-CN'] = {
            days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
            daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
            months: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
            monthsShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
            today: "今天",
            suffix: [],
            clear: "清空",
            meridiem: ["上午", "下午"],
            titleFormat: "yyyy-MM"
        };

        $.fn.dataTable.ext.errMode = 'none';

        alertify.theme('bootstrap');
        alertify.okBtn('确认');
        alertify.cancelBtn('取消');

        var defaults = $.components.getDefaults("dataTable");
        $.extend(true, defaults, defaults, {
            "iDisplayLength": 10,
            "bSort" : false,
            "language": {
                "sSearchPlaceholder": "搜索...",
                "sProcessing": "处理中...",
                "sLengthMenu": "共 _MENU_ 条",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "第_PAGE_页 ，共_PAGES_页",
                "sInfoEmpty": "共 _TOTAL_ 条",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "",
                "sUrl": "",
                "sEmptyTable": "无数据",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 升序",
                    "sSortDescending": ": 降序"
                }
            },
        });
    });
    $('#logout').click(function () {
        var logoutUrl = $(this).attr('logoutUrl');
        var successUrl = $(this).attr('successUrl');
        alertify.confirm("确定退出？", function () {
            $.postJSON(
                logoutUrl,
                {},
                function (retJson) {
                    if (retJson.errno == 0) {
                        location.href = successUrl;
                    } else {
                        alertify.alert("提示", retJson.errmsg);
                    }
                }
            )
        });
    });
})(document, window, jQuery);

var initClipboard = function(){
    var clipIdBtns = document.querySelectorAll('[copyId]');
    var clipboard = new Clipboard(clipIdBtns);

    clipboard.on('success', function(e) {
        toastr.success(e.text+'已经复制到剪切板');
    });

    clipboard.on('error', function(e) {
        YoYoTip.alert('',JSON.stringify(e));
    });
    $("[data-toggle='tooltip']").tooltip();
}

Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(), //day
        "h+" : this.getHours(), //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter
        "S" : this.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o) {
        if(new RegExp("("+ k +")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;
}