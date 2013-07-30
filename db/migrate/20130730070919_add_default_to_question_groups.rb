class AddDefaultToQuestionGroups < ActiveRecord::Migration
  def change
     change_column :question_groups, :open, :boolean, :default => false
  end
end
