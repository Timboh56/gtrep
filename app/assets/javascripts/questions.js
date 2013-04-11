$(function(){
	
	$('#question_question_type').change(function() {
		$('.answers_added').empty();
		
		var selected = $('#question_question_type option:selected').val();
		
		if (selected == '2' ) {
			$.ajax({
				type: 'GET',
				url: '',
				complete: function(data) {
				    $('.answers_added').append(data.responseText);
				}
			});
		}
	});



});