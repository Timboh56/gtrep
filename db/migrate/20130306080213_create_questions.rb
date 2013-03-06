class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.references :category
      t.string :type

      t.timestamps
    end
  end
end
