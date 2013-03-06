class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.references :answer
      t.references :categories
      t.string :type

      t.timestamps
    end
    add_index :questions, :answer_id
    add_index :questions, :categories_id
  end
end
