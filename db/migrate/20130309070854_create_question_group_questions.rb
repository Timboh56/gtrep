class CreateQuestionGroupQuestions < ActiveRecord::Migration
  def change
    create_table :question_group_questions do |t|
      t.integer :question_id
      t.integer :question_group_id

      t.timestamps
    end
  end
end
