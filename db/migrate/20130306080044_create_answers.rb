class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.string :type
      t.bool :right
      t.references :questions

      t.timestamps
    end
    add_index :answers, :questions_id
  end
end
