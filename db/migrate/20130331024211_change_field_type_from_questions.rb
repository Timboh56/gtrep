class ChangeFieldTypeFromQuestions < ActiveRecord::Migration
  def up
    change_column :questions, :question_type, :integer
  end

  def down
  end
end
