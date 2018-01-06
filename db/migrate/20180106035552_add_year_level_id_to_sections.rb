class AddYearLevelIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :year_level_id, :integer
  end
end
