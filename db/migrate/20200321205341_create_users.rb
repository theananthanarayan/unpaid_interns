class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :studentID
      t.string :password
      t.string :email
    end
  end
  def down
    drop_table :users
  end
end
