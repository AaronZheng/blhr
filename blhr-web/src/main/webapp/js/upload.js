 var uploader = "";

    function createUploader(url) {
        // 做大限制3MB，不过建议后端也做一下。
        var maxSize = 1024 * 1024 * 100;
        uploader = $("#fileup").uploadFile({
            url: url,
            maxFileCount: 500,
            multiple: false,
            autoSubmit: false,
            showFileCounter: false,
            fileName: "file",
            maxFileSize: maxSize,
            //allowedTypes:"uot,ofd",
            statusBarWidth: 400,
            dragdropWidth: 400,

            showStatusAfterSuccess: false,
            dragDropStr: "<span class='drag-title'><b>或拖放文件到此处</b></span>",
            abortStr: "终止",
            cancelStr: "删除",
            doneStr: "完成",
            multiDragErrorStr: "多文件拖放错误！",
            extErrorStr: "请选择正确上传格式！要求格式为：",
            maxFileCountErrorStr: '你当前操作太频繁：',
            sizeErrorStr: "字典文件大小大于上传限制:",
            uploadErrorStr: "上传错误！",
            onSubmit: function (files) {
                this.maxFileSize = maxSize;
            },
            onSuccess: function (files, data, xhr) {
            	getresdata(data);
            },
            onError: function (files, status, errMsg, pd, xhrResponseJSON) {
                var msg = '文件上传失败';
                alert(msg);
            }

        });
    }
