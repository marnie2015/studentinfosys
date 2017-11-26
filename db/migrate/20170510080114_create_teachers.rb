class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.references :position, index: true, foreign_key: true
      t.references :subject
      t.references :room
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
