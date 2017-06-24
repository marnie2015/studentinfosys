class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.date :birthdate
      t.string :gender
      t.string :address_1
      t.string :address_2
      t.string :contact_1
      t.string :contact_2
      t.string :status
      t.string :student_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
