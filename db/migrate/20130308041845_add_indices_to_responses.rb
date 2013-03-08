class AddIndicesToResponses < ActiveRecord::Migration
  def change
      add_index :responses, [:user_id, :question_id], :unique => true
  end
end
