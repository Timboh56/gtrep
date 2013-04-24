
	
dyn_elements_interface = (function () {
	return {
		'init' : function(obj,elem_name) {
			
			// initialize elements_added to keep track of questions
			obj ? this.elements_added = obj : this.elements_added = {};
			this.elem_name = elem_name
			
			// attach click event to initial questions (for edit page)
			for(var id in this.elements_added) 
				this.attachClick(id);
		},
		'add' : function() {
			
			// subject to change, in future this module
			// should take in any selector and corresponding
			// "add" buttons
			var id = $('#' + this.elem_name + '_selector option:selected').val(),
			  elem_text = $('#' + this.elem_name + '_selector option:selected').text();
			  
			// check if this question has already been added
  			if (this.check(id)) {
				this.elements_added[id] = elem_text;
				this.display(id,elem_text);
			}	
		},
		'remove' : function(id) {
			$('#'+id+', .'+id).remove();
			delete this.elements_added[id];
		},
		'check' : function(id){
			return (this.elements_added[id] == undefined);
		},
		'display' : function(id, question_text) {
			var hidden_tag = '<input type="hidden"' +  
				'class=\"' + id + '\"' + 
				'name=\"question_group_questions[question_ids][]\"' + 
				'value=\"' + id	 + 
				'\"> ';
			$('#question_group_questions').append(hidden_tag);
			$('.question_list').append(
				$('<h5 id=\"' + id + '\">' + question_text + ' <a class=\'remove_'+ id +'\'>[x]</a> </h5>')
			);
			this.attachClick(id);			
		},
		'attachClick' : function(id) {
		  var self = this;
		  $('.remove_' + id).click(function() {
			self.remove(id);
		  });
		}
	};
})();
	