(function($) {
	
	$(function(){
		function animateContent() {	
			$('.content').animate({
				opacity: 1,
				left: '+=500'
			},1000);
		}
		animateContent();
	});
})(jQuery)