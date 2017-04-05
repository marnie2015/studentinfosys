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
      t.string :user_name
      t.string :user_pass
      t.string :status

      t.timestamps null: false
    end
  end
end
