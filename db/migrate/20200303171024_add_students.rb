class AddStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.integer :classYear
      t.string :advisor
      t.text :intro
      t.string :research, array: true
      t.string :colleagues, array: true
      t.string :careers, array: true
      t.string :profilePic
    end
  end
  
  def down
    drop_table :students
  end
end
