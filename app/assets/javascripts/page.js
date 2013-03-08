(function($) {
	
	$(function(){
		function animateContent() {	
			$('h1').animate({
				left: '0px',
			},1000);
			$('.content').animate({
				opacity: 1,
			},1000);
		}
		animateContent();
	});
})(jQuery)