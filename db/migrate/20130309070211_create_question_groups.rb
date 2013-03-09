class CreateQuestionGroups < ActiveRecord::Migration
  def change
    create_table :question_groups do |t|
      t.string :name
      t.integer :user_id
      t.integer :question_groups_type

      t.timestamps
    end
  end
end
