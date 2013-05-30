class AddQuestionGroupIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :question_group_id, :integer
  end
end
