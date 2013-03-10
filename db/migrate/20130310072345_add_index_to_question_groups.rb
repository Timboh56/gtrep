class AddIndexToQuestionGroups < ActiveRecord::Migration
  def up 
    add_index :question_groups, [:name]
  end

  def down
    remove_index :question_groups, [:name]
  end
end
