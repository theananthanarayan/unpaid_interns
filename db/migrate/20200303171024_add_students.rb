class AddStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.integer :classYear
      t.string :Advisor
      t.text :description
      t.string :profilePic
    end
  end
  
  def down
    drop_table :students
  end
end
