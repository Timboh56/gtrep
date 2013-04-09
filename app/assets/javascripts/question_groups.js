$( function() {
   var questions_detected = {};
	
   // detect for edit page; detect for whether there are already hidden input tags	
   // each representing a question of the question group being edited
   // they will appear under question_group_questions field div
   $('input[name^="question_group_questions[question_ids][]"]').each( function(i,e) {
        var id = $(this).attr('id');
        questions_detected[id] = $('#'+id).html();
    });

    dyn_elements_interface.init(questions_detected);

    $('.add_question_button').on('click', function(e) {
      e.preventDefault();
      dyn_elements_interface.add();
	});
  }
);
