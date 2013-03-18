$(function(){
	
	var question_add = {
		'init' : function() {			
			this.questions_added = {};
		},
		'add' : function() {
			var id = $('#question_selector option:selected').val(),
			  question_text = $('#question_selector option:selected').text();
  			if (this.check(id)) {
				this.questions_added[id] = question_text;
				this.display(id,question_text);
			}  else {
				console.log("Question added already");
			}
		},
		'remove' : function(id) {
			$('#delete_'+id).remove();
			$('.hidden'+id).remove();
			delete this.questions_added[id];
		},
		'check' : function(id){
			return (this.questions_added[id] == undefined);
		},
		'display' : function(id, question_text) {
			var self = this;			
			var hidden_tag = '<input type="hidden"' +  
				'class=\"hidden_' + id + '\"' + 
				'name=\"question_group_questions[question_ids][]\"' + 
				'value=\"' + id	 + 
				'\"> ';
			$('#question_group_questions').append(hidden_tag);
			$('.question_list').append(
				$('<h5 id=\"delete_' + id + '\">' + question_text + ' <a id=\"remove\">[x]</a> </h5>')
					.on('click', function() {
						self.remove(id);
					}
				)
			);
		}
	};
	question_add.init();
	
	$('.add_question_button').on('click', function(e) {
		e.preventDefault();
		question_add.add();
	});
}
);