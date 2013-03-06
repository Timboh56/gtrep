class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.reference :categories
      t.string :type

      t.timestamps
    end
  end
end
