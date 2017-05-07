class CreateYearLevels < ActiveRecord::Migration
  def change
    create_table :year_levels do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
