$(function(){
	var question_add = {
		'init' : function() {			
			this.questions_added = {};
		},
		'add' : function() {
			var id = $('#question_group_questions option:selected').val(),
			  question_text = $('#question_group_questions option:selected').text();
  			if (this.check(id)) {
				this.questions_added[id] = question_text;
				this.display();
			}  else {
				console.log("Question added already");
			}
		},
		'check' : function(id){
			return (this.questions_added[id] == undefined);
		},
		'display' : function() {
			var string = "";
			for (var i in this.questions_added) {
				string += " \" " + this.questions_added[i] + "\", ";
			}
			$('.questions_list').text(string);
		}
	};
	question_add.init();
	
	$('.add_question_button').on('click', function(e) {
		e.preventDefault();
		question_add.add();
	});		
}
);