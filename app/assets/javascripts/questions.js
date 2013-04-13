$(function(){
	
	$('#question_question_type').change(function() {
		$('.add_answers').empty();
		
		var selected = $('#question_question_type option:selected').val();
		
		if (selected == '2' ) {
			$.ajax({
				type: 'GET',
				url: '',
				complete: function(data) {
				    $('.add_answers').append(data.responseText);
				}
			});
		}
	});
	
	$('.add_answer_button').click(function () {
	  
	
	
	});
	
	var answer_selected = $('#answer_selector option:selected').val();



});