class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.float :weight_initial
      t.float :weight_goal
      t.float :height
      t.integer :age

      t.timestamps
    end
  end
end
