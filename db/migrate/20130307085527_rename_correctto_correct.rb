class RenameCorrecttoCorrect < ActiveRecord::Migration
  def up
    rename_column :answers, :correct?, :correct
  end

  def down
  end
end
