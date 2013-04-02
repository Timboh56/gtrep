$(function(){
	
	var question_add = {
		'init' : function(obj) {
			
			// initialize questions_added to keep track of questions
			obj ? this.questions_added = obj : this.questions_added = {};
			
			// attach click event to initial questions (for edit page)
			for(var id in this.questions_added) 
				this.attachClick(id);
		},
		'add' : function() {
			var id = $('#question_selector option:selected').val(),
			  question_text = $('#question_selector option:selected').text();
  			if (this.check(id)) {
				this.questions_added[id] = question_text;
				this.display(id,question_text);
			}
		},
		'remove' : function(id) {
			$('#'+id+', .'+id).remove();
			delete this.questions_added[id];
		},
		'check' : function(id){
			return (this.questions_added[id] == undefined);
		},
		'display' : function(id, question_text) {
			var hidden_tag = '<input type="hidden"' +  
				'class=\"' + id + '\"' + 
				'name=\"question_group_questions[question_ids][]\"' + 
				'value=\"' + id	 + 
				'\"> ';
			$('#question_group_questions').append(hidden_tag);
			$('.question_list').append(
				$('<h5 id=\"' + id + '\">' + question_text + ' <a id=\"remove\">[x]</a> </h5>')
			);
			this.attachClick(id);			
		},
		'attachClick' : function(id) {
		  var self = this;
		  $('#'+id).click(function() {
			self.remove(id);
		  });
		}
	};
	
	var questions_detected = {};
	
	// detect for edit page; detect for whether there are already hidden input tags
	// each representing a question of the question group being edited
	// they will appear under question_group_questions field div
	$('input[name^="question_group_questions[question_ids][]"]').each( function(i,e) {
		var id = $(this).attr('id');
		questions_detected[id] = $('#'+id).html();
	});
	
	question_add.init(questions_detected);
	
	$('.add_question_button').on('click', function(e) {
		e.preventDefault();
		question_add.add();
	});
}
);