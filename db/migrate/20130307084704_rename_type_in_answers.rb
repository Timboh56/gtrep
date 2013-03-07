class RenameTypeInAnswers < ActiveRecord::Migration
  def up
    rename_column :answers, :type, :answer_type
  end

  def down
  end
end
