class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.date :birthdate
      t.string :birthplace
      t.string :gender
      t.string :address
      t.string :status
      t.string :student_id
      t.integer :user_id
      t.string :religion

      t.string :father_name
      t.string :father_address
      t.string :father_contact
      t.date  :father_birthdate
      t.string :father_occupation

      t.string :mother_name
      t.string :mother_address
      t.string :mother_contact
      t.date  :mother_birthdate
      t.string :mother_occupation

      t.timestamps null: false
    end
  end
end
