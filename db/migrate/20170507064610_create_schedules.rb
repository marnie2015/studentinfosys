class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :year_level, index: true, foreign_key: true
      t.references :section, index: true, foreign_key: true
      t.references :teacher
      t.string :school_year
      t.string :description
      t.string :schedule_day
      t.string :schedule_time

      t.timestamps null: false
    end
  end
end
