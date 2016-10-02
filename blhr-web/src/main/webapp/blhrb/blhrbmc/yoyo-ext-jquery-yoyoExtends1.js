var yoyoExtend = function($) {
    $.prototype.serializeObject=function(){
        var a,o,h,i,e;
        a=this.serializeArray();
        o={};
        h=o.hasOwnProperty;

        var h1 = function(p1, p2, p3){
            var i = p2.indexOf(".");
            if (i >= 0) {
                var i1 = p2.substring(0, i).trim();
                if (i1.length > 0) {
                    if (!h.call(p1, i1)) {
                        p1[i1] = {};
                    }

                    if (i + 1 < p2.length) {
                        h1(p1[i1], p2.substring(i + 1), p3);
                    }
                }
            } else {
                if (!h.call(p1, p2)) {
                    if (p2.substring(p2.length - 2) == '[]') {
                        p2 = p2.substring(0, p2.length - 2).trim();
                        if (!h.call(p1, p2)) {
                            p1[p2] = [];
                        }
                        p1[p2].push(p3);
                    } else {
                        p1[p2] = p3;
                    }
                } else {
                    if (!(p1[p2] instanceof Array)) {
                        var aa = [];
                        aa.push(p1[p2]);
                        p1[p2] = aa;
                    }

                    p1[p2].push(p3);
                }
            }
        };

        for(i=0;i<a.length;i++){
            e=a[i];
            e.name = e.name.trim();
            e.value = e.value.trim();
            h1(o, e.name, e.value);
        }

        var h2 = function (o, n, v) {
            var i = n.indexOf("[");
            if (i >= 0) {
                delete o[n];
                var i1 = n.substring(0, i).trim();
                if (!h.call(o, i1)) {
                    o[i1] = [];
                }
                o[i1].push(v);
            }
        }

        var h3 = function(o){
            if (o instanceof Array) {
                $.each(o, function (i) {
                    h3(o[i]);
                });
            } else if (o instanceof Object) {
                $.each(o, function (n, v) {
                    if (v instanceof Array) {
                        h3(v[i]);
                    } else if (v instanceof Object) {
                        h3(v);
                    }
                    h2(o, n, v);

                });
            }
        };

        h3(o);

        return o;
    };

    $.prototype.clearValue = function () {
        $(this).find('input, textarea').val('');
        $(this).find("select").each(function (e) {
            $(this).val($(this).find("option:first").val())
        });
    };

    $.extend({
        postJSON: function(url, data, callback) {
            return jQuery.ajax(url, {
                type: 'post',
                data: data,
                dataType: "json",
                success: callback
            });
        }
    });
}

!function(t){t.fn.jFormFill=function(){function e(e,a){var i=e.find("input,select,textarea").length;e.find("input,select,textarea").each(function(l){var r=t(this)[0].hasAttribute("name")?t(this).attr("name"):"",n=a[r],s=t(this).attr("name");if(t(this).is(":radio"))t('[name="'+s+'"][value="'+n+'"]').prop("checked",!0);else if(t(this).is(":checkbox"))if("array"==typeof n||"object"==typeof n)for(var h in n)t('[name="'+s+'"][value="'+n[h]+'"]').prop("checked",!0);else t('[name="'+s+'"][value="'+n+'"]').prop("checked",!0);else void 0!=n&&t(this).val(n);l==i-1&&e.trigger({type:"jform.fill"})})}var a=t(this),i="",l=!1;1==arguments.length&&(i=arguments[0]);var r=(new Date).valueOf();if(""!=i)"object"==typeof i?e(t(this),i):"string"==typeof i&&t.getJSON(i,function(t){e(a,t)});else{var n=t(this).find("input,select,textarea").length,s=t(this)[0].hasAttribute("data-fillid")?t(this).attr("data-fillid"):"jformfill"+r;t(this).attr("data-fillid",s),(t(this)[0].hasAttribute("data-live-fill")&&1==t(this).attr("data-live-fill")||"true"==t(this).attr("data-live-fill"))&&(l=!0),t(this).find("input,select,textarea").each(function(e){var a=t(this).attr("name"),i=t(this)[0].hasAttribute("data-fill")?t(this).attr("data-fill"):"";if(""!=i)if(l&&t('[name="'+i+'"]').attr("data-livefill",s),t(this).is(":radio")){var r=t('[name="'+i+'"]:checked').val();t('[name="'+a+'"][value="'+r+'"]').prop("checked",!0)}else if(t(this).is(":checkbox")){var r=t(this).attr("value");t('[name="'+i+'"][value="'+r+'"]').is(":checked")?t('[name="'+a+'"][value="'+r+'"]').prop("checked",!0):t('[name="'+a+'"][value="'+r+'"]').prop("checked",!1)}else{var h=t('[name="'+i+'"]').val();t(this).val(h)}e==n-1&&t(this).trigger({type:"jform.fill"})})}},t("body").on("change","[data-livefill]",function(){var e=t(this).attr("data-livefill");t('[data-fillid="'+e+'"]').jFormFill()})}(jQuery);