$(document).ready(function() {

	$(".main_image").touchSlider({
		flexible: true,
		speed: 200,
		paging: $(".flicking_con a"),
		counter: function(e) {
			$(".flicking_con a").removeClass("on").eq(e.current - 1).addClass("on");
		}
	});
	$(".main_image").bind("mousedown", function() {
		$dragBln = false;
	});
	$(".main_image").bind("dragstart", function() {
		$dragBln = true;
	});
	$(".main_image a").click(function() {
		if ($dragBln) {
			return false;
		}
	});
	var timer = setInterval(function() {
		for (var i = 0; i < $(".flicking_con a").length; i++) {
			if ($(".flicking_con a").eq(i).hasClass("on")) {
				$(".flicking_con a").eq((i + 1) >= $(".flicking_con a").length ? 0 : i + 1).click();
				return false;
			}
		}
	}, 3000);
	$(".main_visual").hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(function() {
			for (var i = 0; i < $(".flicking_con a").length; i++) {
				if ($(".flicking_con a").eq(i).hasClass("on")) {
					$(".flicking_con a").eq((i + 1) >= $(".flicking_con a").length ? 0 : i + 1).click();
					return false;
				}
			}
		}, 3000);
	});
	$(".main_image").bind("touchstart", function() {
		clearInterval(timer);
	}).bind("touchend", function() {
		timer = setInterval(function() {
			for (var i = 0; i < $(".flicking_con a").length; i++) {
				if ($(".flicking_con a").eq(i).hasClass("on")) {
					$(".flicking_con a").eq((i + 1) >= $(".flicking_con a").length ? 0 : i + 1).click();
					return false;
				}
			}
		}, 3000);
	});
	});