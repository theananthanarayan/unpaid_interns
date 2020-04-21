class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|                                           
    end
  end
  def down
    drop_table :conversations
  end
end
