class CreateStudentYearSections < ActiveRecord::Migration
  def change
    create_table :student_year_sections do |t|
      t.references :student, index: true, foreign_key: true
      t.references :year_level, index: true, foreign_key: true
      t.references :section, index: true, foreign_key: true
      t.string :school_year

      t.timestamps null: false
    end
  end
end
