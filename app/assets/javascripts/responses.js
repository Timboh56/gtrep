$(function(){
	$('#response_question_group_id').change(function(){
		
		// empty questions class
		$('.questions').empty();
		
		var selected = $('#response_question_group_id option:selected').val();
		if (selected != ""){
			$.ajax({
				type: 'GET',
				dataType: 'json',
				data: { question_group_id: '' + $('#response_question_group_id option:selected').val() },
				url: '',
				success: function(data) {
					for (var question in data['answers']) {
						var question_id = question[0];
						$('.questions').append(' <h5> ' + data['question_group_questions'][question]['text'] + '</h5><br />');
						
						// detect for open ended questions
						if (data['question_group_questions'][question]['question_type'] == 0) {
							
							// detect if question has no answers
							if (data['answers'][question][1].length == 0) {
						      $('.questions').append("<b>This question has no answers yet</b> <br />");
						    }
							
							// for each answer of the multiple choice question
							for (var ans in data['answers'][question][1]) {
								$('.questions').append('<b> ' + data['answers'][question][1][ans]['text'] + '</b><br />');
							}
						} else {
							$('.questions').append('<input type=\'text\' name=\'' + question + '\' /><br />');		
						}
						
					}
					console.log('somethings');
				}
			});
		}
	});
});