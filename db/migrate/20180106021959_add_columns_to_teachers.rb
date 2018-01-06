class AddColumnsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :philhealth, :string
    add_column :teachers, :tin, :string
    add_column :teachers, :sss, :string
    add_column :teachers, :address, :string
    add_column :teachers, :gender, :string
    add_column :teachers, :contact_number, :string
    add_column :teachers, :image, :string
  end
end
