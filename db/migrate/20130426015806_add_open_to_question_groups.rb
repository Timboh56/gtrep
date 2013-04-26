class AddOpenToQuestionGroups < ActiveRecord::Migration
  def change
    add_column :question_groups, :open, :boolean
  end
end
