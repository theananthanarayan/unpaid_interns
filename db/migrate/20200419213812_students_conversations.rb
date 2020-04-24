class StudentsConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :students_conversations, :id => false do |t|
      t.integer :student_id
      t.integer :conversation_id
    end
  end
  def down
    drop_table :students_conversations
  end
end
