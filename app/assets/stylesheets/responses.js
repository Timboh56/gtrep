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
						
						// templating
						var template = {
							text: data['question_group_questions'][question]['text'],
							
						};
					
					var question_type = data['question_group_questions'][question]['question_type'];
					var length = data['answers'][question][1].length;
					var answers = data['answers'][question][1];
					
					
					}
					console.log('somethings');
				}
			});
		} else {
			
		}
	});
	
	// inputAnswer returns either an input textarea tag, a set of radio buttons, or an error
	// message, depending on
	// whether the question posed is an open ended or multiple choice question
	function inputAnswer(text, answers) {
		
		// detect for multiple choice questions
		if (answers != null) {
			
			// detect if question has no answers
			if (answers.length == 0) {
		      return "This question has no answers yet";
		    } else {
				for (var ans in answers) {
					answers[ans]['text']
				}
			}
			
			// for each answer of the multiple choice question
			for (var ans in data['answers'][question][1]) {
				$('.questions').append('<b> ' + data['answers'][question][1][ans]['text'] + '</b><br />');
			}
		} else {
			$('.questions').append('<input type=\'text\' name=\'' + question + '\' /><br />');		
		}
		
	
	}
});