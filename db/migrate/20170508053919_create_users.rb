class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_pass
      t.string :status
      t.integer :access
      
      t.timestamps null: false
    end
  end
end
