
    function scCourse(baseDir,courseId,userId){
    	$.ajax({
			type : "POST",
			async : false,
			url : baseDir+"/scCourse",
			data : {
				"courseId" : courseId,
				"userId" : userId
			},
			error : function(request) {
				alert("内容发送失败!");
			},
			success : function(data) {
				if("1" != data)
					alert("课程收藏失败!");
				else{
					alert("课程收藏成功!");
				}
					
			}
		});
    }


$(document).ready(function() {

	shower();
	$(".xxdjt_jt").click(function() {
		var texthtm = $('.l_content_coonn .kjgyfuy:first-child').html();
		$(".l_content_coonn").prepend('<div class="kjgyfuy"></div>')
		$(".kjgyfuy:first-child").prepend(texthtm);
		var hyone = setInterval(shown, 600);
		$(".qqvoice").on("click", function() {
			$(this).toggleClass("qqvoice_showandhide");
			if($(this).hasClass("qqvoice_showandhide")) {
				$(this).find(".voice_moveooo").hide().siblings().show();
				$(this).find("em").hide();
			} else {
				$(this).find(".voice_move").hide().siblings().show();
			}
		});

		function shown() {
			$(".voice_move").css("width", "3px").animate({
				"width": 15 + "px"
			}, 600, function() {
				$(".voice_move").css("width", "3px");
			});
		}
	});
	$(".ke_wod span").click(function() {
		var i = $(this).index();
		$(this).addClass("ke_wod_ace").siblings().removeClass("ke_wod_ace");
		$(".ke_wodconn").eq(i).show().siblings().hide();
	});
	$(".learningDiv").show();
	$(".allzbkcDiv").hide();
	$(".learn").click(function() {
		$(".learn").addClass("san_hh");
		$(".allkc").removeClass("san_hh");
		$(".learningDiv").show();
		$(".allzbkcDiv").hide();
	});
	$(".allkc").click(function() {
		$(".learn").removeClass("san_hh");
		$(".allkc").addClass("san_hh");
		$(".allzbkcDiv").show();
		$(".learningDiv").hide();
	});
/*
	$(".ke_kcfl .ls_san").html($(".ke_kcfl_dexiala p").eq(1).html());
	$(".ke_kcfl ul li").click(function() {
		$(".ke_kcfl_dexiala").slideToggle();
	});
*/
	$(".ke_kcfl_dexiala p").click(function() {
		$(".ke_kcfl .ls_san").html($(this).html());
		$(".ke_kcfl_dexiala").slideToggle();
	});

	$(".foot_footleft").click(function() {
		$(this).parents(".foot_foot").hide().siblings().show();
	});

	var flag = false;
	$(".fuzhi_box a").on("touchstart", function(e) {
		event.preventDefault();
		flag = true;
		if(flag == true) {
			$(".speak_show").show();
			$(".fuzhi_box").find("a").html("松开 结束");

		}
		return false;
	});
	$(".fuzhi_box a").on("touchend", function(e) {
		event.preventDefault();
		flag = false;
		if(flag == false) {
			$(".speak_show").hide();
			$(".fuzhi_box").find("a").html("按住 说话");
		}
		return false;

	});

	$(".san_immg").click(function() {
		$(this).toggleClass("xs_xx");
		if($(this).hasClass("xs_xx")) {
			$(this).html("&and;");
		} else {
			$(this).html("&or;");
		}
	});

/*	$(".push_hit").on("taphold", function(e) {
		$(this).parents(".qqsky").find("ul").fadeIn(300);
		var hu=$(this).siblings("img").attr("src");
		$(this).parents(".push_hitinnner").siblings("ul").find(".hujigyft img").attr("src",hu);
	});*/
/*	$(".push_hitoonnee").on("click", function(e) {
		$(this).parents(".qqsky").find("ul").fadeIn(300);
		var hu=$(this).siblings("img").attr("src");
		$(this).parents(".push_hitinnner").siblings("ul").find(".hujigyft img").attr("src",hu);
	});*/
/*	$(".qqvoice,.qqsky").on("taphold", function(e) {
		$(this).find("ul").fadeIn(300);
		
	});*/
	/*$(document).on("touchstart", function(e) {
		flag = true;
		if(flag == true) {
			$(".qqsky").find("ul").fadeOut(300);

		}
	});*/

	var hy = setInterval(shuwntwo, 600);
	var hyone = setInterval(shown, 600);
	$(".qqvoice").bind("click", function() {
		$(this).toggleClass("qqvoice_showandhide");
		if($(this).hasClass("qqvoice_showandhide")) {
			$(this).find(".voice_moveooo").hide().siblings().show();
			$(this).find("em").hide();
		} else {
			$(this).find(".voice_move").hide().siblings().show();
		}
	});

	function shuwntwo() {
		$(".speak_show_right_con").animate({
			"height": 85 + "px"
		}, 600, function() {
			$(".speak_show_right_con").css("height", "8px");
		});
	}

	function shown() {
		$(".voice_move").css("width", "3px").animate({
			"width": 15 + "px"
		}, 600, function() {
			$(".voice_move").css("width", "3px");
		});
	}

});
$(window).resize(function() {
	shower();
});

function shower() {
	var hei = $(window).height(),
		wid = $(window).width();
	$(".pay_shouone,.pay_shoutwo,.log_show").css({
		"width": wid + "px",
		"height": hei + "px"
	});
	$(".ke_wodconn_top h3").css({
		"width": wid * 0.9 - 70 + "px",
	});

	$(".san_youb").css({
		"width": wid * 0.9 - 50 + "px",
	});
	var liwidth = $(".comment li").width();
	var myIcon = $(".myIcon").width();
	$(".text").css({
		"width": liwidth - myIcon - 10 + "px",
	});
	$(".qqright").css({
		"width": wid - 95 + "px",
	})
}