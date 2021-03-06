class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :or_number
      t.float :amount
      t.string :school_year
      t.date :payment_date
      t.string :description
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
