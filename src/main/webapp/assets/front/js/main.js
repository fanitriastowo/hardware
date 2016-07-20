/**
 * Main Javascript to all page
 */
jQuery(function($) {

	// goto top
	$('.gototop').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop : $("body").offset().top
		}, 500);
	});

});