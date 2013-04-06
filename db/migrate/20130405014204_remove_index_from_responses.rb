class RemoveIndexFromResponses < ActiveRecord::Migration
  def up
    remove_index :responses, :name => :index_responses_on_answer_id
  end

  def down
  end
end
