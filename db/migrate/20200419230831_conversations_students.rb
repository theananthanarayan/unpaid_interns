class ConversationsStudents < ActiveRecord::Migration[5.0]
 def change
    create_table :conversations_students, :id => false do |t|
      t.integer :student_id
      t.integer :conversation_id
    end
  end
  def down
    drop_table :conversations_students
  end
end
