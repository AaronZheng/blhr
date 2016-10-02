$(function () {
    var transStatus = function(status){
        var text = '已下线';
        if (status == '1') {
            text = '<span class="text-danger">已上线</span>';
        }
        return text;
    }
    var listData;
    var defaults = $.components.getDefaults("dataTable");
    var options = $.extend(true, {}, defaults, {
        "iDisplayLength": 10,
        keys: false,
        "bSort" : false,
        "dom": 't<"row"<"col-xs-12 col-md-6"i><"col-xs-12 col-md-6"p>>',
        columns: [
            {
                "data": function (source, type, val) {
                    return '<img class="order-img" src="'+source.pic+'" style="max-width: 60px;max-height: 60px;">';
                }
            },
            {
                "data": function (source, type, val) {
                    return '<a src="' + source.content + '" target="_blank">链接</a>';
                }
            },
            {
                "data": function (source, type, val) {
                    return transStatus(source.status);
                }
            },
            {
                "data": function (source, type, val) {
                    return source.weight;
                }
            },
            {
                "data": function (source, type, val) {
                    return source.dataTime;
                }
            },
            {
                "data": function (source, type, val) {
                    //var btnText = '上线';
                    //if (source.status == '1') {
                    //    btnText = '下线';
                    //}
                    //var content = '<div class="btn-group dropdown">'
                    //    + '<button type="button" class="btn btn-outline btn-default btn-xs dropdown-toggle" id="opt_' + source._id + '"'
                    //    + 'data-toggle="dropdown" aria-expanded="false">'
                    //    + '操作'
                    //    + '<span class="caret"></span>'
                    //    + '</button>'
                    //    + '<ul class="dropdown-menu bullet" aria-labelledby="opt_' + source._id + '" role="menu">'
                    //    + '<li role="presentation"><a href="javascript:void(0)" opt_status banner_id="' + source._id + '" role="menuitem">' + btnText + '</a></li>'
                    //    + '</ul>'
                    //    + '</div>'
                    return '<button type="button" class="btn btn-flat btn-xs" data-target="#editFormModal" data-toggle="modal" opt_btn banner_id="' + source.id + '">编辑</button>';
                }
            },
        ],
        serverSide: true,
        ajax: {
            url: $('#listTable').attr('url'),
            data: function(data){
                //请求参数
                var filterData = {};
                filterData['pageNo'] = data['start'] / data['length'] + 1;
                filterData['pageSize'] = data['length'];
                return filterData;
            },
            dataFilter: function(dataString){
                var json = {};
                var retJson = jQuery.parseJSON( dataString );
                if (retJson.errno != 0) {
                    json.recordsTotal = 0;
                    json.recordsFiltered = 0;
                    json.data = [];
                    listData = [];
                    alertify.alert(retJson.errmsg);
                } else {
                    var pageBean = retJson.data;
                    json.recordsTotal = pageBean.totalDataCount;//数据总数
                    json.recordsFiltered = pageBean.totalDataCount;//当前记录数
                    if(pageBean.list == undefined) {
                        pageBean.list = [];
                    }
                    json.data = pageBean.list;//数据列表
                    listData = pageBean.list;
                }

                return JSON.stringify( json ); // return JSON string
            }
        },
        fnDrawCallback: function(){
            $('[opt_btn]').click(function(){
                var bannerId = $(this).attr('banner_id');
                if (bannerId && bannerId != '' && listData) {
                    for (var i = 0; i < listData.length; i++) {
                        if (listData[i].id == bannerId) {
                            editBanner(listData[i]);
                            break;
                        }
                    }
                }
            });
        }
    });

    var $dataTable = $('#listTable').dataTable(options);
    $("div.dataTables_info").css('position', 'relative');
    $("div.dataTables_info").css('z-index', '0');

    $('#editForm').formValidation({
        framework: "bootstrap",
        row: {
            valid: '',
            invalid: 'has-error'
        },
        fields: {
            content: {
                validators: {
                    notEmpty: {
                        message: 'url不能为空'
                    },
                    blank: {}
                }
            },
            status: {
                validators: {
                    notEmpty: {
                        message: '状态不能为空'
                    },
                    blank: {}
                }
            },
            weight: {
                validators: {
                    notEmpty: {
                        message: '权重不能为空'
                    },
                    blank: {}
                }
            },
        }
    }).on('success.form.fv', function (e) {
        e.preventDefault();

        var $form = $(e.target),
            fv = $form.data('formValidation');

        var url = $form.attr('action');
        var submitData = $form.serializeObject();

        if (!submitData.pic || submitData.pic == '') {
            toastr.error('请上传封面', '', {
                positionClass:'toast-top-center',
                timeOut: 1000,
            });
            fv.resetForm();
            return;
        }

        $.postJSON(
            url,
            submitData,
            function (retJson) {
                if (retJson.errno == 0) {
                    toastr.error('操作成功', '', {
                        positionClass: 'toast-top-center',
                        timeOut: 1000,
                    });

                    $('#editFormModal').modal('hide');
                    $dataTable.fnFilter();
                } else {
                    toastr.error(retJson.errmsg, '', {
                        positionClass: 'toast-top-center',
                        timeOut: 1000,
                    });
                }
            }
        ).always(function () {
                fv.resetForm();
            });

    });


    var editBanner = function (banner) {
        if (!banner) {
            banner = {
                "pic": "",
                "content": "",
                "status": "0",
                "weight": 50,
                "id": ""
            };

        }
        $('#editForm').jFormFill(banner)
        $('#editForm').find('#pic-show-img').attr('src', banner.pic);
    }

    $('#newBannerBtn').click(function(){
        editBanner(null);
    });

    $('#editFormModal').on('hide.bs.modal', function () {
        editBanner(null);
        var fv = $('#editForm').data('formValidation');
        fv.resetForm();
    })

});